//
//  CustomPopUp.m
//  CustomPopUpView
//
//  Created by Bhavin Gupta on 19/06/17.
//  Copyright © 2017 Easy Pay. All rights reserved.
//

#import "CustomPopUp.h"

@implementation CustomPopUp

#pragma mark - Init With Frame
-(id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if(self){
        self = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class])
                                              owner:self
                                            options:nil] objectAtIndex:0];
        self.frame = frame;
    }
    return self;
}

- (void)awakeFromNib{
    [super awakeFromNib];
    [self showPopUp];
}

#pragma mark - Button Action Method
- (IBAction)closeButtonClicked:(UIButton*)sender {
    [self closePopUp];
}

#pragma mark - Show & Close Pop Up Animation
- (void)showPopUp{
    self.transform = CGAffineTransformMakeScale(1.5, 1.5);
    self.alpha = 0.0f;
    [UIView animateWithDuration:0.25f animations:^{
        self.alpha = 1.0f;
        self.transform = CGAffineTransformMakeScale(1.0, 1.0);
    } completion:^(BOOL finished) {
    }];
}

- (void)closePopUp{
    [UIView animateWithDuration:0.25f animations:^{
        self.alpha = 0.0f;
        self.transform = CGAffineTransformMakeScale(1.5, 1.5);
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
        if([self.customPopUpDelegate respondsToSelector:@selector(dismissCustomPopUpView:)]){
            [self.customPopUpDelegate dismissCustomPopUpView:self];
        }
    }];
}

@end
