//
//  ECSResult.h
//  samples_ios
//
//  Created by zhang baocai on 8/28/13.
//
//

#import <Foundation/Foundation.h>
#import "ECSCoder.h"
@interface ECSResult : NSObject<ECSCoder>
{
@private
    NSString * _requestId;
}
@property(nonatomic,retain,readonly) NSString * requestId;
-(id) initWithRequestId:(NSString*) requestId;
+(id) ECSResultWithRequestId:(NSString*) requestId;
-(id) initWithXMLData:(NSData *) data;
@end
