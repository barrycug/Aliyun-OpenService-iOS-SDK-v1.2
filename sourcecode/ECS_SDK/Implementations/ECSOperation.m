//
//  ECSOperation.m
//  samples_ios
//
//  Created by zhang baocai on 7/9/13.
//
//

#import "ECSOperation.h"
#import "ServiceCredentials.h"
#import "ExecutionContext.h"
#import "ECSRequestSigner.h"
@interface ECSOperation()<ServiceClientDelegate>
@end
@implementation ECSOperation
-(void) dealloc
{
    if(_endpoint != nil)
    {
        [_endpoint release];
        _endpoint = nil;
    }
    if(_credentials != nil)
    {
        [_credentials release];
        _credentials = nil;
    }
    if(_client != nil)
    {
        [_client release];
        _client = nil;
    }
    [super dealloc];
}
-(id) initWithEndPoint:(NSString * ) endpoint credentials:(ServiceCredentials *)credentials client:(DefaultServiceClient *)client
{
    if (self = [super init]) {
        _endpoint = endpoint;
        [_endpoint retain];
        _credentials = credentials;
        [_credentials retain];
        _client = client;
        _client.delegate = self;
        [_client retain];
    }
    return self;
}

-(void) invokeNoResultWithHttpMethod:(HttpMethod) httpMethod params:(OrderedDictionary*)params  userInfo:(NSDictionary*)userInfo
{
    [_client sendRequest:[self buildRequestWithHttpMethod:httpMethod params:params  userInfo:(NSDictionary*)userInfo]  executionContext:[self createContext:httpMethod]];
}
-(ExecutionContext*)  createContext:(HttpMethod) httpMethod
{
    ExecutionContext *executionContext =[[ExecutionContext alloc] init ];
    executionContext.charset = NSUTF8StringEncoding;
    ECSRequestSigner * signer = [[ECSRequestSigner alloc] initWithHttpMethod:httpMethod credentials:_credentials];
    executionContext.signer = signer;
    [signer release];
    return [executionContext autorelease];
}
-(RequestMessage*)  buildRequestWithHttpMethod: (HttpMethod) httpMethod params:(OrderedDictionary*)params  userInfo:(NSDictionary*)userInfo
{
    return[ECSOperation buildRequest:_endpoint   httpMethod:httpMethod params:params credentials:_credentials  userInfo:(NSDictionary*)userInfo];
}
+(RequestMessage*) buildRequest:(NSString *) uri  httpMethod: (HttpMethod) httpMethod params:(OrderedDictionary*)params credentials:(ServiceCredentials *)credentials userInfo:(NSDictionary*)userInfo
{
    RequestMessage *requestMessage =[[ RequestMessage alloc] init];
    requestMessage.method = httpMethod;
    requestMessage.endpoint = uri;
    requestMessage.resourcePath = @"";
    if (params == nil) {
        params = [OrderedDictionary dictionaryWithCapacity:10];
    }
    requestMessage.parameters = params;
    requestMessage.userInfo = userInfo;
    return [requestMessage autorelease];
    
}

-(void)serviceClientRequestFinished:(DefaultServiceClient*)defaultServiceClient result:(id) result
{
    
}
-(void)serviceClientRequestFailed:(DefaultServiceClient*)defaultServiceClient error:(id) error
{
    
}
@end
