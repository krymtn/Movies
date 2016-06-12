//
//  RfbMoviesRootVC.m
//  RfbMovies
//
//  Created by Koray Metin on 12/06/16.
//  Copyright © 2016 Koray Metin. All rights reserved.
//

#import "RfbMoviesRootVC.h"

#import "RfbMoviesVC.h"
#import "RfbSearchMoviesVC.h"

@interface RfbMoviesRootVC ()

@property(weak, nonatomic) IBOutlet UIActivityIndicatorView *spinner;
@property(weak, nonatomic) IBOutlet UITextField *searchField;

@property(nonatomic,weak) IBOutlet UIView *childViewsContainer;
@property(nonatomic,weak) IBOutlet UIView *moviesContainerView;
@property(nonatomic,weak) IBOutlet UIView *searchContainerView;

@property(nonatomic,weak) IBOutlet NSLayoutConstraint *moviesContainerTopConstraint;

@end

@implementation RfbMoviesRootVC

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationItem.title = @"Movies";
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
   /**
    *  Add Movies List & Search Movies ChildViewControllers
    */
    RfbMoviesVC *moviesChildVC = [self.storyboard instantiateViewControllerWithIdentifier:@"RfbMoviesVC"];
    [self addChildViewController:moviesChildVC];
    moviesChildVC.view.frame = self.moviesContainerView.frame;
    [self.moviesContainerView addSubview:moviesChildVC.view];
    [moviesChildVC didMoveToParentViewController:self];
    
    RfbSearchMoviesVC *searchChildVC = [self.storyboard instantiateViewControllerWithIdentifier:@"RfbSearchMoviesVC"];
    [self addChildViewController:searchChildVC];
    searchChildVC.view.frame = self.searchContainerView.frame;
    [self.searchContainerView addSubview:searchChildVC.view];
    [searchChildVC didMoveToParentViewController:self];
    

    
    /**
     *  Add buffer when user enter search text (When finish to write)
     *
     *  After 1 second request is sent
     */
    double sampleRate = 1.0;
    [[self.searchField.rac_textSignal bufferWithTime:sampleRate onScheduler:[RACScheduler mainThreadScheduler]] subscribeNext:^(RACTuple * x) {
        NSLog(@"%@", x.last); //Prints the latest string in the tuple.
        
        /**
         *  User start to text in search box, Movies Search screen is shown.
         *
         *  Clear to search text, Movies List is shown (Popular one)
         */
        if (![x.last isEqualToString:@""])
        {
        
            self.moviesContainerTopConstraint.constant = SCREENHEIGHT;
            self.moviesContainerView.alpha = 0;
            
            [searchChildVC searchMovies:[x.last urlencode] withSearchPage:0 isPaging:false];
        }
        else
        {
            
            self.moviesContainerTopConstraint = 0;
            self.moviesContainerView.alpha = 1;
        }
        
        [UIView animateWithDuration:0.6 animations:^{
            [self.view layoutIfNeeded];
        } completion:^(BOOL finished) {
            
        }];
        
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
