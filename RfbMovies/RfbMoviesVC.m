//
//  RfbMoviesVC.m
//  RfbMovies
//
//  Created by Koray Metin on 06/06/16.
//  Copyright © 2016 Koray Metin. All rights reserved.
//

#import "RfbMoviesVC.h"

@interface RfbMoviesVC ()

@end

@implementation RfbMoviesVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
        
    //movies/popular
    
    [APIRequest GET:@"movies/popular?page=1&limit=100&extended=images" parameters:nil completion:^(BOOL success, NSDictionary *response) {
        if (success)
        {
            NSLog(@"Response %@",response);
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
