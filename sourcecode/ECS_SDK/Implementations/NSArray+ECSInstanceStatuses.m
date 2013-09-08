//
//  NSArray+InstancesStatus.m
//  samples_ios
//
//  Created by zhang baocai on 9/1/13.
//
//

#import "NSArray+ECSInstanceStatuses.h"
#import "TBXML.h"
#import "ECSInstanceStatus.h"
#import "ECSBaseType.h"
#import "ECSUtil.h"
@implementation NSArray (ECSInstanceStatuses)
-(id)initWithECSInstanceStatusesXMLData:(NSData*)data
{
    NSMutableArray * innerArray =[[NSMutableArray alloc] initWithCapacity:5];
    if (data != nil)
    {
        TBXML * tbxml=[[TBXML alloc]  initWithXMLData:data];
        TBXMLElement *rootXMLElement = tbxml.rootXMLElement;
        if (rootXMLElement != NULL) {
            
            TBXMLElement *instanceStatusesXMLElement = [TBXML childElementNamed:@"InstanceStatuses" parentElement: rootXMLElement];
            if (instanceStatusesXMLElement != NULL) {
                TBXMLElement *instanceStatusXMLElement = [TBXML childElementNamed:@"InstanceStatus" parentElement:instanceStatusesXMLElement];
                while (instanceStatusXMLElement != NULL) {
                    NSString *instanceId=@"";
                    ECSInstanceStatusItemType   type=ECSInstanceStatusItemType_Stopped;
                    TBXMLElement *statusXMLElement = [TBXML childElementNamed:@"Status" parentElement:instanceStatusXMLElement];
                    if (statusXMLElement != NULL) {
                        type =[ECSUtil stringToInstanceStatusItemType:[TBXML textForElement:statusXMLElement]];
                    }
                    
                    TBXMLElement *instanceIdXMLElement = [TBXML childElementNamed:@"instanceId" parentElement:instanceStatusXMLElement];
                    if (instanceIdXMLElement != NULL) {
                        instanceId = [TBXML textForElement:instanceIdXMLElement];
                    }
                    
                    ECSInstanceStatus * status = [[ECSInstanceStatus alloc] initWithInstanceStatusItemType:type instanceId:instanceId];
                    [innerArray addObject:status];
                    [status release];
                    instanceStatusXMLElement = instanceStatusXMLElement->nextSibling;
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
