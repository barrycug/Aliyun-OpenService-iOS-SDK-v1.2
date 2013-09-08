//
//  ECSDescribeInstanceTypeResult.m
//  samples_ios
//
//  Created by zhang baocai on 9/5/13.
//
//

#import "ECSDescribeInstanceTypeResult.h"
#import "TBXML.h"
#import "NSArray+ECSInstanceTypes.h"
@implementation ECSDescribeInstanceTypeResult
@synthesize instanceTypes = _instanceTypes;
-(void) dealloc
{
    [_instanceTypes release]; _instanceTypes = nil;
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
                _instanceTypes = [[NSArray alloc] initWithECSInstanceTypesXMLData:data];
                
            }
        }
    }
    return self;
}
@end
