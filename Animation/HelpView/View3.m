//
//  View3.m
//  Animation
//
//  Created by Kenvin on 15/6/14.
//  Copyright © 2017年 上海乐住信息技术有限公司. All rights reserved.
//

#import "View3.h"
@interface View3 ()
@property (weak, nonatomic) IBOutlet UIImageView *titleImg;
@property (weak, nonatomic) IBOutlet UIImageView *gateImg;
@property (weak, nonatomic) IBOutlet UIImageView *manImg;
@property (weak, nonatomic) IBOutlet UIImageView *starImg;

@property (assign, nonatomic) CGRect titleImgRect;
@property (assign, nonatomic) CGRect gateImgRect;
@property (assign, nonatomic) CGRect manImgRect;
@property (assign, nonatomic) CGRect starImgRect;

@property (assign, nonatomic) NSInteger animationNum;
@end
@implementation View3

- (void)dealloc{
    self.titleImg = nil;
    self.gateImg = nil;
    self.manImg = nil;
    self.starImg = nil;
}
-(void)awakeFromNib{
    self.layer.masksToBounds = YES;
    _animationNum = 0;
}

-(void)animationStart{
    static BOOL ret = YES;
    if (!ret) {
        return;
    }
    ret = NO;
    _titleImgRect = _titleImg.frame;
    _manImgRect = _manImg.frame;
    _gateImgRect = _gateImg.frame;
    _starImgRect = _starImg.frame;
    _animationNum++;
    
    _titleImg.frame = CGRectMake(_titleImgRect.origin.x, self.frame.size.height, _titleImgRect.size.width, _titleImgRect.size.height);
    _manImg.frame = CGRectMake(self.frame.size.width, _manImgRect.origin.y, _manImgRect.size.width, _manImgRect.size.height);
    _gateImg.frame = CGRectMake(-_gateImgRect.size.width, _gateImgRect.origin.y, _gateImgRect.size.width, _gateImgRect.size.height);
    
    self.titleImg.alpha = self.gateImg.alpha = self.manImg.alpha = 1.0f;
    
    [self animation1];
    [self animation2];
    [self animation4];
}

-(void)animation1{
    __weak typeof(self)weakSelf = self;
    [UIView animateWithDuration:1 animations:^{
        weakSelf.titleImg.frame = weakSelf.titleImgRect;
        weakSelf.manImg.frame = weakSelf.manImgRect;
        weakSelf.gateImg.frame = weakSelf.gateImgRect;
    }];
}

-(void)animation2{
    __weak typeof(self)weakSelf = self;
    [UIView animateWithDuration:1 animations:^{
        weakSelf.starImg.frame = CGRectMake(weakSelf.starImgRect.origin.x, weakSelf.starImgRect.origin.y, weakSelf.starImgRect.size.width/2, weakSelf.starImgRect.size.height/2);
    } completion:^(BOOL finished) {
        [weakSelf animation3];
    }];
}

-(void)animation3{
    __weak typeof(self)weakSelf = self;
    [UIView animateWithDuration:1 animations:^{
        weakSelf.starImg.frame = weakSelf.starImgRect;
    } completion:^(BOOL finished) {
        [weakSelf animation2];
    }];
}

-(void)animation4{
    __weak typeof(self)weakSelf = self;
    static NSInteger n = 1;
    n += 1;
    [UIView animateWithDuration:0.5 animations:^{
        weakSelf.starImg.alpha = n%2 + 0.5;
    } completion:^(BOOL finished) {
        [weakSelf animation4];
    }];
}

@end
