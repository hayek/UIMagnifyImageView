//
//  ViewController.m
//  UIMagnifyImageView
//
//  Created by amir hayek on 6/30/14.
//  Copyright (c) 2014 amir hayek. All rights reserved.
//

#import "ViewController.h"
#import "UIMagnifyImageView.h"

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    for (UIView* view in self.view.subviews) {
        if ([view isKindOfClass:[UIMagnifyImageView class]]) {
            UIMagnifyImageView* magnifyImageView = (UIMagnifyImageView*)view;
            magnifyImageView.imageUrl = [NSURL URLWithString:[NSString stringWithFormat:@"https://robohash.org/%d",arc4random() % 100]];
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
