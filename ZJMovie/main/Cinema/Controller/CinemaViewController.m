//
//  CinemaViewController.m
//  ZJMovie
//
//  Created by zhoujie on 15/7/17.
//  Copyright (c) 2015年 zhoujie. All rights reserved.
//

#import "CinemaViewController.h"
#import "Basedefine.h"
#import "DataService.h"
#import "DistModal.h"
#import "cinemaModal.h"
#import "cinemaCell.h"

static NSString *cinemasCellId = @"cinemasCellId";

@interface CinemaViewController ()

@end

@implementation CinemaViewController



- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 44)];
        
        titleLabel.text = @"影院";
        titleLabel.font = [UIFont boldSystemFontOfSize:24];
        //titleLabel.font = [UIFont systemFontOfSize:24];
        //titleLabel.font = [UIFont fontWithName:@"Helevetica-Bold" size:24];  不成功
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.textColor = [UIColor whiteColor];
        titleLabel.backgroundColor = [UIColor clearColor];
        
        self.navigationItem.titleView =titleLabel;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self _loadData];
    [self _createCinemasList];
    
    

    
    // Do any additional setup after loading the view.
}


#pragma mark - CreateSubViews
-(void)_createCinemasList
{
    
    for (int i = 0 ; i<200; i++) {
        flags[i]=YES;
    }
    _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _tableView.backgroundView =[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"bg_main.png"]];
    
    _tableView.dataSource = self;
    _tableView.delegate =self;
    [self.view addSubview:_tableView];

    
    UINib *nib = [UINib nibWithNibName:@"cinemaCell" bundle:nil];
    [_tableView registerNib:nib forCellReuseIdentifier:cinemasCellId];
    
}
#pragma mark - LoadData
-(void)_loadData
{
    _distModalArray = [[NSMutableArray alloc]init];
    
    _cinemaModalArray = [[NSMutableArray alloc]init];
    
    NSDictionary *jsonArray = [DataService loadData:districtListFile];
    NSDictionary *jsonArray1 = [DataService loadData:cinemaListFile];
    
    NSArray *districtList = [jsonArray objectForKey:@"districtList"];
    NSArray *cinemaList = [jsonArray1 objectForKey:@"cinemaList"];
    
    
    
    for ( NSDictionary *dic1100  in districtList) {
        
        
        NSMutableDictionary *dic=[[NSMutableDictionary alloc]initWithDictionary:dic1100];
        

        
        [_distModalArray addObject:dic];
        
        
    }

    
    for (NSDictionary *dic in districtList) {
        

        NSMutableArray *arrayM = [[NSMutableArray alloc]init];
        DistModal *modal = [[DistModal alloc]init];
        
        
       
        modal.name = [dic objectForKey:@"name"];
        
        modal.distName = [dic objectForKey:@"id"];
        
        
        
        
        
        for (NSDictionary *dic1 in cinemaList) {
            cinemaModal *modal1 = [[cinemaModal alloc]init];
            [modal1 setValuesForKeysWithDictionary:dic1];
            //modal1.districtId = [dic objectForKey:@"id"];
          
            
            if ([modal1.districtId isEqualToString:modal.distName]) {
                [arrayM addObject:modal1];
            }
            
        }
        [_cinemaModalArray addObject:arrayM];
    
                
    }
    
    
    
}



#pragma mark - DataSoure
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
        
        return [_distModalArray count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    if(flags[section]==NO)
    {
        return 0;
    }
    return [_cinemaModalArray[section] count];
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    cinemaCell *cell = [tableView dequeueReusableCellWithIdentifier:cinemasCellId];
    
    NSArray *arrayX = _cinemaModalArray[indexPath.section];
    
    
    cell.modal = arrayX[indexPath.row];
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 44;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90;
}

//自定义头部
- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    

    UIButton *button = [[UIButton alloc]init];
    
    NSDictionary *dic = _distModalArray[section];
    NSString *str =[dic objectForKey:@"name"];
    
    button.tag = section;
    
    
//    NSString *districtName = [dic objectForKey:@"name"];
    button.titleLabel.textAlignment = NSTextAlignmentLeft;
    [button setTitle:str   forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [button addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    return button;
}

- (void)btnAction:(UIButton *)button{
    
    NSInteger index = button.tag;
    flags[index] = ! flags[index];
    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:index];
    [_tableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationFade];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    ViewController1 *vc = [[ViewController1 alloc]init];
//    [self.navigationController pushViewController:vc animated:YES];
}




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
