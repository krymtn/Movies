//
//  RfbMoviesVC.m
//  RfbMovies
//
//  Created by Koray Metin on 06/06/16.
//  Copyright © 2016 Koray Metin. All rights reserved.
//

#import "RfbMoviesVC.h"
#import "MovieCell.h"
#import "JMPopularMovie.h"
#import "RfbMovieService.h"

#define LIMIT @"10"

@interface RfbMoviesVC ()
{
    NSInteger pageNumber;
}

@property(nonatomic,weak) IBOutlet UITableView *tableView;
@property(nonatomic,strong) NSMutableArray *moviesArr;

@end

@implementation RfbMoviesVC

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationItem.title = @"Movies";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    /**
     *  Add spinner in tableview footer.
     */
    UIActivityIndicatorView *spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [spinner startAnimating];
    spinner.frame = CGRectMake(0, 0, self.tableView.frame.size.width, 44);
    self.tableView.tableFooterView = spinner;
    
    /**
     *  Allocate array & set page number default as 1 (Read Trakt.tv API documentation)
     */
    self.moviesArr = [[NSMutableArray alloc] init];
    pageNumber = 1;
    [self getMoviesWithPageNumber:pageNumber];
    
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
    return self.moviesArr.count;
}

- (void)configureCell:(MovieCell*)cell atIndexPath:(NSIndexPath *)indexPath
{
    JMPopularMovie *movie = self.moviesArr[indexPath.row];
    [cell setPopularMovie:movie];
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MovieCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"MovieCell" forIndexPath:indexPath];
    [self configureCell:cell atIndexPath:indexPath];
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger lastSectionIndex = [tableView numberOfSections] - 1;
    NSInteger lastRowIndex = [tableView numberOfRowsInSection:lastSectionIndex] - 1;
    if ((indexPath.section == lastSectionIndex) && (indexPath.row == lastRowIndex))
    {
        // This is the last cell
        pageNumber+=1;
        [self getMoviesWithPageNumber:pageNumber];
    }
}

#pragma mark - Get Movies for Load more action
- (void)getMoviesWithPageNumber:(NSInteger)page
{
    /**
     *  In MovieService class, request is sent & result in here
     */
    [[RfbMovieService sharedInstance] getPopularMoviesWithPageNumber:page withCompletion:^(bool success, NSMutableArray *moviesArr) {
        
        if (success)
        {
            [self.moviesArr addObjectsFromArray:moviesArr];
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
