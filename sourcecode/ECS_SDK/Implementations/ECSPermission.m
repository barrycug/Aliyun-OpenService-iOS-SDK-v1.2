//
//  ECSPermission.m
//  samples_ios
//
//  Created by zhang baocai on 9/5/13.
//
//

#import "ECSPermission.h"

@implementation ECSPermission
@synthesize ipProtocolType = _ipProtocolType;
@synthesize nicType= _nicType;
@synthesize policy= _policy;
@synthesize portRange= _portRange;
@synthesize sourceCidrIp= _sourceCidrIp;
@synthesize sourceGroupId= _sourceGroupId;
-(void)dealloc
{
    [_policy release];_policy=nil;
    [_portRange release];_portRange=nil;
    [_sourceCidrIp release];_sourceCidrIp=nil;
    [_sourceGroupId release];_sourceGroupId=nil;
    [super dealloc];
}
-(id) initWithIpProtocolType:(ECSIpProtocolType) ipProtocolType
                     nicType:(ECSNicType) nicType
                      policy:(NSString *)policy
                   portRange:(NSString *)portRange
                sourceCidrIp:(NSString *)sourceCidrIp
               sourceGroupId:(NSString *)sourceGroupId
{
    if (self = [super init]) {
        _ipProtocolType = ipProtocolType;
        _nicType= nicType;
        _policy= [policy retain];
        _portRange= [portRange retain];
        _sourceCidrIp= [sourceCidrIp retain];
        _sourceGroupId= [sourceGroupId retain];
    }
    return self;
}
@end
