//
//  UBTableviewTool.h
//  KOFACS
//
//  Created by zhaoshuai on 16/9/2.
//  Copyright © 2016年  apple. All rights reserved.
//
/*!
 @class         UBTableviewTool
 @author        赵帅
 @version
 @discussion	uitableview工具类
 */
#import <UIKit/UIKit.h>
enum emptyType{
    
    EMPTYTYPENORMAL=0,
    EMPTYTYPENODATA
    
    
};
typedef NSInteger (^numberOfRowsInSection)(UITableView*tv,NSInteger section);
typedef CGFloat (^heightForRow)(UITableView*tv,NSIndexPath*index);
typedef UITableViewCell* (^cellForRow)(UITableView*tv,NSIndexPath*indexPath);
typedef void (^selectRow)(UITableView*tv ,NSIndexPath*index);
typedef CGFloat (^HeightOfHeader)(UITableView*tv,NSInteger section);
typedef UIView* (^ViewOfHeader)(UITableView*tv,NSInteger section);
typedef CGFloat (^HeightOfFooter)(UITableView*tv,NSInteger section);
typedef UIView* (^ViewOfFooter)(UITableView*tv,NSInteger section);
typedef NSInteger (^numberOfSections)(UITableView*tv);


@interface UBTableviewTool : UITableView<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)numberOfRowsInSection numberOfRow;
@property(nonatomic,strong)heightForRow heightForRow;
@property(nonatomic,strong)cellForRow cellForRow;
@property(nonatomic,strong)selectRow selectRow;

@property(nonatomic,strong)HeightOfHeader heightHeader;
@property(nonatomic,strong)ViewOfHeader  viewHeader;
@property(nonatomic,strong)HeightOfFooter heightFooter;
@property(nonatomic,strong)ViewOfFooter  viewFooter;
@property(nonatomic,strong)numberOfSections numberOfSection;
@property(nonatomic,strong)UILabel*emptyLable;
@property(nonatomic)NSInteger emptyIssue;
@property(nonatomic)BOOL isNeedScaleAnimation;//是否需要放大动画

@end
