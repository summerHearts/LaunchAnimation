//
//  View1.m
//  Animation
//
//  Created by Kenvin on 15/6/14.
//  Copyright © 2017年 上海乐住信息技术有限公司. All rights reserved.
//

#import "View1.h"

@interface View1 ()
@property (weak, nonatomic) IBOutlet UIImageView *titleImg;//背景图片
@property (weak, nonatomic) IBOutlet UIImageView *houseImg;
@property (weak, nonatomic) IBOutlet UIImageView *manImg;
@property (weak, nonatomic) IBOutlet UIImageView *phoneImg;
@property (assign, nonatomic) CGRect titleImgRect;
@property (assign, nonatomic) CGRect houseImgRect;
@property (assign, nonatomic) CGRect manImgRect;
@property (assign, nonatomic) CGRect phoneImgRect;
@property (assign, nonatomic) NSInteger num;
@end

@implementation View1

- (void)dealloc{
    self.titleImg = nil;
    self.houseImg = nil;
    self.manImg = nil;
    self.phoneImg = nil;
}
-(void)animationStart{
    static BOOL ret = YES;
    if (!ret) {
        return;
    }
    
    ret = NO;
    _titleImgRect = _titleImg.frame;
    _houseImgRect = _houseImg.frame;
    _manImgRect = _manImg.frame;
    _phoneImgRect = _phoneImg.frame;
    _titleImg.frame = CGRectMake(_titleImgRect.origin.x, self.frame.size.height,_titleImgRect.size.width, _titleImgRect.size.height);
    _houseImg.frame = CGRectMake(-_houseImgRect.size.width, _houseImgRect.origin.y, _houseImgRect.size.width, _houseImgRect.size.height);
    _manImg.alpha = 0;
    _phoneImg.alpha = 0;
    
    self.titleImg.hidden = self.houseImg.hidden = self.manImg.hidden = self.phoneImg.hidden = NO;
    
    [self animation1];
}

-(void)animation1{
    __weak typeof(self) weakSelf = self;
    [UIView animateWithDuration:1.0 animations:^{
        weakSelf.titleImg.frame = weakSelf.titleImgRect;
        weakSelf.houseImg.frame = weakSelf.houseImgRect;
        weakSelf.titleImg.alpha = weakSelf.houseImg.alpha = weakSelf.manImg.alpha = weakSelf.phoneImg.alpha = 1;
    } completion:^(BOOL finished) {
        if(finished) {
            NSArray *values = @[[NSValue valueWithCATransform3D:CATransform3DMakeRotation(0.2f * M_PI, 0, 0, 1)],
                                [NSValue valueWithCATransform3D:CATransform3DMakeRotation(0 * M_PI, 0, 0, 1)],
                                [NSValue valueWithCATransform3D:CATransform3DMakeRotation(-0.2f * M_PI, 0, 0, 1)],
                                [NSValue valueWithCATransform3D:CATransform3DMakeRotation(0 * M_PI, 0, 0, 1)]];
            CAKeyframeAnimation *ani = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
            ani.duration = 0.1f;
            ani.repeatCount = 3;
            ani.values = values;
            [weakSelf.phoneImg.layer addAnimation:ani forKey:@"phoneAnimation"];
        }
    }];
}

@end
