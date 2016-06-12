//
//  RfbSearchMoviesVC.m
//  RfbMovies
//
//  Created by Koray Metin on 12/06/16.
//  Copyright © 2016 Koray Metin. All rights reserved.
//

#import "RfbSearchMoviesVC.h"

#import "SearchMovieCell.h"
#import "JMSearchMovie.h"

#import "RfbMovieService.h"

#define LIMIT @"10"

@interface RfbSearchMoviesVC ()
{
    NSInteger pageNumber;
    NSString *queryString;
    bool allDataIsLoad;
}

@property(nonatomic,weak) IBOutlet UITableView *tableView;

@property(nonatomic,strong) NSMutableArray *searchResults;
@property(nonatomic,strong) UIActivityIndicatorView *spinner;

@end

@implementation RfbSearchMoviesVC


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.searchResults = [[NSMutableArray alloc] init];
    
    self.spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [self.spinner startAnimating];
    self.spinner.frame = CGRectMake(0, 0, self.tableView.frame.size.width, 44);
    self.tableView.tableFooterView = self.spinner;

}


#pragma mark - TableView Delegate&DataSource Methods
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewAutomaticDimension;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewAutomaticDimension;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.searchResults.count;
}

- (void)configureCell:(SearchMovieCell*)cell atIndexPath:(NSIndexPath *)indexPath
{
    JMSearchMovie *movie = self.searchResults[indexPath.row];
    [cell setSearchMovie:movie];
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SearchMovieCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"SearchMovieCell" forIndexPath:indexPath];
    [self configureCell:cell atIndexPath:indexPath];
    return cell;
}

#pragma mark - Load More Listener
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    float endScrolling = scrollView.contentOffset.y + scrollView.frame.size.height;
    if (endScrolling >= scrollView.contentSize.height-_spinner.frame.size.height)
    {
        /**
         *  When search result count less than 10 , allIsLoad is false (Lock the request action)
         */
        if (!allDataIsLoad)
        {
            pageNumber+=1;
            [self searchMovies:queryString withSearchPage:pageNumber isPaging:true];
        }
    }
}


#pragma mark - Search Movies Method
/**
 *  If user searches movie, paging = false. Load more action , paging = true
 */
- (void)searchMovies:(NSString*)query withSearchPage:(NSInteger)page isPaging:(bool)paging
{
    queryString = query;
    
    
    if (!paging)
    {
        page = pageNumber = 0;
        allDataIsLoad = false;
    }
    
    [[RfbMovieService sharedInstance] getSearchResults:queryString withSearchPage:page withComletion:^(bool success, NSMutableArray *moviesArr) {
        
        if (success)
        {
            /**
             * If paging = true, app sets the new results with add existing array and load more action is working in there
             *
             * If paging = false, app sets the new results with new allocated array
             */
            if (paging)
            {
              [self.searchResults addObjectsFromArray:moviesArr];
            }
            else
            {
                self.searchResults = [[NSMutableArray alloc] initWithArray:moviesArr];
            }

            if (moviesArr.count < 10)
            {
                allDataIsLoad = true;
                self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
            }
            else
            {
                allDataIsLoad = false;
                self.tableView.tableFooterView = self.spinner;
            }
            
            [self.tableView reloadData];
        }
        
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
