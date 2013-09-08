//
//  ECSDescribeRegionsResult.h
//  samples_ios
//
//  Created by zhang baocai on 8/28/13.
//
//

#import <Foundation/Foundation.h>
#import "ECSResult.h"
@interface ECSDescribeRegionsResult : ECSResult
{
@private
    NSArray *_regions;
}
@property(retain,nonatomic)NSArray *regions;
-(id)initWithXMLData:(NSData*)data;
@end