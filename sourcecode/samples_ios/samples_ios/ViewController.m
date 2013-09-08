//
//  ViewController.m
//  samples_ios
//
//  Created by baocai zhang on 12-8-22.
//  Copyright (c) 2012年 baocai zhang. All rights reserved.
//

//在此处修改自己的aliyun OSS服务的 AccessID 和AccessKey

#define accessid @"9e0g1wvcoc9889d4c685iyq3"
#define accesskey @"MzxWwbrsHrFxnQCgY3ET8suIqck="
//在此处修改自己的aliyun OTS服务的 AccessID 和AccessKey
#define otsaccessid @"xxxxxxxxxxxxx"
#define otsaccesskey @"xxxxxxxxxxxxx="


#define ecsaccessid @"9e0g1wvcoc9889d4c685iyq3"
#define ecsaccesskey @"MzxWwbrsHrFxnQCgY3ET8suIqck="

#import "ViewController.h"
#import "DetailsViewController.h"
#import "LoginViewController.h"

@interface ViewController ()<OSSClientDelegate,OTSClientDelegate,LoginDelegate>

@end

@implementation ViewController
@synthesize tableView = _tableView;
@synthesize buckets = _buckets;
-(void)dealloc
{
    self.tableView = nil;
    [_client release];
    _client = nil;
    /*
    [_otsClient release];
    _otsClient = nil;
     */
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
   
    /*
    _otsClient = [[OTSClient alloc] initWithAccessId:otsaccessid andAccessKey:otsaccesskey];
    _otsClient.delegate = self;
     */
    _indexPath = nil;
    UIBarButtonItem * addItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd  target:self action:@selector(addBucket:)];
    [self.navigationItem setRightBarButtonItem:addItem];
    _buckets = [[NSMutableArray alloc] initWithCapacity:20];
    
 //   self.tableView.editing = YES;
 //   [self showLoginView];
 //   [self login];
    _ecsClient = [[ECSClient alloc]initWithAccessId:ecsaccessid andAccessKey:ecsaccesskey];
    NSString * instanceId = @"AY130828101740048aee";
    //imageId 可以通过DescribeImages 接口获得
    NSString * imageId = @"rhel54.64.20110322.01.vhd";
  //  [_ecsClient stopInstance:instanceId];
  //  [_ecsClient startInstance:instanceId];
 //   [_ecsClient rebootInstance:instanceId isForceStop:YES];
  //  [_ecsClient resetInstanceOS:instanceId imageId:imageId];
  //  [_ecsClient modifyInstanceAttributeWithInstanceId:instanceId password:@"1234567890" hostName:@"AY130828101740048aeeeeee" securityGroupId:nil];
   // [_ecsClient describeInstanceStatusWithRegionId:@"cn-qingdao-cm5-a01" zoneId:@"cn-qingdao-cm9003-a"];
   
    
    //[_ecsClient describeInstanceAttributeWithInstanceId:instanceId];
   // [_ecsClient describeInstanceDisksWithInstanceId:instanceId];
   // [_ecsClient allocatePublicIpAddressWithInstanceId:instanceId];
 //   [_ecsClient fetchMonitorDataWithRegionId:@"cn-qingdao-cm5-a01"];
  //  [_ecsClient fetchMonitorDataWithRegionId:@"cn-qingdao-cm5-a01" instanceId:instanceId];
   // [_ecsClient describeInstanceTypes];
  //  [_ecsClient createSecurityGroupWithRegionId:@"cn-qingdao-cm5-a01" description:@"test"];
    NSString * securityGroupId = @"G30421467-d11c-4992-9d7d-ed8283fbf41a";
  //  [_ecsClient authorizeSecurityGroupWithSecurityGroupId:securityGroupId regionId:@"cn-qingdao-cm5-a01" sourceCidrIp:@"0.0.0.0/0" ipProtocol:ECSIpProtocolType_TCP portRange:@"1/65535" policy:ECSPolicyType_Accecpt nicType:ECSNicType_Internet];
  //  [_ecsClient  describeSecurityGroupAttributeWithSecurityGroupId: securityGroupId regionId:@"cn-qingdao-cm5-a01"];
   // [_ecsClient describeSecurityGroupsWithRegionId:@"cn-qingdao-cm5-a01"];
  //  [_ecsClient revokeSecurityGroupWithSecurityGroupId:securityGroupId regionId:@"cn-qingdao-cm5-a01" sourceCidrIp:@"0.0.0.0/0" ipProtocol:ECSIpProtocolType_TCP portRange:@"1/65535" policy:ECSPolicyType_Accecpt nicType:ECSNicType_Internet];
    [_ecsClient deleteSecurityGroupWithSecurityGroupId:securityGroupId regionId:@"cn-qingdao-cm5-a01"];

    
    /*
     cn-qingdao-cm5-a01
     cn-hangzhou-dg-a01
     <Zone>
     <ZoneId>cn-qingdao-cm5001-a</ZoneId>
     </Zone>
     <Zone>
     <ZoneId>cn-qingdao-cm5002-a</ZoneId>
     </Zone>
     <Zone>
     <ZoneId>cn-qingdao-cm5004-a</ZoneId>
     </Zone>
     <Zone>
     <ZoneId>cn-qingdao-cm9001-a</ZoneId>
     </Zone>
     <Zone>
     <ZoneId>cn-qingdao-cm9002-a</ZoneId>
     </Zone>
     <Zone>
     <ZoneId>cn-qingdao-cm9003-a</ZoneId>
     </Zone>
     <Zone>
     <ZoneId>cn-qingdao-cm9004-a</ZoneId>
     </Zone>
     */
 //   [_ecsClient describeRegions];
 //   [_ecsClient describeZonesWithRegionId:@"cn-qingdao-cm5-a01"];
 //   [_ecsClient describeImagesWithRegionId:@"cn-qingdao-cm5-a01"];

}
-(void) login
{
    LoginViewController * loginVC = [[LoginViewController alloc] initWithNibName:@"LoginViewController" bundle:nil];
    loginVC.delegate = self;
    [self presentModalViewController:loginVC animated:YES];
}
-(void) loginWithUser:(NSString*) userName andPsw:(NSString *)psw
{
    if (_client != nil) {
        [_client release];
        _client = nil;
    }
    _client = [[OSSClient alloc] initWithAccessId:userName andAccessKey:psw];
    _client.delegate = self;
    [self listBucket];
}


-(void) addBucket:(id) sender
{
    UIAlertView  *alert = [[UIAlertView alloc] initWithTitle:@"输入新Bucket名称" message:@"" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK",nil];
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    [alert show];
    [alert release];
}
#pragma mark UIAlertViewDelegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    /* ok button */
    if (buttonIndex == 1) {
        UITextField * textField = [alertView textFieldAtIndex:0];
        if (textField.text != nil && ![textField.text isEqualToString:@""]) {
            [_client createBucket:textField.text];
        }
    
    }
}
- (void)viewDidAppear:(BOOL)animated
{
    self.navigationItem.title = @"Buckets";
    [super viewDidAppear:animated];
    _client.delegate = self;
}
#pragma mark UITableView 委托/代理方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //if results is not nil and we have results, return that number
	
	int rtn=0;
	
	rtn = [self.buckets count];
	
	
	return rtn;
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
    }
    Bucket *bucket = [self.buckets objectAtIndex:indexPath.row];

	NSString *strIndex =[NSString stringWithFormat:@"%@",bucket.name];
	cell.textLabel.text = strIndex;
 //   cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
	cell.imageView.image = [UIImage imageNamed:@"bucket.png"];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
    Bucket *bucket = [self.buckets objectAtIndex:indexPath.row];
    
	DetailsViewController * detailsVC = [[DetailsViewController alloc] initWithNibName:@"DetailsViewController" bundle:nil];
    detailsVC.client = _client;
    detailsVC.bucketName = bucket.name;
    detailsVC.prefix = @"";
    [self.navigationController pushViewController:detailsVC animated:YES];
    [detailsVC release];
	
}
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
        return UITableViewCellEditingStyleDelete;
   
}
- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
    //这里写你手指横向滑动需要处理的事件
    return nil;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        _indexPath = [indexPath retain];
        Bucket * bucket = [self.buckets objectAtIndex:indexPath.row];
        [_client deleteBucket:bucket.name];
        
       
        
    }
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    
}

#pragma mark OTS相关方法调用示例
-(void) createTable
{
    PrimaryKey * pk1 = [[PrimaryKey alloc] initWithName:@"id" Type:[OTSUtil PrimaryKeyTypeToString:PrimaryKeyType_INTEGER ]];
    PrimaryKey * pk2 = [[PrimaryKey alloc] initWithName:@"Name" Type:[OTSUtil PrimaryKeyTypeToString:PrimaryKeyType_STRING ]];
    NSMutableArray * pkArray = [[NSMutableArray alloc] initWithCapacity:2];
    [pkArray addObject:pk1];
    [pk1 release];
    [pkArray addObject:pk2];
    [pk2 release];
    
    PrimaryKey * pk3 = [[PrimaryKey alloc] initWithName:@"id" Type:[OTSUtil PrimaryKeyTypeToString:PrimaryKeyType_INTEGER ]];
    PrimaryKey * pk4 = [[PrimaryKey alloc] initWithName:@"tel" Type:[OTSUtil PrimaryKeyTypeToString:PrimaryKeyType_STRING ]];
    NSMutableArray * pkArray2 = [[NSMutableArray alloc] initWithCapacity:2];
    [pkArray2 addObject:pk3];
    [pk3 release];
    [pkArray2 addObject:pk4];
    [pk4 release];
    AttributeColumn * ac1 = [[AttributeColumn alloc] initWithName:@"name21" Type:[OTSUtil ColumnTypeToString:ColumnType_DOUBLE]]; 
     AttributeColumn * ac2 = [[AttributeColumn alloc] initWithName:@"city22" Type:[OTSUtil ColumnTypeToString:ColumnType_STRING]]; 
    NSMutableArray * acArray = [[NSMutableArray alloc] initWithCapacity:2];
    [acArray addObject:ac1];
    [ac1 release];
    [acArray addObject:ac2];
    [ac2 release];
    ViewMeta * vm = [[ViewMeta alloc] initWithViewName:@"bc3" resultPrimaryKeys:pkArray2 resultAttributeColumns:acArray];
    [pkArray2 release];
    [acArray release];
    TableMeta * tableMeta = [[TableMeta alloc] initWithTableName:@"bc3" resultPrimaryKeys:pkArray];
    [tableMeta addView:vm];
    tableMeta.pagingKeyLen = 0;
     [pkArray release];
    [_otsClient createTable:tableMeta];
    
}
-(void) createTableGroup
{
    [_otsClient createTableGroup:@"bc3" partitionKeyType:PartitionKeyType_STRING];
}
-(void) listTableGroups
{
    [_otsClient listTableGroups];
}
-(void) deleteTableGroup
{
    [_otsClient deleteTableGroup:@"ffftr"];
}
-(void) listTables
{
    [_otsClient listTables];
}
-(void) fetchTableMeta
{
    [_otsClient featchTableMeta:@"b1"];
}
-(void) deleteTable
{
    [_otsClient deleteTable:@"bc2"];
}
-(void) startTransaction
{
    //必须在表组中的表才可以开始事务，没有指定分区的表不能进行事务操作
    PartitionKeyValue *pkv = [[PartitionKeyValue alloc] initWithType:PartitionKeyType_INTEGER value:@"9"];
    [_otsClient startTransaction:@"testq" partitionKeyValue:pkv];
    [pkv release];
}
-(void) commitTransaction:(NSString *)transaction
{
    /*
     AwAAAHRyYSAAAAADGwAAADExMjIzNTk2MTYtMTM0NjQ2NDgxMTg5ODA5NgAAAAAAAAAAAFPEmUA=
     */
    [_otsClient commitTransaction:transaction ];
}
-(void) abortTransaction
{
    /*
     AwAAAHRyYSAAAAADGwAAADExMjIzNTk2MTYtMTM0NjQ2NDgxMTg5ODA5NgAAAAAAAAAAAFPEmUA=
     */
    [_otsClient abortTransaction:@"AwAAAHRyYSAAAAADGwAAADExMjIzNTk2MTYtMTM0NjQ2NDgxMTg5ODA5NgAAAAAAAAAAAFPEmUA="];
}
-(void) getRow
{
    SingleRowQueryCriteria * rowQc = [[SingleRowQueryCriteria alloc] initWithTableName:@"b2"];
    PrimaryKeyValue *pkv = [[PrimaryKeyValue alloc] initWithType:PrimaryKeyType_INTEGER value:@"3"];
    [rowQc addPrimaryKey:@"id" value:pkv];
    [pkv release];
    [_otsClient fetchRow:rowQc transactionID:nil];
    [rowQc release];
}
-(void)getRowsByoffset
{
    PrimaryKeyValue *pkv = [[PrimaryKeyValue alloc] initWithType:PrimaryKeyType_INTEGER value:@"3"];
    OrderedDictionary *pagingKeys = [[OrderedDictionary alloc] initWithCapacity:2];
    [pagingKeys setObject:pkv forKey:@"id"];
    OffsetRowQueryCriteria * orqc = [[OffsetRowQueryCriteria alloc] initWithTableName:@"b2" offset:0 top:100 isReverse:NO pagingKeys:pagingKeys];
    
    [_otsClient fetchRowsByOffset:orqc transactionID:nil];
}
-(void)getRowsByRange
{
    PrimaryKeyValue * begin =[[PrimaryKeyValue alloc]initWithType:PrimaryKeyType_INTEGER value:@"0"];
     PrimaryKeyValue * end =[[PrimaryKeyValue alloc]initWithType:PrimaryKeyType_INTEGER value:@"10"];
    PrimaryKeyRange *rang = [[PrimaryKeyRange alloc] initWithKeyName:@"id" begin:begin end:end type:PrimaryKeyType_INTEGER];
    RangeRowQueryCriteria * rrqr = [[RangeRowQueryCriteria alloc] initWithTableName:@"b2"];
    rrqr.range = rang;
    [_otsClient fetchRowsByRange:rrqr transactionID:nil];
}
-(void) putData
{
    RowPutChange *rpc = [[RowPutChange alloc] init];
    rpc.checking = CheckingMode_NO;
    ColumnValue * cv = [[ColumnValue alloc] initWithType:ColumnType_DOUBLE value:@"10.5"];
    [rpc addAttributeColumn:@"type" value:cv];
    [cv release];
    PrimaryKeyValue *pkv = [[PrimaryKeyValue alloc] initWithType:PrimaryKeyType_INTEGER value:@"3"];
     [rpc  addPrimaryKey:@"id" value:pkv];
    [_otsClient putData:@"b2" rowPutChange:rpc transactionID:nil];
    [rpc release];
}
-(void) deleteData
{
    RowDeleteChange *rdc =[[RowDeleteChange alloc] init];
    [rdc  addColumn:@"type"];
    PrimaryKeyValue *pkv = [[PrimaryKeyValue alloc] initWithType:PrimaryKeyType_INTEGER value:@"3"];
    [rdc  addPrimaryKey:@"id" value:pkv];
    [_otsClient deleteData:@"b2" rowDeleteChange:rdc transactionID:nil];
    [rdc release];
}
-(void)batchModifyData:(NSString *)transaction
{
    RowPutChange *rpc = [[RowPutChange alloc] init];
    rpc.checking = CheckingMode_NO;
    ColumnValue * cv = [[ColumnValue alloc] initWithType:ColumnType_DOUBLE value:@"10.5"];
    [rpc addAttributeColumn:@"type" value:cv];
    [cv release];
    PrimaryKeyValue *pkv = [[PrimaryKeyValue alloc] initWithType:PrimaryKeyType_INTEGER value:@"9"];
    [rpc  addPrimaryKey:@"id" value:pkv];
    NSArray * array = [NSArray arrayWithObjects:rpc, nil];
    [rpc release];
    //BQAAAHRlc3RxIAAAAAMbAAAAMTI1NzEwMTYzMi0xMzQ2NDk2OTc4MjUzNjY3AAMAAAAAAAAAbwkYzg==
    //BQAAAHRlc3RxIAAAAAMbAAAAMTI1NzEwMTYzMi0xMzQ2NDk2OTc4MjUzNjY3AAMAAAAAAAAAbwkYzg==
    [_otsClient batchModifyData:@"testq" rowChanges:array transactionID:transaction];
}
-(void) OTSClientCreateTableGroupFailed:(OTSClient *)client error:(OTSError *)error
{
    
}
-(void) OTSClientCreateTableGroupFinished:(OTSClient *)client result:(CreateTableGroupResult *)result
{
    
}
-(void) OTSClientStartTransactionFinished:(OTSClient*)client result:(NSString*)result
{
    [self batchModifyData:result];
}
-(void) OTSClientStartTransactionFailed:(OTSClient*)client error:(OTSError*)error
{
    
}
-(void) OTSClientCommitTransactionFinished:(OTSClient*)client result:(NSString*)result
{
    
}
-(void) OTSClientCommitTransactionFailed:(OTSClient*)client error:(OTSError*)error
{
    
}
-(void) OTSClientBatchModifyDataFinished:(OTSClient*)client result:(NSString*)result
{
    [self commitTransaction:result];
}
-(void) OTSClientBatchModifyDataFailed:(OTSClient*)client error:(OTSError*)error
{
    
}

#pragma mark OSS相关方法调用示例
/*
 creatBucket
 */
-(void) creatBucket
{
    [_client createBucket:@"barrycc101"];

}
-(void) deleteBucket
{
    [_client deleteBucket:@"barrycc101"];
}
-(void)writeBucketAcl
{
    CannedAccessControlList * cAcl = [CannedAccessControlList cannedAclWithCannedAclType:CannedAclType_PublicReadWrite];
    [_client writeBucketAcl:@"barrycc101" cannedAccessControlList:cAcl];
}
-(void)readBucketAcl
{
    [_client readBucketAcl:@"barrycc101"];
}
-(void) listBucket
{
    [_client listBuckets];
}
-(void)isBucketExist
{
    [_client isBucketExist:@"barrycc101"];
}
-(void) listObjects
{
    ListObjectsRequest * lor = [[ListObjectsRequest alloc] initWithBucketName:@"barrycc101" prefix:nil marker:nil maxKeys:0 delimiter:nil];
      [_client listObjects:lor];
}
-(void) putObject
{
    NSData * data = [[NSString stringWithString:@"中国"]  dataUsingEncoding:NSUTF8StringEncoding];
    ObjectMetadata * objMetadata = [[ObjectMetadata alloc] init];
    [_client putObject:@"barrycc101" key:@"test222" data:data objectMetadata:objMetadata];
    [objMetadata release];
}
-(void) fetchObject
{
    [_client fetchObject:@"barrycc101" key:@"test222"];
}
-(void)fetchObjectMetadata
{
    [_client fetchObjectMetadata: @"barrycc101" key:@"test222"];
}
-(void) copyObject
{
    CopyObjectRequest *cor = [[CopyObjectRequest alloc] initWithSourceBucketName:@"barrycc101" sourceKey:@"test222" destinationBucketName:@"barrycug11" destinationKey:@"test222"];
    [_client copyObject:cor];
}
-(void) deleteObject
{
    [_client deleteObject:@"barrycc101" key:@"test222"];
}
-(void) deleteMultipleObjects
{
    [_client  deleteMultipleObjects:@"barrycc101" objectNames:[NSArray arrayWithObjects:@"a/",@"b/", nil] isQuiet:YES];
}
-(void)postObjectGroup
{
    //调用改方法前请使用fetchObject 方法获取object的etag
    NSString * etag =@"C13DCEABCB143ACD6C9298265D618A9F";
    NSString * etag2 =@"C13DCEABCB143ACD6C9298265D618A9F";
    ObjectGroupPartETag * epTag1 = [[ObjectGroupPartETag alloc] initWithPartNumber:1 partName:@"test222"eTag:etag];
    ObjectGroupPartETag * epTag2 = [[ObjectGroupPartETag alloc] initWithPartNumber:2 partName:@"test333"eTag:etag2];
    PostObjectGroupRequest * pogr = [[PostObjectGroupRequest alloc] initWithBucketName:@"barrycc101" objectGroupName:@"test444" objectGroupPartETags:[NSArray arrayWithObjects:epTag1,epTag2, nil]];
    [_client postObjectGroup:pogr];
}
-(void)fetchObjectGroupIndex
{
    [_client fetchObjectGroupIndex:@"barrycc101" key:@"test444"];
}
-(void)InitiateMultipartUpload
{
    InitiateMultipartUploadRequest * imur = [[InitiateMultipartUploadRequest alloc] initWithBuckName:@"barrycc101" key:@"mObj21" objectMetadata:nil];
    [_client initiateMultipartUpload:imur];
    [imur release];
}
-(void)AbortMultipartUpload
{
    //uploadid 为InitiateMultipartUpload 返回结果
    NSString * uploadid = @"0004C79E54E19021079B355DD09B54EF";
    AbortMultipartUploadRequest * amur = [[AbortMultipartUploadRequest alloc] initWithBuckName:@"barrycc101"  key:@"mObj21" uploadId:uploadid];

    [_client abortMultipartUpload:amur];
    [amur release];
}
-(void)UploadPart
{
     //uploadid 为InitiateMultipartUpload 返回结果
     NSString * uploadid = @"0004C79E54E19021079B355DD09B54EF";
    long len = 6*1024*1024; // 除去最后一个part的大小无限制外，其他part必须大于5m
     char * fileData = malloc(len);
    NSData * data1 =[NSData dataWithBytes:fileData length:len];
    UploadPartRequest *upr = [[UploadPartRequest alloc] initWithBucketName:@"barrycc101" key:@"mObj1" uploadId:uploadid partNumber:2 partSize:len md5Digest:[data1 md5] data:data1];
    free(fileData);

    [_client uploadPart:upr];
    [upr release];
}
-(void) ListParts
{
    //uploadid 为InitiateMultipartUpload 返回结果
    NSString * uploadid = @"0004C79E54E19021079B355DD09B54EF";
    ListPartsRequest * pr = [[ListPartsRequest alloc] initWithBuckName:@"barrycc101" key:@"mObj" uploadId:uploadid maxParts:2 partNumberMarker:1];
    [_client listParts:pr];
    [pr release];
}
-(void) ListMultipartUploads
{
    ListMultipartUploadsRequest * lmur =[[ListMultipartUploadsRequest alloc]initWithBucketName:@"barrycc101" delimiter:nil prefix:nil maxUploads:0 keyMarker:nil uploadIdMarker:nil ];
    [_client listMultipartUploads:lmur];
    [lmur release];
}
-(void) CompleteMultipartUpload
{
    //已经上传数据的etag
    NSString * etag =@"C13DCEABCB143ACD6C9298265D618A9F";
    NSString * etag2 =@"C13DCEABCB143ACD6C9298265D618A9F";

    //uploadid 为InitiateMultipartUpload 返回结果
    NSString * uploadid = @"0004C79E54E19021079B355DD09B54EF";
 PartETag * pe1 = [[PartETag alloc] initWithPartNumber:1 eTag:etag];
 PartETag * pe2 = [[PartETag alloc] initWithPartNumber:2 eTag:etag2];
 NSArray * array = [NSArray arrayWithObjects:pe1,pe2, nil];
 CompleteMultipartUploadRequest * cmur = [[CompleteMultipartUploadRequest alloc] initWithBuckName:@"barrycc101" key:@"mObj1" uploadId:uploadid partETags:array];
 [_client completeMultipartUpload:cmur];
    [pe1 release];
    [pe2 release];
    [cmur release];
 
}
-(void)bucketCreateFinish:(OSSClient*) client result:(Bucket*) bucket
{
   // NSLog(@"%@",bucket.name);
    [self.buckets addObject:bucket];
    [self.tableView reloadData];
    
}

-(void)bucketCreateFailed:(OSSClient*) client error:(OSSError*) error
{
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Error" message:error.errorMessage delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:nil];
    [alert show];
    [alert release];
    alert = nil;
}

-(void)bucketDeleteFinish:(OSSClient*) client result:(NSString*) bucketName
{
    if (_indexPath != nil) {
        [self.buckets removeObjectAtIndex:_indexPath.row];
        // Delete the row from the data source.
        [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:_indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [_indexPath release];
    }
    
    _indexPath = nil;
}

-(void)bucketDeleteFailed:(OSSClient*) client error:(OSSError*) error
{
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Error" message:error.errorMessage delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:nil];
    [alert show];
    [alert release];
    alert = nil;
}


-(void)bucketWriteBucketAclFinish:(OSSClient*) client result:(CannedAccessControlList*) result
{
    NSLog(@"%d",result.cannedAclType);
}


-(void)bucketWriteBucketAclFailed:(OSSClient*) client error:(OSSError*) error
{
     NSLog(@"%@",error.errorMessage);
}

-(void)bucketListFinish:(OSSClient*) client result:(NSArray*) bucketList
{
    [self dismissModalViewControllerAnimated:YES];
    [self.buckets addObjectsFromArray: bucketList];
    [self.tableView reloadData];
}

-(void)bucketListFailed:(OSSClient*) client error:(OSSError*) error
{
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"登陆失败，请检查用户名密码" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:nil];
    [alert show];
    [alert release];
    alert = nil;
    
}

-(void)bucketReadBucketAclFinish:(OSSClient*) client result:(CannedAccessControlList*) result{
    
}
-(void)bucketReadBucketAclFailed:(OSSClient*) client error:(OSSError*) error{
    
}
-(void)bucketIsBucketExistFinish:(OSSClient*) client result:(BOOL) isBucketExist{
    
}
-(void)bucketIsBucketExistFailed:(OSSClient*) client error:(OSSError*) error{
    
}
-(void)bucketListObjectsFinish:(OSSClient*) client result:(ObjectListing*) result
{
    
}
-(void)bucketListObjectsFailed:(OSSClient*) client error:(OSSError*) error{
    
}
-(void)OSSObjectPutObjectFinish:(OSSClient*) client result:(PutObjectResult*) result
{
    
}

/**
 PutObject 方法执行失败，返回OSSError对象
 @param client OSSClient 
 @param error OSSError
 */
-(void)OSSObjectPutObjectFailed:(OSSClient*) client error:(OSSError*) error
{
    
}

/**
 FetchObject 方法执行成功，返回OSSObject 对象 
 @param client OSSClient 
 @param result OSSObject
 */
-(void)OSSObjectFetchObjectFinish:(OSSClient*) client result:(OSSObject*) result
{
    
}

/**
 FetchObject 方法执行失败，返回OSSError 对象 
 @param client OSSClient 
 @param error OSSError
 */
-(void)OSSObjectFetchObjectFailed:(OSSClient*) client error:(OSSError*) error
{
    
}

/**
 FetchObjectAndWriteToFile 方法执行成功，返回OSSObject 对象 和isWritedToFile对象
 @param client OSSClient 
 @param result OSSObject
 @param isWritedToFile BOOL
 */
-(void)OSSObjectFetchObjectAndWriteToFileFinish:(OSSClient*) client result:(OSSObject*) result isWritedToFile:(BOOL)isWritedToFile 
{
    
}

/**
 FetchObjectAndWriteToFile 方法执行失败，返回OSSError 对象 
 @param client OSSClient 
 @param error OSSError
 */
-(void)OSSObjectFetchObjectAndWriteToFileFailed:(OSSClient*) client error:(OSSError*) error
{
    
}

/**
 FetchObjectMetadata 方法执行成功，返回ObjectMetadata 对象 
 @param client OSSClient 
 @param result ObjectMetadata
 */
-(void)OSSObjectFetchObjectMetadataFinish:(OSSClient*) client result:(ObjectMetadata*) result
{
    
}

/**
 FetchObjectMetadata 方法执行失败，返回OSSError 对象 
 @param client OSSClient 
 @param error OSSError
 */
-(void)OSSObjectFetchObjectMetadataFailed:(OSSClient*) client error:(OSSError*) error
{
    
}

/**
 CopyObject 方法执行成功，返回CopyObjectResult 对象 
 @param client OSSClient 
 @param result CopyObjectResult
 */
-(void)OSSObjectCopyObjectFinish:(OSSClient*) client result:(CopyObjectResult*) result
{
    
}

/**
 CopyObject 方法执行失败，返回OSSError 对象  
 @param client OSSClient 
 @param error OSSError
 */
-(void)OSSObjectCopyObjectFailed:(OSSClient*) client error:(OSSError*) error
{
    
}

/**
 DeleteObject 方法执行成功，返回删除的bucketName 和key
 @param client OSSClient 
 @param bucketName  NSString
 @param key  NSString
 */
-(void)OSSObjectDeleteObjectFinish:(OSSClient*) client bucketName:(NSString*) bucketName key:(NSString*)key
{
    
}

/**
 DeleteObject 方法执行失败，返回OSSError 对象  
 @param client OSSClient 
 @param error OSSError
 */
-(void)OSSObjectDeleteObjectFailed:(OSSClient*) client error:(OSSError*) error
{
    
}

/**
 DeleteMultipleObjects 方法执行成功，返回DeleteObjectsResult对象
 @param client OSSClient 
 @param result DeleteObjectsResult
 @param bucketName NSString
 */
-(void)OSSObjectDeleteMultipleObjectsFinish:(OSSClient*) client  bucketName:(NSString*) bucketName result:(DeleteObjectsResult*) result
{
    
}

/**
 DeleteMultipleObjects 方法执行失败，返回OSSError 对象  
 @param client OSSClient 
 @param error OSSError
 */
-(void)OSSObjectDeleteMultipleObjectsFailed:(OSSClient*) client error:(OSSError*) error
{
    
}
/**
 AbortMultipartUpload 方法执行成功，返回uploadId
 @param client OSSClient 
 @param uploadId NSString
 */
-(void) OSSMultipartAbortMultipartUploadFinished:(OSSClient*) client result:(NSString*) uploadId
{
    
}

/**
 AbortMultipartUpload 方法执行失败，返回OSSError 对象
 @param client OSSClient 
 @param error OSSError
 */
-(void) OSSMultipartAbortMultipartUploadFailed:(OSSClient*) client error:(OSSError *) error
{
    
}

/**
 CompleteMultipartUpload 方法执行成功，返回CompleteMultipartUploadResult 对象
 @param client OSSClient 
 @param result CompleteMultipartUploadResult
 */
-(void) OSSMultipartCompleteMultipartUploadFinished:(OSSClient*) client result:(CompleteMultipartUploadResult*) result
{
    
}

/**
 CompleteMultipartUpload 方法执行失败，返回OSSError 对象
 @param client OSSClient 
 @param error OSSError
 */
-(void) OSSMultipartCompleteMultipartUploadFailed:(OSSClient*) client  error:(OSSError *) error
{
    
}

/**
 InitiateMultipartUpload 方法执行成功，返回InitiateMultipartUploadResult 对象
 @param client OSSClient 
 @param result InitiateMultipartUploadResult
 */
-(void) OSSMultipartInitiateMultipartUploadFinished:(OSSClient*) client result:(InitiateMultipartUploadResult*) result
{
    
}

/**
 InitiateMultipartUpload 方法执行失败，返回OSSError 对象
 @param client OSSClient 
 @param error OSSError
 */
-(void) OSSMultipartInitiateMultipartUploadFailed:(OSSClient*) client  error:(OSSError *) error
{
    
}

/**
 ListMultipartUploads 方法执行成功，返回MultipartUploadListing 对象
 @param client OSSClient 
 @param result MultipartUploadListing
 */
-(void) OSSMultipartListMultipartUploadsFinished:(OSSClient*) client result:(MultipartUploadListing*) result
{
    
}

/**
 ListMultipartUploads 方法执行失败，返回OSSError 对象
 @param client OSSClient 
 @param error OSSError
 */
-(void) OSSMultipartListMultipartUploadsFailed:(OSSClient*) client  error:(OSSError *) error
{
    
}

/**
 ListParts 方法执行成功，返回PartListing 对象 
 @param client OSSClient 
 @param result PartListing
 */
-(void) OSSMultipartListPartsFinished:(OSSClient*) client result:(PartListing*) result
{
    
}

/**
 ListParts 方法执行失败，返回OSSError 对象
 @param client OSSClient 
 @param error OSSError
 */
-(void) OSSMultipartListPartsFailed:(OSSClient*) client  error:(OSSError *) error
{
    
}

/**
 UploadPart 方法执行成功，返回UploadPartResult 对象
 @param client OSSClient 
 @param result UploadPartResult
 */
-(void) OSSMultipartUploadPartFinished:(OSSClient*) client result:(UploadPartResult*) result
{
    
}

/**
 UploadPart 方法执行失败，返回OSSError 对象
 @param client OSSClient 
 @param error OSSError
 */
-(void) OSSMultipartUploadPartFailed:(OSSClient*) client  error:(OSSError *) error
{
    
}

/**
 GroupPostObject 方法执行成功，返回PostObjectGroupResult 对象
 @param client OSSClient 
 @param result PostObjectGroupResult 
 */
-(void) OSSObjectGroupPostObjectGroupFinish:(OSSClient*) client result:(PostObjectGroupResult *) result
{
    
}

/**
 GroupPostObject 方法执行失败，返回OSSError 对象
 @param client OSSClient 
 @param error OSSError
 */
-(void) OSSObjectGroupPostObjectGroupFailed:(OSSClient*) client error:(OSSError *) error
{
    
}

/**
 FetchObjectGroupIndex 方法执行成功，返回FetchObjectGroupIndex 对象
 @param client OSSClient 
 @param result FetchObjectGroupIndexResult 
 */
-(void) OSSObjectGroupFetchObjectGroupIndexFinish:(OSSClient*) client result:(FetchObjectGroupIndexResult *) result
{
    
}

/**
 FetchObjectGroupIndex 方法执行失败，返回OSSError 对象
 @param client OSSClient 
 @param error OSSError
 */
-(void) OSSObjectGroupFetchObjectGroupIndexFailed:(OSSClient*) client error:(OSSError *) error
{
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
