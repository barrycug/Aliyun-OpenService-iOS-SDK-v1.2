//
//  ECSDescribeInstanceDisksResult.h
//  samples_ios
//
//  Created by zhang baocai on 9/4/13.
//
//

#import "ECSResult.h"

@interface ECSDescribeInstanceDisksResult : ECSResult
{
    NSArray *_disks;
}
@property(nonatomic,retain)NSArray *disks;
-(id)initWithXMLData:(NSData *)data;
@end
