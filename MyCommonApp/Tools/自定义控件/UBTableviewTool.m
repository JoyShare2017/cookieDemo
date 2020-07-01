//
//  UBTableviewTool.m
//  KOFACS
//
//  Created by zhaoshuai on 16/9/2.
//  Copyright © 2016年  apple. All rights reserved.
//

#import "UBTableviewTool.h"

@implementation UBTableviewTool

-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    self=[super initWithFrame:frame style:style];
    if (self) {
        self.delegate=self;
        self.dataSource=self;
    }
     return  self;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if (!self.numberOfSection) {
        return 1;
    }
    return  self.numberOfSection(tableView);
    
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (self.numberOfRow) {
     return    self.numberOfRow(tableView,section);
    }else
        return 0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.heightForRow) {
        return self.heightForRow(tableView,indexPath);
    }else
        return 44;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.cellForRow) {
       return  self.cellForRow(tableView,indexPath);
    }else
        return nil;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{

    if (self.heightHeader) {
        return self.heightHeader(tableView,section);
    }else
        return 0.01;

}

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{

    if (self.viewHeader) {
        return self.viewHeader(tableView,section);
    }else
        return nil;

}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    if (self.heightFooter) {
        return self.heightFooter(tableView,section);
    }else
        return 0.01;
    
}

-(UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
    if (self.viewFooter) {
        return self.viewFooter(tableView,section);
    }else
        return nil;
    
}



-(void)tableView:(UITableView *)tableView willDisplayCell:(nonnull UITableViewCell *)cell forRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    
    if (self.isNeedScaleAnimation) {
        cell.layer.transform=CATransform3DMakeScale(0.9, 0.9, 1);
        [UIView animateWithDuration:0.5 animations:^{
            cell.layer.transform=CATransform3DMakeScale(1, 1, 1);
        }];
    }
    
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (self.selectRow) {
        self.selectRow(tableView,indexPath);
    }
}

-(UILabel *)emptyLable{
    if (!_emptyLable) {
        _emptyLable=[[UILabel alloc]initWithFrame:CGRectMake(0, self.frame.size.height/2-10, self.frame.size.width, 20)];
        _emptyLable.textColor=[UIColor grayColor];
        _emptyLable.font=[UIFont systemFontOfSize:14];
        [_emptyLable setTextAlignment:(NSTextAlignmentCenter)];
        [self addSubview:_emptyLable];
        _emptyLable.hidden=YES;
    }
    return _emptyLable;
    
}

-(void)setEmptyIssue:(NSInteger)emptyIssue{

    _emptyIssue=emptyIssue;
    if (_emptyIssue ==EMPTYTYPENORMAL) {
        _emptyLable.hidden=YES;
    }else if (_emptyIssue==EMPTYTYPENODATA){
        self.emptyLable.text =@"暂无数据";
        self.emptyLable.hidden=NO;
    }else
        _emptyLable.hidden=YES;

}

@end
