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

@interface CustomPopUp : UIView

@property (strong, nonatomic) id<CustomPopUpDelegate> customPopUpDelegate;

@end
