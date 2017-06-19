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
        self = [[[NSBundle mainBundle] loadNibNamed:@"CustomPopUp"
                                              owner:self
                                            options:nil] objectAtIndex:0];
        self.frame = frame;
        [self showPopUp];
    }
    return self;
}

#pragma mark - Button Action Method
- (IBAction)closeButtonClicked:(UIButton*)sender {
    [self closePopUp];
}

#pragma mark - Custom Open & Close Method
- (void)showPopUp{
    self.transform = CGAffineTransformMakeScale(1.4, 1.4);
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
        self.transform = CGAffineTransformMakeScale(1.4, 1.4);
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
        if([self.customPopUpDelegate respondsToSelector:@selector(dismissCustomPopUpView:)]){
            [self.customPopUpDelegate dismissCustomPopUpView:self];
        }
    }];
}

@end
