//
//  ViewController.m
//  MRButtonBorder
//
//  Created by Mayank Rikh on 20/01/17.
//  Copyright © 2017 Mayank Rikh. All rights reserved.
//

#import "ViewController.h"
#import "UIView+Border.h"

@interface ViewController (){
    
    __weak IBOutlet UIView *mainView;
    
    __weak IBOutlet UIButton *mainButton;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated{
    
    [super viewDidAppear:animated];
    
    [mainView createBorder];
    
    [mainButton createBorder];
}



- (IBAction)mainButtonAction:(UIButton *)sender {
    
    [mainButton startDrawingBorder];
    
    [mainView startDrawingBorder];
}

- (IBAction)clearButtonAction:(UIButton *)sender {

    [mainButton clearBorder];
    
    [mainView clearBorder];
}
@end
