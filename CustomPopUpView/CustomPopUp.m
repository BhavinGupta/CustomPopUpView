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

#pragma mark - Button Action Method
- (IBAction)closeButtonClicked:(UIButton*)sender {
    [self removeFromSuperview];
    if([self.customPopUpDelegate respondsToSelector:@selector(dismissCustomPopUpView:)]){
        [self.customPopUpDelegate dismissCustomPopUpView:self];
    }
}

@end
