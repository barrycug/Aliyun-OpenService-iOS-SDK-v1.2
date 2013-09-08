//
//  ECSDescribeInstanceDisksResult.m
//  samples_ios
//
//  Created by zhang baocai on 9/4/13.
//
//

#import "ECSDescribeInstanceDisksResult.h"
#import "TBXML.h"
#import "NSArray+ECSDisks.h"
@implementation ECSDescribeInstanceDisksResult
@synthesize disks = _disks;
-(void)dealloc
{
    [_disks release];_disks = nil;
    [super dealloc];
}
-(id)initWithXMLData:(NSData *)data
{
    if (self = [super initWithXMLData:data]) {
        if (data != nil)
        {
            TBXML * tbxml=[[TBXML alloc]  initWithXMLData:data];
            TBXMLElement *rootXMLElement = tbxml.rootXMLElement;
            if (rootXMLElement != NULL) {
                _disks = [[NSArray alloc] initWithECSDisksXMLData:data];
                               
            }
        }
    }
    return self;

}
@end
