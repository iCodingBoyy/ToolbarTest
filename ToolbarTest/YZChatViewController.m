//
//  YZChatViewController.m
//  ToolbarTest
//
//  Created by 马远征 on 14-5-21.
//  Copyright (c) 2014年 马远征. All rights reserved.
//

#import "YZChatViewController.h"
#import "YZChatToolBarView.h"

@interface YZChatViewController () <UITableViewDataSource,UITableViewDelegate,YZChatToolBarDeleagte>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) YZChatToolBarView *toolBarView;
@end

@implementation YZChatViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)loadView
{
    [super loadView];
    
    UIView *contentView = [[UIView alloc]initWithFrame:[[UIScreen mainScreen]applicationFrame]];
    contentView.backgroundColor = [UIColor whiteColor];
    self.view = contentView;
}

- (UITableView*)tableView
{
    if (_tableView == nil)
    {
        CGFloat height = self.navigationController.navigationBar.translucent ? (KScreenHeight - 50) : (KScreenHeight - 114);
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, height) style:UITableViewStylePlain];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.backgroundColor = nil;
        _tableView.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"chat_bg_default.jpg"]];
        _tableView.allowsSelection = NO;
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.scrollsToTop = YES;
    }
    return _tableView;
}

- (YZChatToolBarView*)toolBarView
{
    if (_toolBarView == nil)
    {
        CGFloat originY = self.navigationController.navigationBar.translucent ? (KScreenHeight - 50) : (KScreenHeight - 114);
        CGRect frame = CGRectMake(0, originY, KScreenWidth, 266);
        _toolBarView = [[YZChatToolBarView alloc]initWithFrame:frame];
        _toolBarView.scrollView = _tableView;
        _toolBarView.delegate = self;
    }
    return _toolBarView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.toolBarView];
    
    // Do any additional setup after loading the view.
}

- (void)YZChatTextViewDidSend:(NSString *)text
{
    
}

- (void)YZChatToolBoxButtonClick:(NSUInteger)buttonIndex
{

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier ];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    // Configure the cell...
    cell.textLabel.text = [NSString stringWithFormat:@"indexPath %d",indexPath.row];
    return cell;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
