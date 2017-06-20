//
//  CustomPopUp.h
//  CustomPopUpView
//
//  Created by Bhavin Gupta on 19/06/17.
//  Copyright © 2017 Easy Pay. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CustomPopUp;

@protocol CustomPopUpDelegate <NSObject>

@optional
- (void)dismissCustomPopUpView:(CustomPopUp*)customPopView;

@end

@interface CustomPopUp : UIView<UITextFieldDelegate>

@property (strong, nonatomic) id<CustomPopUpDelegate> customPopUpDelegate;
@property (strong, nonatomic) IBOutlet UIView *popUpView;
@property (strong, nonatomic) IBOutlet UITextField *txtUsername;
@property (strong, nonatomic) IBOutlet UITextField *txtPassword;

@end
