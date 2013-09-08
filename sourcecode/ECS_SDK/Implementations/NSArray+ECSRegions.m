//
//  NSArray+ECSRegions.m
//  samples_ios
//
//  Created by zhang baocai on 8/28/13.
//
//

#import "NSArray+ECSRegions.h"
#import "TBXML.h"
@implementation NSArray (ECSRegions)
-(id)initWithRegionsXMLData:(NSData*)data
{
    NSMutableArray * innerArray =[[NSMutableArray alloc] initWithCapacity:5];
    if (data != nil)
    {
        TBXML * tbxml=[[TBXML alloc]  initWithXMLData:data];
        TBXMLElement *rootXMLElement = tbxml.rootXMLElement;
        if (rootXMLElement != NULL) {
            
            TBXMLElement *regionsXMLElement = [TBXML childElementNamed:@"Regions" parentElement: rootXMLElement];
            if (regionsXMLElement != NULL) {
                TBXMLElement *regionXMLElement = [TBXML childElementNamed:@"Region" parentElement:regionsXMLElement];
                while (regionXMLElement != NULL) {
                    TBXMLElement *regionIdXMLElement = [TBXML childElementNamed:@"RegionId" parentElement:regionXMLElement];
                    if (regionIdXMLElement != NULL) {
                       NSString* regionId = [TBXML textForElement:regionIdXMLElement];
                        [innerArray addObject:regionId];
                    }

                    regionXMLElement = regionXMLElement->nextSibling;
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
