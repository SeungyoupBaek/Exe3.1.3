//
//  ViewController.m
//  Exe3.1.3
//
//  Created by SDT-1 on 2014. 1. 6..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIAlertViewDelegate>

@end

@implementation ViewController


// AlertView 의 Delegate
-(void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (1 == alertView.tag) {
        if (alertView.cancelButtonIndex == buttonIndex) {
            NSLog(@"취소");
        }
    } else if(alertView.firstOtherButtonIndex == buttonIndex){
        NSLog(@"@선택1");
    } else if((alertView.firstOtherButtonIndex+1) == buttonIndex){
        NSLog(@"선택2");
    }
    
    
    if (2 == alertView.tag) {
        if (alertView.firstOtherButtonIndex == buttonIndex) {
            UITextField *idField = [alertView textFieldAtIndex:0];
            UITextField *pwField = [alertView textFieldAtIndex:1];
            NSLog(@"id : %@ - pw : %@", idField.text, pwField.text);
        }
        else{
            NSLog(@"로그인 취소");
        }
        
    }
    else{
        //기타처리
    }
}

//id/pw 4자이상 입력시에만 확인버튼 활성화
-(BOOL)alertViewShouldEnableFirstOtherButton:(UIAlertView *)alertView{
    if (2 == alertView.tag) {
        UITextField *idField = [alertView textFieldAtIndex:0];
        UITextField *pwField = [alertView textFieldAtIndex:1];
        return ([idField.text length] > 3 && [pwField.text length] > 3);
    }
    return YES;
}


//id/pw 입력을 위한 AlertView
-(IBAction)showAlertWithInput:(id)sender{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"로그인" message:@"id/pw를 입력하세요" delegate:self cancelButtonTitle:@"취소" otherButtonTitles:@"확인", nil];
    alert.alertViewStyle = UIAlertViewStyleLoginAndPasswordInput;
    alert.tag = 2;
    [alert show];
}


// 기본적인 AlertView
-(IBAction)showBasicAlert:(id)sender{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"제목" message:@"메시지" delegate:self cancelButtonTitle:@"취소" otherButtonTitles:@"선택1", @"선택2", nil];
    alert.tag = 1;
    [alert show];
}




- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
