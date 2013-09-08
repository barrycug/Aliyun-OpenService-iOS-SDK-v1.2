//
//  ECSSecurityGroup.h
//  samples_ios
//
//  Created by zhang baocai on 9/5/13.
//
//

#import <Foundation/Foundation.h>
/*
 <SecurityGroup>
 <Description>test</Description>
 <SecurityGroupId>G1364d5a7-18ba-441f-8c2b-13d8279a20de</SecurityGroupId>
 </SecurityGroup>
 */
@interface ECSSecurityGroup : NSObject
{
    NSString * _description;
    NSString * _securityGroupId;
}
@property(nonatomic,retain)NSString *description;
@property(nonatomic,retain)NSString *securityGroupId;
-(id) initWithDescription:(NSString*)description securityGroupId:(NSString*)securityGroupId;
@end
