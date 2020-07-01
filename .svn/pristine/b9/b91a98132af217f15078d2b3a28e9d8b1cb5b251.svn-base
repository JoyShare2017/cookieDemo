//
//  IntroduceViewController.m
//  KOFACS
//
//  Created by zhang_qing on 16/8/22.
//  Copyright © 2016年  apple. All rights reserved.
//

#import "IntroduceViewController.h"
#import "AppDelegate.h"
#import "LoginViewController.h"
#define VIEW_W self.view.frame.size.width
#define VIEW_H self.view.frame.size.height

@interface IntroduceViewController ()<UIScrollViewDelegate,UIWebViewDelegate>
{
    NSArray * _arrayOfImageNames;//图片名称
    UIScrollView * _scrollView;//展示图片
    UIPageControl * _pageControl;//分页
    
    UIButton * seletedButton;//勾选项 √ 让点击进入
    
    UILabel * protocolLabel;
    
    UIButton * protocolBtn;
}
@end

@implementation IntroduceViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //4寸 4.7寸 5.5寸长宽比例一致   5.8 6.1 6.5长宽比例一致可以用同一套图
    if (IS_IPHONE_X){
        _arrayOfImageNames=@[@"1125-1",@"1125-2",@"1125-3",@"1125-4"];
    }else{
        _arrayOfImageNames=@[@"750-1",@"750-2",@"750-3",@"750-4"];
    }

    
    [self addScrollView];
    [self addPageControl];

}



-(void)addScrollView
{
    //1.获取滚动视图
    _scrollView = [[UIScrollView alloc]initWithFrame:self.view.frame];
    _scrollView.contentSize = CGSizeMake(VIEW_W*(_arrayOfImageNames.count), 0);
    _scrollView.pagingEnabled = YES;
    _scrollView.bounces = NO;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.delegate = self;
    //2.添加图片
    for (int i = 0; i < _arrayOfImageNames.count; i++) {
            UIImage * image = [UIImage imageNamed:_arrayOfImageNames[i]];
            //2.2获取图片视图
            CGFloat imageViewX = VIEW_W * i;
            UIImageView * imageV = [[UIImageView alloc]initWithFrame:CGRectMake(imageViewX, 0, VIEW_W, VIEW_H)];
            imageV.image = image;
            imageV.userInteractionEnabled = YES;
            [_scrollView addSubview:imageV];

        if (i==_arrayOfImageNames.count-1) {
            UBButton*begin=[[UBButton alloc]initWithFrame:KFRAME(imageV.frame.size.width*0.5-50, VIEW_H-100, 100, 38)];
            [begin setImage:KImageNamed(@"button_tiyan") forState:(UIControlStateNormal)];
            [begin setTitle:@"立即体验" forState:(UIControlStateNormal)];
            imageV.userInteractionEnabled=YES;
            
            begin.backgroundColor=MAINCOLOR;
            [imageV addSubview:begin];
            [begin addAction:^(UBButton *button) {
                [KUser_Default setObject:@"one" forKey:@"GUIDE"];
                AppDelegate* delegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
            delegate.window.rootViewController=[LoginViewController new];
            }];
        }
    }
    [self.view addSubview:_scrollView];

}


-(void)loadDocument:(NSString*)documentName inView:(UIWebView*)webView
{
    NSString *path = [[NSBundle mainBundle] pathForResource:documentName ofType:nil];
    NSURL *url = [NSURL fileURLWithPath:path];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
}

#pragma mark - delegate
-(void)webViewDidFinishLoad:(UIWebView *)webView
{

    [webView stringByEvaluatingJavaScriptFromString:@"document.getElementsByTagName('body')[0].style.webkitTextSizeAdjust= '150%'"];//修改百分比即可
    
}

-(void)addPageControl
{
    //1.获取分页控制器对象
    CGFloat pageControlX = 0;
    CGFloat pageControlW = VIEW_W;
    CGFloat pageControlH = 60;
    CGFloat pageControlY = VIEW_H-pageControlH;
    _pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(pageControlX, pageControlY, pageControlW, pageControlH)];
    //设置属性
    _pageControl.numberOfPages = _arrayOfImageNames.count;
    _pageControl.userInteractionEnabled = NO;
    _pageControl.currentPageIndicatorTintColor=MAINCOLOR;
    //3.添加到界面上
    [self.view addSubview:_pageControl];
}

#pragma mark - scrollView的代理
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offSetX = scrollView.contentOffset.x;
    NSInteger numOfPage = offSetX/VIEW_W;
    _pageControl.currentPage = numOfPage;
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
