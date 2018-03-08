//
//  SecondViewController.m
//  代理
//
//  Created by xunli on 2018/3/8.
//  Copyright © 2018年 caoji. All rights reserved.
//

#import "SecondViewController.h"
#import "Masonry.h"
@interface SecondViewController ()<UITextFieldDelegate>
/**
 *输入框
 */
@property(nonatomic,strong)UITextField* CJtextField;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor =[UIColor lightGrayColor];
    self.navigationController.navigationBar.translucent = NO;
    //初始化
    [self InitializeTheView];
}
/*

 */
-(void)InitializeTheView{
    // 导航栏
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
    titlelabel.text =@"第二个界面";
    titlelabel.textAlignment =NSTextAlignmentCenter;
    titlelabel.font =[UIFont systemFontOfSize:18];
    // 返回按钮
    UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(10, 20, 44, 44)];
    bgView.userInteractionEnabled = YES;
    bgView.backgroundColor = [UIColor clearColor];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(backClick)];
    [bgView addGestureRecognizer:tap];
    
    tap.numberOfTapsRequired = 1;
    
    
    [bgImgView addSubview:bgView];
    
    UIImageView* backImage =[[UIImageView alloc]initWithFrame:CGRectMake(4, 13, 30, 18)];
    
    backImage.image =[UIImage imageNamed:@"nav_right"];
    backImage.contentMode =  UIViewContentModeScaleAspectFit;
    backImage.userInteractionEnabled =YES;
    [bgView addSubview:backImage];
    UITapGestureRecognizer* tapm =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(backClick)];
    [backImage addGestureRecognizer:tapm];
    //输入框
    self.CJtextField =[[UITextField alloc]init];
    [self.view addSubview:self.CJtextField];
    [self.CJtextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).with.insets(UIEdgeInsetsMake(150, 30, 530, 30));
    }];
    self.CJtextField.backgroundColor =[UIColor orangeColor];
    self.CJtextField.textAlignment =NSTextAlignmentCenter;
    self.CJtextField.returnKeyType =UIReturnKeyDone;
    self.CJtextField.delegate =self;
}
/**
 *返回处理把代理数据传回去
 */
-(void)sendDelegateData{
    self.block(self.CJtextField.text);
}
#pragma mark - textFieldDelegate
// 点击空白处 取消键盘
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self.CJtextField resignFirstResponder];
    return YES;
}
- (void)backClick{
    //返回处理
    [self sendDelegateData];
    [self dismissViewControllerAnimated:YES completion:^{
        
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
