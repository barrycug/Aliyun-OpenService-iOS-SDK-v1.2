//
//  NSArray+ECSSecurityGroups.m
//  samples_ios
//
//  Created by zhang baocai on 9/5/13.
//
//

#import "NSArray+ECSSecurityGroups.h"
#import "TBXML.h"
#import "ECSSecurityGroup.h"
@implementation NSArray (ECSSecurityGroups)
-(id)initWithECSSecurityGroupsXMLData:(NSData*)data
{
    NSMutableArray * innerArray =[[NSMutableArray alloc] initWithCapacity:5];
    if (data != nil)
    {
        TBXML * tbxml=[[TBXML alloc]  initWithXMLData:data];
        TBXMLElement *rootXMLElement = tbxml.rootXMLElement;
        if (rootXMLElement != NULL) {
            
            TBXMLElement *securityGroupsXMLElement = [TBXML childElementNamed:@"SecurityGroups" parentElement: rootXMLElement];
            if (securityGroupsXMLElement != NULL) {
                TBXMLElement *securityGroupXMLElement = [TBXML childElementNamed:@"SecurityGroup" parentElement:securityGroupsXMLElement];
                while (securityGroupXMLElement != NULL) {
                    
                    NSString * description = @"";
                    NSString * securityGroupId= @"";
                    TBXMLElement *descriptionXMLElement = [TBXML childElementNamed:@"Description" parentElement:securityGroupXMLElement];
                    if (descriptionXMLElement != NULL) {
                        description = [TBXML textForElement:descriptionXMLElement];
                    }
                    
                    TBXMLElement *securityGroupIdXMLElement = [TBXML childElementNamed:@"SecurityGroupId" parentElement:securityGroupXMLElement];
                    if (securityGroupIdXMLElement != NULL) {
                        securityGroupId = [TBXML textForElement:securityGroupIdXMLElement];
                    }
                    ECSSecurityGroup * securityGroup = [[ECSSecurityGroup alloc] initWithDescription:description securityGroupId:securityGroupId];
             
                    [innerArray addObject:securityGroup];
                    [securityGroup release];
                    securityGroupXMLElement = securityGroupXMLElement->nextSibling;
                }
                
            }
            
        }
        [tbxml release];
        tbxml = nil;
    }
    
    if(self = [self initWithArray:innerArray ])
    {
        ;
    }
    [innerArray release];
    return self;
}
@end
