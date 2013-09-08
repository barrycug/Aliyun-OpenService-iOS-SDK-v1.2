//
//  ECSDescribeSecurityGroupAttributeResult.m
//  samples_ios
//
//  Created by zhang baocai on 9/5/13.
//
//

#import "ECSDescribeSecurityGroupAttributeResult.h"
#import "TBXML.h"
#import "NSArray+ECSPermissions.h"
@implementation ECSDescribeSecurityGroupAttributeResult
@synthesize description = _description;
@synthesize securityGroupId = _securityGroupId;
@synthesize permissions = _permissions;
-(void)dealloc
{
    [_description release];_description = nil;
    [_securityGroupId release];_securityGroupId = nil;
    [_permissions release];_permissions = nil;
    [super dealloc];
}
-(id) initWithXMLData:(NSData *)data
{
    if (self = [super initWithXMLData:data]) {
        if (data != nil)
        {
            TBXML * tbxml=[[TBXML alloc]  initWithXMLData:data];
            TBXMLElement *rootXMLElement = tbxml.rootXMLElement;
            if (rootXMLElement != NULL) {
                TBXMLElement *securityGroupIdXMLElement = [TBXML childElementNamed:@"SecurityGroupId" parentElement:rootXMLElement];
                if (securityGroupIdXMLElement != NULL) {
                     _securityGroupId = [[TBXML textForElement:securityGroupIdXMLElement] retain];
                }
                TBXMLElement *descriptionXMLElement = [TBXML childElementNamed:@"Description" parentElement:rootXMLElement];
                if (descriptionXMLElement != NULL) {
                    _description = [[TBXML textForElement:descriptionXMLElement] retain];
                }
                _permissions = [[NSArray alloc] initWithECSPermissionsXMLData:data];

               
            }
        }
    }
    return self;
}
@end
