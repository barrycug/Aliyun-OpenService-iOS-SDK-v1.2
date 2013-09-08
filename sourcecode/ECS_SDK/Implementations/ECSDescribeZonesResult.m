//
//  ECSDescribeZonesResult.m
//  samples_ios
//
//  Created by zhang baocai on 8/28/13.
//
//

#import "ECSDescribeZonesResult.h"
#import "NSArray+ECSZones.h"
@implementation ECSDescribeZonesResult
@synthesize zones = _zones;
-(void)dealloc
{
    [_zones release]; _zones = nil;
    [super dealloc];
}
-(id)initWithXMLData:(NSData*)data
{
    if (self = [super initWithXMLData:data]) {
        _zones = [[NSArray alloc]initWithZonesXMLData:data];
    }
    return self;
}
@end
