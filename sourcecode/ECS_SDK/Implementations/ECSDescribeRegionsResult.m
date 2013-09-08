//
//  ECSDescribeRegionsResult.m
//  samples_ios
//
//  Created by zhang baocai on 8/28/13.
//
//

#import "ECSDescribeRegionsResult.h"
#import "NSArray+ECSRegions.h"
@implementation ECSDescribeRegionsResult
@synthesize regions = _regions;
-(void)dealloc
{
    [_regions release]; _regions = nil;
    [super dealloc];
}
-(id)initWithXMLData:(NSData*)data
{
    if (self = [super initWithXMLData:data]) {
        _regions = [[NSArray alloc]initWithRegionsXMLData:data];
    }
    return self;
}
@end
