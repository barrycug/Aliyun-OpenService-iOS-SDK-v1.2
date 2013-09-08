//
//  NSArray+ECSZones.m
//  samples_ios
//
//  Created by zhang baocai on 8/28/13.
//
//

#import "NSArray+ECSZones.h"
#import "TBXML.h"
@implementation NSArray (ECSZones)
-(id)initWithZonesXMLData:(NSData*)data
{
    NSMutableArray * innerArray =[[NSMutableArray alloc] initWithCapacity:5];
    if (data != nil)
    {
        TBXML * tbxml=[[TBXML alloc]  initWithXMLData:data];
        TBXMLElement *rootXMLElement = tbxml.rootXMLElement;
        if (rootXMLElement != NULL) {
            
            TBXMLElement *zonesXMLElement = [TBXML childElementNamed:@"Zones" parentElement: rootXMLElement];
            if (zonesXMLElement != NULL) {
                TBXMLElement *zoneXMLElement = [TBXML childElementNamed:@"Zone" parentElement:zonesXMLElement];
                while (zoneXMLElement != NULL) {
                    TBXMLElement *zoneIdXMLElement = [TBXML childElementNamed:@"ZoneId" parentElement:zoneXMLElement];
                    if (zoneIdXMLElement != NULL) {
                        NSString* zoneId = [TBXML textForElement:zoneIdXMLElement];
                        [innerArray addObject:zoneId];
                    }
                    
                    zoneXMLElement = zoneXMLElement->nextSibling;
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
