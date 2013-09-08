//
//  AddObjectViewController.h
//  OSSViewer
//
//  Created by zhang baocai on 11/4/12.
//  Copyright (c) 2012 igis.me. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol AddObjectVCDelegate<NSObject>
-(void) AddObjectSelectedIndex:(int) index;
-(void) AddObjectCancel;
@end
@interface AddObjectViewController : UIViewController
{
    NSArray *_array;
    
}
@property(assign,nonatomic)id<AddObjectVCDelegate> delegate;
@property(strong,nonatomic)IBOutlet UITableView * tableView;
-(IBAction)cancel:(id)sender;
@end
