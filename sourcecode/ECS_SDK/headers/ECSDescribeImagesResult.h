//
//  ECSDescribeImagesResult.h
//  samples_ios
//
//  Created by zhang baocai on 8/28/13.
//
//

#import "ECSResult.h"
/*
 <DescribeImagesResponse>
 
 <PageNumber>1</PageNumber>
 <PageSize>10</PageSize>
 <RegionId>cn-qingdao-cm5-a01</RegionId>
 <TotalCount>126</TotalCount>
 <RequestId>EC58ED01-6D87-4335-9E7A-32E9D553252E</RequestId>
 </DescribeImagesResponse>
 */
@interface ECSDescribeImagesResult : ECSResult
{
@private
    NSArray * _images;
    int _pageNumber;
    int _pageSize;
    NSString *_regionId;
    int _totalCount;
}
@property(nonatomic,retain)NSArray *images;
@property(nonatomic,assign)int pageNumber;
@property(nonatomic,assign)int pageSize;
@property(nonatomic,retain)NSString *regionId;
@property(nonatomic,assign)int totalCount;
-(id)initWithXMLData:(NSData*)data;
@end
