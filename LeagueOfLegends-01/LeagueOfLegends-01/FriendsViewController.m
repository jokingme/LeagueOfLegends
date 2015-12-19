//
//  FriendsViewController.m
//  LeagueOfLegends-01
//
//  Created by Joker on 15/12/11.
//  Copyright © 2015年 Joker. All rights reserved.
//

#import "FriendsViewController.h"

@interface FriendsViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *FriendsSegmentControl;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *FriendsRightBarButton;
@property (weak, nonatomic) IBOutlet UITableView *FriendsTableView;
@property (nonatomic,strong) UISearchBar *searchBar;

@end

@implementation FriendsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _FriendsSegmentControl.backgroundColor = [UIColor grayColor];

    //_FriendsSegmentControl.tintColor = [UIColor colorWithRed:1.0 green:200/255.0 blue:42/255.0 alpha:1];
    self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:36/255.0 green:41/255.0 blue:56/255.0 alpha:1.0];

    [self addSearch];
    // Do any additional setup after loading the view.
    
    if (_FriendsSegmentControl.selected) {
        _FriendsSegmentControl.backgroundColor = [UIColor lightGrayColor];
        
    }
}
- (void)addSearch {
    UISearchBar *searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 40)];
    searchBar.placeholder = @"搜索你的好友";
    [_FriendsTableView addSubview:searchBar];
    _searchBar = searchBar;
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [_searchBar resignFirstResponder];
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
