//
//  ECSAllocatePublicIpAddressResult.m
//  samples_ios
//
//  Created by zhang baocai on 9/4/13.
//
//

#import "ECSAllocatePublicIpAddressResult.h"
#import "TBXML.h"
@implementation ECSAllocatePublicIpAddressResult
@synthesize ipAddress = _ipAddress;
-(void)dealloc
{
    [_ipAddress release];_ipAddress = nil;
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
                TBXMLElement * ipAddressXMLElement = [TBXML childElementNamed:@"IpAddress" parentElement:rootXMLElement];
                if (ipAddressXMLElement != NULL) {
                    _ipAddress = [[TBXML textForElement:ipAddressXMLElement] retain];
                }
            
                
            }
        }
    }
    return self;

}
@end
