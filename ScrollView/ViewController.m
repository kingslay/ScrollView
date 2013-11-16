//
//  ViewController.m
//  ScrollView
//
//  Created by kingslay on 11/14/13.
//  Copyright (c) 2013 王 金辨. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    UITableView *tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320, 1000)];
    tableview.delegate = self;
    tableview.backgroundColor = [UIColor orangeColor];
    UITextField  *titleField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, tableview.rowHeight)];
    titleField.delegate = self;
    titleField.placeholder = NSLocalizedString(@"Add a new item", @"Placeholder text for adding a new item");
    tableview.tableHeaderView = titleField;
    
    
    [self.view addSubview:tableview];
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, -460, 320, 460)];
    [tableview addSubview:view];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 430, 320, 30)];
    label.text = @"Hello World!";
    [view addSubview:label];
    UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(0, 530, 320, 30)];
    label2.text = @"Hello World! 2";
    [view addSubview:label2];
    NSLog(@"tableview.contentSize= {%f,%f}",tableview.contentSize.width,tableview.contentSize.height);
    
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSLog(@"scrollViewDidScroll");
    NSLog(@"contentOffset.y=%f",scrollView.contentOffset.y);
    if (scrollView.contentOffset.y<=-35) {
        scrollView.contentInset = (UIEdgeInsets){
            .top=30,
            .left=0,
            .bottom=0,
            .right=0
        };
    }
}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSLog(@"scrollViewDidEndDecelerating");
    NSLog(@"scrollView.contentSize={%f,%f}",scrollView.contentSize.width,scrollView.contentSize.height);
    
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
