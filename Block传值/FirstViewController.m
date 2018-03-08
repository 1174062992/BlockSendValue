//
//  FirstViewController.m
//  代理
//
//  Created by xunli on 2018/3/8.
//  Copyright © 2018年 caoji. All rights reserved.
//

#import "FirstViewController.h"
#import "Masonry.h"
#import "SecondViewController.h"
@interface FirstViewController ()
/**
 *接收传值
 */
@property(nonatomic,strong)UILabel* CJLabel;
/**
 *点击进入下一个界面
 */
@property(nonatomic,strong)UIButton* CJbutton;
@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor =[UIColor lightGrayColor];
    self.navigationController.navigationBar.translucent = NO;
    //初始化
    [self InitializeTheView];
    
}
-(void)InitializeTheView{
    // 导航栏
    UIImageView *bgImgView = [[UIImageView alloc]init];
    bgImgView.image = [UIImage imageNamed:@"nav_bg"];
    bgImgView.userInteractionEnabled = YES;
    [self.view addSubview:bgImgView];
    [bgImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.view.mas_width);
        make.height.mas_equalTo(64);
        make.left.equalTo(self.view.mas_left);
        make.top.equalTo(self.view.mas_top);
    }];
    //标题
    UILabel* titlelabel =[[UILabel alloc]init];
    [bgImgView addSubview:titlelabel];
    [titlelabel mas_makeConstraints:^(MASConstraintMaker *make) {
       make.edges.equalTo(bgImgView).with.insets(UIEdgeInsetsMake(30, 10, 10, 10));
    }];
    titlelabel.textColor =[UIColor redColor];
    titlelabel.text =@"第一个界面";
    titlelabel.textAlignment =NSTextAlignmentCenter;
    titlelabel.font =[UIFont systemFontOfSize:18];
    //
    self.CJLabel =[[UILabel alloc]init];
    [self.view addSubview:self.CJLabel];
    self.CJLabel.backgroundColor =[UIColor orangeColor];
    self.CJLabel.textColor =[UIColor whiteColor];
    self.CJLabel.textAlignment =NSTextAlignmentCenter;
    self.CJLabel.font =[UIFont systemFontOfSize:14];
    //
    self.CJbutton =[[UIButton alloc]init];
    [self.view addSubview:_CJbutton];
    [self.CJbutton setTitle:@"下一步" forState:0];
    self.CJbutton.backgroundColor =[UIColor orangeColor];
    [self.CJbutton addTarget:self action:@selector(Nextpage) forControlEvents:UIControlEventTouchUpInside];
    [self.CJLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left).offset(30);
        make.top.mas_equalTo(self.view.mas_top).offset(150);
        make.right.mas_equalTo(self.view.mas_right).offset(-30);
        make.height.mas_equalTo(40);
    }];
    [self.CJbutton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.CJLabel.mas_bottom).offset(30);
        make.left.mas_equalTo(self.view.mas_left).offset(30);
        make.height.mas_equalTo(self.CJLabel.mas_height);
        make.width.mas_equalTo(self.CJLabel.mas_width);
    }];
}

/**
 *下一步
 */
-(void)Nextpage{
    SecondViewController* vc =[[SecondViewController alloc]init];
    ///UINavigationController* nav =[[UINavigationController alloc]initWithRootViewController:vc];
    vc.block = ^(NSString *nameStr) {
        self.CJLabel.text =nameStr;
    };
    [self presentViewController:vc animated:YES completion:^{
        
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
