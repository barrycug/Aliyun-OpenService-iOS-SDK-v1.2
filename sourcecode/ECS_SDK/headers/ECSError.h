//
//  ECSError.h
//  samples_ios
//
//  Created by zhang baocai on 7/10/13.
//
//

#import <Foundation/Foundation.h>
#import "ECSCoder.h"
@interface ECSError : NSObject<ECSCoder>
{
@private
    NSString * _errorCode;
    NSString * _errorMessage;
    NSString * _errorRequestId;
    NSString * _errorHostId;
}
/**
 错误码
 */
@property(nonatomic,retain,readonly) NSString * errorCode;
/**
 错误消息
 */
@property(nonatomic,retain,readonly) NSString * errorMessage;

/**
 RequestId
 */
@property(nonatomic,retain,readonly) NSString * errorRequestId;
/**
 HostId
 */
@property(nonatomic,retain,readonly) NSString * errorHostId;

/**
 初始化方法
 @param code NSString
 @param message NSString
 @param requestId NSString
 @param hostId NSString
 
 */
-(id) initWithErrorCode:(NSString*) code
                message:(NSString*) message
              requestId:(NSString*) requestId
                 hostId:(NSString*) hostId;
/**
 静态初始化方法 返回autorelease 对象
 @param code NSString
 @param message NSString
 @param requestId NSString
 @param hostId NSString
 */
+(id) ECSErrorWithErrorCode:(NSString*) code
                    message:(NSString*) message
                  requestId:(NSString*) requestId
                     hostId:(NSString*) hostId;
-(id) initWithXMLData:(NSData *) data;
@end


