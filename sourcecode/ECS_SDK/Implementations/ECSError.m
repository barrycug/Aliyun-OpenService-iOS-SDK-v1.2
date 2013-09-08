//
//  ECSError.m
//  samples_ios
//
//  Created by zhang baocai on 7/10/13.
//
//

#import "ECSError.h"
#import "TBXML.h"
@implementation ECSError
@synthesize errorCode = _errorCode;
@synthesize errorMessage = _errorMessage;
@synthesize errorHostId = _errorHostId;
@synthesize errorRequestId = _errorRequestId;
-(void) dealloc
{
    [_errorCode release]; _errorCode= nil;
    [_errorMessage release];_errorMessage = nil;
    [_errorRequestId release];_errorRequestId = nil;
    [_errorHostId release];_errorHostId = nil;
    [super dealloc];
}
-(id) initWithErrorCode:(NSString*) code
                message:(NSString*) message
              requestId:(NSString*) requestId
                 hostId:(NSString*) hostId
{
    if (self = [super init]) {
        _errorCode = code;
        [_errorCode retain];
        _errorMessage = message;
        [_errorMessage retain];
        _errorRequestId = requestId;
        [_errorRequestId retain];
        _errorHostId = hostId;
        [_errorHostId retain];
        
    }
    return self;
}

+(id) ECSErrorWithErrorCode:(NSString*) code
                    message:(NSString*) message
                  requestId:(NSString*) requestId
                     hostId:(NSString*) hostId
{
    ECSError * error = [[ECSError alloc] initWithErrorCode:code
                                                   message:message
                                                 requestId:requestId
                                                    hostId:hostId];
    return [error autorelease];
}
-(id) initWithXMLData:(NSData *) data
{
    NSString * code = @"";
    NSString * message = @"";
    NSString * requestId = @"";
    NSString * hostId = @"";
    if (data != nil)
    {
        TBXML * tbxml=[[TBXML alloc]  initWithXMLData:data];
        TBXMLElement *rootXMLElement = tbxml.rootXMLElement;
        if (rootXMLElement != nil) {
            TBXMLElement *codeXMLElement = [TBXML childElementNamed:@"Code" parentElement: rootXMLElement];
            if (codeXMLElement != nil) {
                code = [TBXML textForElement:codeXMLElement];
            }
            
            TBXMLElement *messageXMLElement = [TBXML childElementNamed:@"Message" parentElement: rootXMLElement];
            if (messageXMLElement != nil) {
                message = [TBXML textForElement:messageXMLElement];
            }
            
            TBXMLElement *requestIdXMLElement = [TBXML childElementNamed:@"RequestId" parentElement: rootXMLElement];
            if (requestIdXMLElement != nil) {
                requestId = [TBXML textForElement:requestIdXMLElement];
            }
            
            TBXMLElement *hostIdXMLElement = [TBXML childElementNamed:@"HostId" parentElement: rootXMLElement];
            if (hostIdXMLElement != nil) {
                hostId = [TBXML textForElement:hostIdXMLElement];
            }
            
            
        }
        [tbxml release];
        tbxml = nil;
    }
    
    if(self = [self initWithErrorCode:code
                              message:message
                            requestId:requestId
                               hostId:hostId]
       )
    {
        ;
    }
    return self;
}


@end
