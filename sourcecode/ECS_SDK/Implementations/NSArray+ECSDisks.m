//
//  NSArray+ECSDisks.m
//  samples_ios
//
//  Created by zhang baocai on 9/4/13.
//
//

#import "NSArray+ECSDisks.h"
#import "TBXML.h"
#import "ECSDisk.h"
#import "ECSUtil.h"
@implementation NSArray (ECSDisks)
-(id)initWithECSDisksXMLData:(NSData*)data
{
    NSMutableArray * innerArray =[[NSMutableArray alloc] initWithCapacity:5];
    if (data != nil)
    {
        TBXML * tbxml=[[TBXML alloc]  initWithXMLData:data];
        TBXMLElement *rootXMLElement = tbxml.rootXMLElement;
        if (rootXMLElement != NULL) {
            
            TBXMLElement *disksXMLElement = [TBXML childElementNamed:@"Disks" parentElement: rootXMLElement];
            if (disksXMLElement != NULL) {
                TBXMLElement *diskXMLElement = [TBXML childElementNamed:@"Disk" parentElement:disksXMLElement];
                while (diskXMLElement != NULL) {
                    NSString *diskId=@"";
                    long      size=0;
                    ECSDiskType type = ECSDiskType_System;
                    TBXMLElement *diskIdXMLElement = [TBXML childElementNamed:@"DiskId" parentElement:diskXMLElement];
                    if (diskIdXMLElement != NULL) {
                        diskId = [TBXML textForElement:diskIdXMLElement];
                    }
                    
                    TBXMLElement *sizeXMLElement = [TBXML childElementNamed:@"Size" parentElement:diskXMLElement];
                    if (sizeXMLElement != NULL) {
                        size = [[TBXML textForElement:sizeXMLElement] intValue];
                    }
                    
                    TBXMLElement *diskTypeXMLElement = [TBXML childElementNamed:@"DiskType" parentElement:diskXMLElement];
                    if (diskTypeXMLElement != NULL) {
                        NSString * strDiskType=@"";
                        strDiskType = [TBXML textForElement:diskTypeXMLElement];
                        type = [ECSUtil stringToDiskType:strDiskType];
                    }
                    ECSDisk * disk = [[ECSDisk alloc] initWithDiskId:diskId size:size type:type];
                    [innerArray addObject:disk];
                    [disk release];
                    diskXMLElement = diskXMLElement->nextSibling;
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
