//
//  ECSCreateSecurityGroupResult.m
//  samples_ios
//
//  Created by zhang baocai on 9/5/13.
//
//

#import "ECSCreateSecurityGroupResult.h"
#import "TBXML.h"

@implementation ECSCreateSecurityGroupResult
@synthesize securityGroupId = _securityGroupId;
-(void)dealloc
{
    [_securityGroupId release];_securityGroupId = nil;
    [super dealloc];
}
-(id) initWithXMLData:(NSData *) data
{
    if (self = [super initWithXMLData:data]) {
        if (data != nil)
        {
            TBXML * tbxml=[[TBXML alloc]  initWithXMLData:data];
            TBXMLElement *rootXMLElement = tbxml.rootXMLElement;
            if (rootXMLElement != NULL) {
                TBXMLElement *securityGroupIdXMLElement = [TBXML childElementNamed:@"SecurityGroupId" parentElement:rootXMLElement];
               _securityGroupId = [[TBXML textForElement:securityGroupIdXMLElement] retain];
            }
        }
    }
    return self;

}
@end
