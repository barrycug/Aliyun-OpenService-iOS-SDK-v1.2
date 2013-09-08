//
//  LoginViewController.h
//  samples_ios
//
//  Created by zhang baocai on 11/14/12.
//
//

#import <UIKit/UIKit.h>
@protocol LoginDelegate<NSObject>
-(void) loginWithUser:(NSString*) userName andPsw:(NSString *)psw;
@end
@interface LoginViewController : UIViewController

{
    UITextField *_usernameTF;
    UITextField *_passwordTF;
    id<LoginDelegate> delegate;
}
@property(strong,nonatomic)IBOutlet UITextField *usernameTF;
@property(strong,nonatomic)IBOutlet UITextField *passwordTF;
@property(assign,nonatomic)id<LoginDelegate> delegate;
-(IBAction)login:(id)sender;
@end
