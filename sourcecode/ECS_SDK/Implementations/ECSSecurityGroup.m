//
//  ECSSecurityGroup.m
//  samples_ios
//
//  Created by zhang baocai on 9/5/13.
//
//

#import "ECSSecurityGroup.h"

@implementation ECSSecurityGroup
@synthesize securityGroupId = _securityGroupId;
@synthesize description = _description;
-(void) dealloc
{
    [_description release];_description= nil;
    [_securityGroupId release];_securityGroupId= nil;
    [super dealloc];
}
-(id) initWithDescription:(NSString*)description securityGroupId:(NSString*)securityGroupId
{
    if (self = [super init]) {
        _description = [description retain];
        _securityGroupId = [securityGroupId retain];
    }
    return self;
}
@end
