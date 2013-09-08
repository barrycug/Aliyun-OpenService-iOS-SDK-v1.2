//
//  TextViewController.h
//  samples_ios
//
//  Created by zhang baocai on 11/3/12.
//
//

#import <UIKit/UIKit.h>

@interface TextViewController : UIViewController
@property(strong,nonatomic) NSString * text;
@property(strong,nonatomic) IBOutlet UITextView * textView;
@end
