//
//  LoginViewController.m
//  samples_ios
//
//  Created by zhang baocai on 11/14/12.
//
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController
@synthesize passwordTF = _passwordTF;
@synthesize usernameTF = _usernameTF;
@synthesize delegate;
-(void) dealloc
{
    self.passwordTF = nil;
    self.usernameTF = nil;
    [super dealloc];
}
-(IBAction)login:(id)sender
{
    if ([self.usernameTF.text isEqualToString:@""] ||[self.passwordTF.text isEqualToString:@""] ) {
        UIAlertView*alert = [[UIAlertView alloc]initWithTitle:@"提示"
                                                      message:@"用户名密码不能为空"
                                                     delegate:nil
                                            cancelButtonTitle:@"确定"
                                            otherButtonTitles:nil];
        [alert show];
        [alert release];
        return;
    }
    if ([self.delegate respondsToSelector:@selector(loginWithUser:andPsw:)]) {
        [self.delegate loginWithUser:self.usernameTF.text andPsw:self.passwordTF.text];
    }
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self login:nil];
     [textField resignFirstResponder];
    return  YES;
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.usernameTF.returnKeyType =UIReturnKeyNext;
    self.passwordTF.returnKeyType =UIReturnKeyGo;
    self.passwordTF.delegate = self;
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return (toInterfaceOrientation == UIDeviceOrientationPortrait);
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
