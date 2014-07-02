//
//  UIMagnifyImageView.h
//  UIMagnifyImageView
//
//  Created by amir hayek on 6/30/14.
//  Copyright (c) 2014 amir hayek. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StyleKitName.h"

@interface UIMagnifyImageView : UIView

@property (retain, nonatomic) NSURL* imageUrl;
@property (retain, nonatomic) UIImage* image;

@property (weak, nonatomic) UIView* wrapperView;

@end
