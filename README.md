# CustomPopUpView
Custom Pop Up View for iPad and iPhone using Auto Layout

A simple custom pop up view using dynamic framework for all views and devices using pod and autolayout from iOS8 and greater.
Use it in your project using pod for this custom pop up view.

Install Cocoa Pods as below:

Step 1 : Enter this below:

         pod 'CustomPopUpView', :git => 'https://github.com/BhavinGupta/CustomPopUpView.git'
         in your pod file of your project.
         
Step 2 : Write in terminal the following command: 

         pod install

That's it you are now installed with custom pop up view 

In your view controller where you want to show the pop up import this line below:

         #import <CustomPopUpView/CustomPopUp.h>

Write the following line of code in your action event to open and close custom pop up as below:

         #pragma mark - Button Action Method
         - (IBAction)onClickShowPopUp:(id)sender{
             UIWindow *window = [[UIApplication sharedApplication] keyWindow];
             CustomPopUp *customPopUp = [[CustomPopUp alloc]initWithFrame:window.frame];
             [customPopUp setCustomPopUpDelegate:self];
             [window addSubview:customPopUp];
         }
         
There is also one CustomPopUpDelegate Method which gives you in hand to make changes in data after the pop up is dismissed as below: 

         #import "ViewController.h"
         #import <CustomPopUpView/CustomPopUp.h>
         @interface ViewController ()<CustomPopUpDelegate>
         @end
         
Add this below method after assigning the [customPopUp setCustomPopUpDelegate:self];

         #pragma mark - Custom pop view delegate
           - (void)dismissCustomPopUpView:(CustomPopUp *)customPopView{
               UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Pop Up View" message:@"Submission Successful." preferredStyle:UIAlertControllerStyleAlert];
               [alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil]];
               [self presentViewController:alertController animated:YES completion:nil];
           }
