//
//  View4.m
//  Animation
//
//  Created by Kenvin on 15/6/14.
//  Copyright © 2017年 上海乐住信息技术有限公司. All rights reserved.
//

#import "View4.h"

@interface View4()
@property (weak, nonatomic) IBOutlet UIImageView *bgImg;
@property (weak, nonatomic) IBOutlet UIImageView *eyeImg;
@property (weak, nonatomic) IBOutlet UIButton *StarButton;
@property (weak, nonatomic) IBOutlet UIImageView *closeeye;

@property (weak,nonatomic) IBOutlet NSLayoutConstraint *bottomConstraint1;
@property (weak,nonatomic) IBOutlet NSLayoutConstraint *bottomConstraint2;

- (IBAction)starBtn:(id)sender;
@end

@implementation View4

- (void)dealloc {
    _block=nil;
    _bgImg = nil;
    _eyeImg = nil;
    _StarButton = nil;
    _closeeye = nil;
    _bottomConstraint1 = nil;
    _bottomConstraint2 = nil;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if(self) {
        _block = nil;
    }
    return (self);
}

-(void)awakeFromNib{
    if (IPHONE_SCREEN_HEIGHT>667){
        _bottomConstraint1.constant=275.0f;
        _bottomConstraint2.constant=275.0f;
    }
    else if (IPHONE_SCREEN_HEIGHT>568) {
        _bottomConstraint1.constant=245.0f;
        _bottomConstraint2.constant=245.0f;
    }
}

- (void)animationStart {
    self.StarButton.enabled = NO;
    [self animation];
}

- (void)animation {
    __weak typeof(self)weakSelf = self;
    [UIView animateWithDuration:1 animations:^{
        weakSelf.eyeImg.alpha = 0;
        weakSelf.closeeye.alpha = 1;
    } completion:^(BOOL finished) {
        [weakSelf.StarButton setImage:[UIImage imageNamed:@"launch_buttom"] forState:UIControlStateNormal];
        weakSelf.StarButton.enabled=YES;
    }];
}

- (IBAction)starBtn:(id)sender {
    
}

@end
