//
//  View2.m
//  Animation
//
//  Created by Kenvin on 15/6/14.
//  Copyright © 2017年 上海乐住信息技术有限公司. All rights reserved.
//

#import "View2.h"

@interface View2 ()
@property (weak, nonatomic) IBOutlet UIImageView *titleImg;
@property (weak, nonatomic) IBOutlet UIImageView *houseImg;
@property (weak, nonatomic) IBOutlet UIImageView *cloud1;
@property (weak, nonatomic) IBOutlet UIImageView *cloud2;
@property (weak, nonatomic) IBOutlet UIImageView *cloud3;
@property (weak, nonatomic) IBOutlet UIImageView *cloud4;
@property (assign, nonatomic) CGRect titleImgRect;
@property (assign, nonatomic) CGRect houseImgRect;
@property (assign, nonatomic) CGRect cloud1Rect;
@property (assign, nonatomic) CGRect cloud2Rect;
@property (assign, nonatomic) CGRect cloud3Rect;
@property (assign, nonatomic) CGRect cloud4Rect;

@property (assign, nonatomic) NSInteger animationNum;
@property (assign, nonatomic) NSInteger animationNum2;
@end

@implementation View2
- (void)dealloc{
    self.titleImg = nil;
    self.houseImg = nil;
    self.cloud1 = nil;
    self.cloud2 = nil;
    self.cloud3 = nil;
    self.cloud4 = nil;

}
-(void)awakeFromNib{
    [super awakeFromNib];
    self.layer.masksToBounds = YES;
    _animationNum = 0;
    _animationNum2 = 0;
}

-(void)animationStart{
    static BOOL ret = YES;
    if (!ret) {
        return;
    }
    
    ret = NO;
    _titleImgRect = _titleImg.frame;
    _houseImgRect = _houseImg.frame;
    _cloud1Rect = _cloud1.frame;
    _cloud2Rect = _cloud2.frame;
    _cloud3Rect = _cloud3.frame;
    _cloud4Rect = _cloud4.frame;
    
    _animationNum++;
    _animationNum2++;
    _titleImg.frame = CGRectMake(_titleImgRect.origin.x, self.frame.size.height, _titleImgRect.size.width, _titleImgRect.size.height);
    
    _cloud1.frame = CGRectMake(10, _cloud1Rect.origin.y, _cloud1Rect.size.width, _cloud1Rect.size.height);
    
    _houseImg.frame = CGRectMake(_houseImgRect.origin.x, _houseImgRect.origin.y - 500, _houseImgRect.size.width, _houseImgRect.size.height);
    _cloud2.frame = CGRectMake(_cloud2Rect.origin.x, _cloud2Rect.origin.y - 500, _cloud2Rect.size.width, _cloud2Rect.size.height);
    _cloud3.frame = CGRectMake(_cloud3Rect.origin.x, _cloud3Rect.origin.y - 500, _cloud3Rect.size.width, _cloud3Rect.size.height);
    _cloud4.frame = CGRectMake(_cloud4Rect.origin.x, _cloud4Rect.origin.y - 500, _cloud4Rect.size.width, _cloud4Rect.size.height);

    self.titleImg.alpha = self.houseImg.alpha = self.cloud1.alpha = self.cloud2.alpha = self.cloud3.alpha = self.cloud4.alpha = 1.0f;
    
    [self animationCloud];
    [self animation1];
}

-(void)animation1{
    __weak typeof(self)weakSelf = self;
    [UIView animateWithDuration:1 animations:^{
        weakSelf.houseImg.frame = weakSelf.houseImgRect;
        weakSelf.cloud2.frame = weakSelf.cloud2Rect;
        weakSelf.cloud3.frame = weakSelf.cloud3Rect;
        weakSelf.cloud4.frame = weakSelf.cloud4Rect;
        
        weakSelf.titleImg.frame = weakSelf.titleImgRect;
    } completion:^(BOOL finished) {
        [weakSelf animation2];
    }];
}

-(void)animation2{
    if (_animationNum%2 == 0) {
        _animationNum++;
        return;
    }
    __weak typeof(self)weakSelf = self;
    [UIView animateWithDuration:2 animations:^{
        weakSelf.cloud2.frame = CGRectMake(weakSelf.cloud2Rect.origin.x - weakSelf.frame.size.width - 200, weakSelf.cloud2Rect.origin.y, weakSelf.cloud2Rect.size.width, weakSelf.cloud2Rect.size.height);
        weakSelf.cloud3.frame = CGRectMake(weakSelf.cloud3Rect.origin.x- weakSelf.frame.size.width, weakSelf.cloud3Rect.origin.y, weakSelf.cloud3Rect.size.width, weakSelf.cloud3Rect.size.height);
        weakSelf.cloud4.frame = CGRectMake(weakSelf.cloud4Rect.origin.x- weakSelf.frame.size.width, weakSelf.cloud4Rect.origin.y, weakSelf.cloud4Rect.size.width, weakSelf.cloud4Rect.size.height);
    } completion:^(BOOL finished) {
        [weakSelf animation3];
    }];
}

-(void)animation3{
    __weak typeof(self)weakSelf = self;
    [UIView animateWithDuration:2 animations:^{
        weakSelf.cloud2.frame = weakSelf.cloud2Rect;
        weakSelf.cloud3.frame = weakSelf.cloud3Rect;
        weakSelf.cloud4.frame = weakSelf.cloud4Rect;

    } completion:^(BOOL finished) {
        [weakSelf animation2];
    }];
}

-(void)animationCloud{
    if (_animationNum2%2 == 0) {
        _animationNum2++;
        return;
    }
    __weak typeof(self)weakSelf = self;
    [UIView animateWithDuration:1.5 animations:^{
        weakSelf.cloud1.frame = weakSelf.cloud1Rect;
    } completion:^(BOOL finished) {
        [weakSelf animationCloud2];
    }];
}
-(void)animationCloud2{
    __weak typeof(self)weakSelf = self;
    [UIView animateWithDuration:1.5 animations:^{
        weakSelf.cloud1.frame = CGRectMake(10, weakSelf.cloud1Rect.origin.y, weakSelf.cloud1Rect.size.width, weakSelf.cloud1Rect.size.height);;
    } completion:^(BOOL finished) {
        [weakSelf animationCloud];
    }];
}
@end
