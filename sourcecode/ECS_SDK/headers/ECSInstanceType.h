//
//  ECSInstanceType.h
//  samples_ios
//
//  Created by zhang baocai on 9/5/13.
//
//

#import <Foundation/Foundation.h>
/*
 <InstanceType>
 <CpuCoreCount>1</CpuCoreCount>
 <InstanceTypeId>ecs.s1.medium</InstanceTypeId>
 <MemorySize>4.0</MemorySize>
 </InstanceType>
 */
@interface ECSInstanceType : NSObject
{
    int _cpuCoreCount;
    NSString * _instanceTypeId;
    NSString * _memorySize;
}
@property(nonatomic,assign)int cpuCoreCount;
@property(nonatomic,retain)NSString * instanceTypeId;
@property(nonatomic,assign)NSString * memorySize;
-(id)initWithCPUCoreCount:(int)cpuCoreCount
           instanceTypeId:(NSString *)instanceTypeId
               memorySize:(NSString *)memorySize;
@end
