//
//  ViewController.m
//  LeagueOfLegends-01
//
//  Created by Joker on 15/12/10.
//  Copyright © 2015年 Joker. All rights reserved.
//

#import "ZXViewController.h"

@interface ZXViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *ZXScrollView;
@property  (nonatomic) NSInteger i;
@property (nonatomic) NSInteger Tag;
@property (nonatomic) NSInteger LastTag;
@property (nonatomic,strong) NSArray *array;
#define UIColorRGB(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define BtnX ([UIScreen mainScreen].bounds.size.width - 35) / 4
#define Num 7
#define ScreenW [UIScreen mainScreen].bounds.size.width

@end

@implementation ZXViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _array = @[@"最新",@"赛事",@"视频",@"娱乐",@"官方",@"攻略",@"活动"];

    [self addScrollView];
}

#pragma mark - 添加ScrollView和ScrollView上的View
- (void)addScrollView {
    
    self.view.backgroundColor = UIColorRGB(36, 41, 56);
    _ZXScrollView.frame = CGRectMake(0, 20, ScreenW - 35, 48);
    _ZXScrollView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width / 4 * 7, 48);
    _ZXScrollView.backgroundColor = UIColorRGB(36, 41, 56);

    
    for (_i = 0 ; _i < Num; _i++) {
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(BtnX * _i , 20, BtnX, 48)];
        NSString *str = [NSString stringWithFormat:@"%@",_array[_i]];
        [btn setTitle:str forState:UIControlStateNormal];
        [btn setTitleColor:UIColorRGB(230, 180, 30) forState:UIControlStateSelected];
        [btn addTarget:self action:@selector(action:) forControlEvents:UIControlEventTouchUpInside];
        if (_i == 0) {
            btn.selected = YES;
            btn.titleLabel.font = [UIFont systemFontOfSize:20];
        }
        [_ZXScrollView addSubview:btn];
        btn.tag = 1001+_i;
    }
    
    _Tag = 1001;
    
    //设置隐藏上下滑动条
    _ZXScrollView.showsHorizontalScrollIndicator = NO;
    _ZXScrollView.showsVerticalScrollIndicator = NO;


    UIButton *RightBtn = [[UIButton alloc]initWithFrame:CGRectMake(ScreenW - 35, 20, 35, 48)];
//    RightBtn.backgroundColor = UIColorRGB(27, 30, 42);
    [RightBtn setBackgroundImage:[UIImage imageNamed:@"list_news_top_arrow_normal"] forState:UIControlStateNormal];
    [RightBtn setBackgroundImage:[UIImage imageNamed:@"list_news_top_arrow_press"] forState:UIControlStateHighlighted];
    [RightBtn addTarget:self action:@selector(nextBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:RightBtn];
    
    
    //允许点击返回最上方
    //_ZXScrollView.scrollsToTop = YES;
    //要用代理的两个属性 需要设置代理
    //_ZXScrollView.delegate = self;
}

- (void)nextBtn:(UIButton *)btn {
    
}


- (void)action:(UIButton *)btn {
    self.Tag = btn.tag;
}

- (void)setTag:(NSInteger)Tag {
    UIButton *butn  = [self.view viewWithTag:_Tag];
    butn.selected = NO;
    butn.titleLabel.font = [UIFont systemFontOfSize:18];
    UIButton *btn = [self.view viewWithTag:Tag];
    btn.selected = YES;
    btn.titleLabel.font = [UIFont systemFontOfSize:20];
    _Tag = Tag;
    
    UIButton *butn1  = [self.view viewWithTag:Tag];
    CGFloat resetFrame = butn1.frame.origin.x - ScreenW / 2;

    resetFrame = resetFrame > 0 ? (resetFrame + BtnX / 2) : 0;
    resetFrame = resetFrame > _ZXScrollView.contentSize.width - ScreenW ? _ZXScrollView.contentSize.width - ScreenW : resetFrame;
    [_ZXScrollView setContentOffset:CGPointMake(resetFrame, 0) animated:YES];
    _LastTag = Tag;
    
}


#pragma mark - UISCrollViewDelegate
//- (BOOL)scrollViewShouldScrollToTop:(UIScrollView *)scrollView {
//    return YES;
//}
//- (void)scrollViewDidScrollToTop:(UIScrollView *)scrollView {
//    NSLog(@"hehhehehehe");
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
