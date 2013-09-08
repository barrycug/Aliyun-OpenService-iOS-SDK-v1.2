//
//  TextViewController.m
//  samples_ios
//
//  Created by zhang baocai on 11/3/12.
//
//

#import "TextViewController.h"

@interface TextViewController ()

@end

@implementation TextViewController
@synthesize text = _text;
@synthesize textView = _textView;
-(void) dealloc
{
    self.textView = nil;
    self.text = nil;
    [super dealloc];
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return YES;
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
    self.textView.text = self.text;
    self.navigationItem.title = @"文字";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
