//
//  NSArray+ECSSecurityGroupIds.m
//  samples_ios
//
//  Created by zhang baocai on 9/1/13.
//
//

#import "NSArray+ECSSecurityGroupIds.h"
#import "TBXML.h"
/*
 <SecurityGroupIds>
 <SecurityGroupId>G1355944407736541</SecurityGroupId>
 </SecurityGroupIds>
 */
@implementation NSArray (ECSSecurityGroupIds)
-(id)initWithECSSecurityGroupIdsXMLData:(NSData*)data
{
    NSMutableArray * innerArray =[[NSMutableArray alloc] initWithCapacity:5];
    if (data != nil)
    {
        TBXML * tbxml=[[TBXML alloc]  initWithXMLData:data];
        TBXMLElement *rootXMLElement = tbxml.rootXMLElement;
        if (rootXMLElement != NULL)
        {
            
            TBXMLElement *securityGroupIdsXMLElement = [TBXML childElementNamed:@"SecurityGroupIds" parentElement: rootXMLElement];
            if (securityGroupIdsXMLElement != NULL)
            {
                TBXMLElement *securityGroupIdXMLElement = [TBXML childElementNamed:@"SecurityGroupId" parentElement:securityGroupIdsXMLElement];
                while (securityGroupIdXMLElement != NULL)
                {
                    
                    NSString* securityGroupId = [TBXML textForElement:securityGroupIdXMLElement];
                    [innerArray addObject:securityGroupId];
                     securityGroupIdXMLElement = securityGroupIdXMLElement->nextSibling;
                    
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
