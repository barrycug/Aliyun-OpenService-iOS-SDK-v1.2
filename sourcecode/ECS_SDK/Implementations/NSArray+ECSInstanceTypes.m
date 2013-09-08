//
//  NSArray+ECSInstanceTypes.m
//  samples_ios
//
//  Created by zhang baocai on 9/5/13.
//
//

#import "NSArray+ECSInstanceTypes.h"
#import "TBXML.h"
#import "ECSInstanceType.h"
@implementation NSArray (ECSInstanceTypes)
-(id)initWithECSInstanceTypesXMLData:(NSData*)data
{
    NSMutableArray * innerArray =[[NSMutableArray alloc] initWithCapacity:5];
    if (data != nil)
    {
        TBXML * tbxml=[[TBXML alloc]  initWithXMLData:data];
        TBXMLElement *rootXMLElement = tbxml.rootXMLElement;
        if (rootXMLElement != NULL) {
            
            TBXMLElement *instanceTypesXMLElement = [TBXML childElementNamed:@"InstanceTypes" parentElement: rootXMLElement];
            if (instanceTypesXMLElement != NULL) {
                TBXMLElement *instanceTypeXMLElement = [TBXML childElementNamed:@"InstanceType" parentElement:instanceTypesXMLElement];
                while (instanceTypeXMLElement != NULL) {
                    int cpuCoreCount = 0;
                    NSString * instanceTypeId = @"";
                    NSString * memorySize = @"";
                    TBXMLElement *cpuCoreCountXMLElement = [TBXML childElementNamed:@"CpuCoreCount" parentElement:instanceTypeXMLElement];
                    if (cpuCoreCountXMLElement != NULL) {
                        cpuCoreCount = [[TBXML textForElement:cpuCoreCountXMLElement] intValue];
                    }
                    
                    TBXMLElement *instanceTypeIdXMLElement = [TBXML childElementNamed:@"InstanceTypeId" parentElement:instanceTypeXMLElement];
                    if (instanceTypeIdXMLElement != NULL) {
                        instanceTypeId = [[TBXML textForElement:instanceTypeIdXMLElement] retain];
                    }
                    
                    TBXMLElement *memorySizeXMLElement = [TBXML childElementNamed:@"MemorySize" parentElement:instanceTypeXMLElement];
                    if (memorySizeXMLElement != NULL) {
                        memorySize = [TBXML textForElement:memorySizeXMLElement];

                    }
                    ECSInstanceType *type = [[ECSInstanceType alloc] initWithCPUCoreCount:cpuCoreCount instanceTypeId:instanceTypeId memorySize:memorySize];
                    [innerArray addObject:type];
                    [type release];
                    instanceTypeXMLElement = instanceTypeXMLElement->nextSibling;
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
