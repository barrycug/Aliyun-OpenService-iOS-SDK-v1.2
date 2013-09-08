//
//  ECSFetchMonitorDataResult.m
//  samples_ios
//
//  Created by zhang baocai on 9/4/13.
//
//

#import "ECSFetchMonitorDataResult.h"
#import "TBXML.h"
#import "NSArray+ECSInstanceMonitorData.h"
@implementation ECSFetchMonitorDataResult

@synthesize  monitorData = _monitorData;
@synthesize  pageNumber = _pageNumber;
@synthesize  pageSize = _pageSize;
@synthesize  regionId = _regionId;
@synthesize  time = _time;
@synthesize  totalCount = _totalCount;
-(void)dealloc
{
    [_monitorData release]; _monitorData = nil;
    [_regionId release]; _regionId = nil;
    [_time release]; _time = nil;
    [super dealloc];
}
-(id)initWithXMLData:(NSData *)data
{
    if (self = [super initWithXMLData:data]) {
        if (data != nil)
        {
            TBXML * tbxml=[[TBXML alloc]  initWithXMLData:data];
            TBXMLElement *rootXMLElement = tbxml.rootXMLElement;
            if (rootXMLElement != NULL) {
               
                _monitorData = [[NSArray alloc] initWithECSMonitorDataXMLData:data];
                 TBXMLElement * regionIdXMLElement = [TBXML childElementNamed:@"RegionId" parentElement:rootXMLElement];
                if (regionIdXMLElement != NULL) {
                    _regionId = [[TBXML textForElement:regionIdXMLElement] retain];
                }
                TBXMLElement * timeXMLElement = [TBXML childElementNamed:@"Time" parentElement:rootXMLElement];
                if (timeXMLElement != NULL) {
                    _time = [[TBXML textForElement:timeXMLElement] retain];
                }
                TBXMLElement *pageNumberXMLElement = [TBXML childElementNamed:@"PageNumber" parentElement:rootXMLElement];
                NSString* strPageNumber = [TBXML textForElement:pageNumberXMLElement];
                _pageNumber = [strPageNumber intValue];
                
                TBXMLElement *pageSizeXMLElement = [TBXML childElementNamed:@"PageSize" parentElement:rootXMLElement];
                NSString* strPageSize = [TBXML textForElement:pageSizeXMLElement];
                _pageSize= [strPageSize intValue];
                
                TBXMLElement *totalCountXMLElement = [TBXML childElementNamed:@"TotalCount" parentElement:rootXMLElement];
                NSString *strTotalCount = [TBXML textForElement:totalCountXMLElement];
                _totalCount = [strTotalCount intValue];
                
                
            }
        }
    }
    return self;

}
@end
