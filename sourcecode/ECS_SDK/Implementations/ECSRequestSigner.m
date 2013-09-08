//
//  ECSRequestSigner.m
//  samples_ios
//
//  Created by zhang baocai on 7/9/13.
//
//

#import "ECSRequestSigner.h"
#import "ServiceCredentials.h"
#import "RequestMessage.h"
#import "DateUtil.h"
#import "HmacSHA1Signature.h"
#import "HttpUtil.h"
#import "GHNSData+Base64.h"
@interface ECSRequestSigner()
-(void) addRequiredParameters:(NSMutableDictionary*)params credentials:(ServiceCredentials*) credentials;
-(void) addSignature:(HttpMethod )method params:(NSMutableDictionary*)params credentials:(ServiceCredentials *)credentials;
-(NSString*)getSignature:(HttpMethod )method  params:(NSMutableDictionary*)params credentials:(ServiceCredentials*) credentials;
@end
@implementation ECSRequestSigner
-(void) dealloc
{
    if (_credentials != nil) {
        [_credentials release];
        _credentials = nil;
    }
    [super dealloc];
}
-(id) initWithHttpMethod:(HttpMethod )method credentials:(ServiceCredentials *)credentials
{
    if (self = [super init]) {
        _method = method;
        _credentials = credentials;
        [_credentials retain];
    }
    return self;
}
-(void) sign:(RequestMessage*) requestMessage
{
    [self addRequiredParameters:requestMessage.parameters credentials:_credentials];
    [self addSignature:_method params:requestMessage.parameters credentials:_credentials];
}
-(void) addSignature:(HttpMethod )method params:(NSMutableDictionary*)params credentials:(ServiceCredentials *)credentials
{
    [params setObject:[self getSignature:method params:params credentials:credentials] forKey:@"Signature"];
}

-(void) addRequiredParameters:(NSMutableDictionary*)params credentials:(ServiceCredentials*) credentials
{
    if (params == nil) {
        params = [NSMutableDictionary dictionaryWithCapacity:10];
    }
    HmacSHA1Signature  * signer = [HmacSHA1Signature defaultHmacSHA1Signature];
    [params  setObject:[DateUtil formatISO8601Date:[NSDate date]] forKey:@"Timestamp"];
    [params  setObject:credentials.accessID forKey:@"AccessKeyId"];
    [params  setObject:@"2013-01-10" forKey:@"Version"];
    [params  setObject:@"XML" forKey:@"Format"];
    [params  setObject:[signer getAliasAlgorithm] forKey:@"SignatureMethod"];
    [params  setObject:[signer getAliasVersion] forKey:@"SignatureVersion"];
    long value = arc4random();
    [params  setObject:[NSString stringWithFormat:@"%ld",value] forKey:@"SignatureNonce"];
    
    
}
-(NSString*)getSignature:(HttpMethod )method  params:(NSMutableDictionary*)params credentials:(ServiceCredentials*) credentials
{
    // HttpUtil
    
    NSString * stringHead = [NSString stringWithFormat:@"%@&/&",[HttpUtil HttpMethod2String:method ]];
    NSString * string = [HttpUtil urlEncode:[HttpUtil  paramToQueryString:params encoding:NSUTF8StringEncoding] UsingEncoding:NSUTF8StringEncoding];

    NSString * stringUrl =[NSString stringWithFormat:@"%@%@",[HttpUtil urlEncodeNO7:stringHead UsingEncoding:NSUTF8StringEncoding],string] ;
   // NSLog(@"%@",stringUrl);
    HmacSHA1Signature  * signer = [HmacSHA1Signature defaultHmacSHA1Signature];
    NSString * strRtn =   [signer computeSignature:stringUrl withSecret:[NSString stringWithFormat:@"%@&",credentials.accessKey]];

    return strRtn;
}

@end
