//
//  ECSResult.m
//  samples_ios
//
//  Created by zhang baocai on 8/28/13.
//
//

#import "ECSResult.h"
#import "TBXML.h"
@implementation ECSResult
@synthesize requestId = _requestId;
-(void) dealloc
{
    [_requestId release]; _requestId= nil;
    [super dealloc];
   
}
-(id) initWithRequestId:(NSString*) requestId
{
    if (self = [super init]) {

        _requestId = requestId;
        [_requestId retain];
        
    }
    return self;
}
+(id) ECSResultWithRequestId:(NSString*) requestId
{
    return [[[ECSResult alloc]initWithRequestId:requestId] autorelease];
}
-(id) initWithXMLData:(NSData *) data
{
    NSString * requestId = @"";
    if (data != nil)
    {
        TBXML * tbxml=[[TBXML alloc]  initWithXMLData:data];
        TBXMLElement *rootXMLElement = tbxml.rootXMLElement;
        if (rootXMLElement != nil) {
            
            TBXMLElement *requestIdXMLElement = [TBXML childElementNamed:@"RequestId" parentElement: rootXMLElement];
            if (requestIdXMLElement != nil) {
                requestId = [TBXML textForElement:requestIdXMLElement];
            }
            
        }
        [tbxml release];
        tbxml = nil;
    }
    
    if(self = [self initWithRequestId:requestId ])
    {
        ;
    }
    return self;
}

@end
