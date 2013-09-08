//
//  ECSDescribeZonesResult.h
//  samples_ios
//
//  Created by zhang baocai on 8/28/13.
//
//

#import <Foundation/Foundation.h>
#import "ECSResult.h"
@interface ECSDescribeZonesResult : ECSResult
{
@private

    NSArray  *_zones;
}
@property(retain,nonatomic)NSArray *zones;
-(id)initWithXMLData:(NSData*)data;
@end
