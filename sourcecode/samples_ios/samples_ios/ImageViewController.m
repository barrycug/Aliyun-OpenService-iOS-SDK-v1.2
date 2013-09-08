//
//  ImageViewController.m
//  samples_ios
//
//  Created by zhang baocai on 11/3/12.
//
//

#import "ImageViewController.h"

@interface ImageViewController ()

@end

@implementation ImageViewController
@synthesize image = _image;
@synthesize imageView  = _imageView;
-(void)dealloc
{
    self.imageView = nil;
    self.image = nil;
    [super dealloc];
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
    self.imageView.image = self.image;
    self.navigationItem.title = @"图片";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
