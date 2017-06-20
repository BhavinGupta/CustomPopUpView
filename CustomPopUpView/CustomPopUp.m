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
    
    self.popUpView.layer.borderWidth = 3.0f;
    self.popUpView.layer.borderColor = [UIColor blackColor].CGColor;
    self.popUpView.layer.cornerRadius = 20.0f;
    [self.popUpView setClipsToBounds:YES];
    
    [self showPopUp];
}

#pragma mark - UITextfield Delegate Method
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    if(textField == self.txtUsername){
        [textField resignFirstResponder];
        [self.txtPassword becomeFirstResponder];
    }
    else if(textField == self.txtPassword){
        [textField resignFirstResponder];
    }
    return YES;
}

#pragma mark - Button Action Method
- (IBAction)onClickCloseButton:(UIButton*)sender {
    [self closePopUp];
}

- (IBAction)onClickSubmitButton:(UIButton *)sender{
    if([self.txtUsername.text length]!=0 && [self.txtPassword.text length]!=0){
        [self closePopUp];
        if([self.customPopUpDelegate respondsToSelector:@selector(dismissCustomPopUpView:)]){
            [self.customPopUpDelegate dismissCustomPopUpView:self];
        }
    }
    else{
        UIWindow* topWindow = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        topWindow.rootViewController = [UIViewController new];
        topWindow.windowLevel = UIWindowLevelAlert + 1;
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Pop Up View" message:@"Please fill both the details before submission." preferredStyle:UIAlertControllerStyleAlert];
        [alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            topWindow.hidden = YES;
        }]];
        [topWindow makeKeyAndVisible];
        [topWindow.rootViewController presentViewController:alertController animated:YES completion:nil];
    }
}

#pragma mark - Show & Close Pop Up Animation
- (void)showPopUp{
    self.transform = CGAffineTransformMakeScale(1.3, 1.3);
    [UIView animateWithDuration:0.25f animations:^{
        self.transform = CGAffineTransformMakeScale(1.0, 1.0);
    } completion:^(BOOL finished) {
    }];
}

- (void)closePopUp{
    [UIView animateWithDuration:0.25f animations:^{
        self.transform = CGAffineTransformMakeScale(1.3, 1.3);
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

@end
