//
//  ExpectViewController.m
//  PreToto
//
//  Created by Ken Oura on 2013/11/06.
//  Copyright (c) 2013年 Ken Oura. All rights reserved.
//

#import "ExpectViewController.h"
#import "ExpextTable.h"

@interface ExpectViewController ()

@end

@implementation ExpectViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    ExpextTable *et = [[ExpextTable alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:et];}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
