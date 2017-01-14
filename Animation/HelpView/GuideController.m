//
//  ViewController.m
//  Animation
//
//  Created by Kenvin on 15/6/14.
//  Copyright © 2017年 上海乐住信息技术有限公司. All rights reserved.
//

#import "GuideController.h"
#import "View1.h"
#import "View2.h"
#import "View3.h"
#import "View4.h"

@interface GuideController () <UIScrollViewDelegate>
@property (strong, nonatomic, readonly) UIScrollView *scrollView;
@property (strong, nonatomic) NSArray *scrollViewSubviews;
@end

@implementation GuideController
@synthesize scrollView = _scrollView;

- (void)dealloc {
    _scrollViewSubviews = nil;
    _scrollView = nil;
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self) {
        _scrollViewSubviews = nil;
        _scrollView = nil;
    }
    return (self);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.scrollView];
    [self setUpSubviews];
    [self scrollViewDidEndDecelerating:self.scrollView];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.scrollView.frame = self.view.bounds;
}

#pragma mark - getter
- (UIScrollView *)scrollView {
    if(!_scrollView) {
        _scrollView = [[UIScrollView alloc]initWithFrame:[UIScreen mainScreen].bounds];
        _scrollView.bounces = NO;
        _scrollView.delegate = self;
        _scrollView.pagingEnabled = YES;
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.contentSize = CGSizeMake(self.view.frame.size.width * 4, self.view.frame.size.height);
    }
    return (_scrollView);
}
#pragma mark -

#pragma mark - action
-(void)setUpSubviews {
    
    CGSize size = self.scrollView.bounds.size;
    
    View1 *view1 = [[NSBundle mainBundle]loadNibNamed:@"View1" owner:nil options:nil].lastObject;
    view1.frame = self.view.frame;
    [self.scrollView addSubview:view1];
    
    View2 *view2 = [[NSBundle mainBundle]loadNibNamed:@"View2" owner:nil options:nil].lastObject;
    view2.frame = CGRectMake(size.width, 0, size.width, size.height);
    [self.scrollView addSubview:view2];
    
    View3 *view3 = [[NSBundle mainBundle]loadNibNamed:@"View3" owner:nil options:nil].lastObject;
    view3.frame = CGRectMake(size.width * 2, 0, size.width, size.height);
    [self.scrollView addSubview:view3];
    
    View4 *view4 = [[NSBundle mainBundle]loadNibNamed:@"View4" owner:nil options:nil].lastObject;
    view4.frame = CGRectMake(size.width * 3, 0, size.width, size.height);

    [self.scrollView addSubview:view4];
    
    self.scrollViewSubviews = @[view1, view2, view3, view4];
}
#pragma mark -

#pragma mark - <UIScrollViewDelegate>
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSInteger index = scrollView.contentOffset.x / scrollView.frame.size.width;
    View1 *view = (View1 *)[self.scrollViewSubviews objectAtIndex:index];
    [view animationStart];
}
#pragma mark -

@end
