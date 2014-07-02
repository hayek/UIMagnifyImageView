//
//  UIRoundRectViewWithShadow.m
//  UIMagnifyImageView
//
//  Created by amir hayek on 6/30/14.
//  Copyright (c) 2014 amir hayek. All rights reserved.
//

#import "UIRoundRectViewWithShadow.h"
#import "StyleKitName.h"
#import "AsyncImageView.h"

@interface UIRoundRectViewWithShadow ()

@property (strong, nonatomic) AsyncImageView* imageView;

@end

@implementation UIRoundRectViewWithShadow

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _imageView = [[AsyncImageView alloc] init];
    }
    return self;
}

-(void)didMoveToSuperview
{
    [self setupView];
}

-(void)setupView
{
    self.backgroundColor = [UIColor clearColor];
    
    
    _imageView.frame = CGRectMake(10, 10, self.frame.size.width-20, self.frame.size.height-25);
    _imageView.layer.cornerRadius = 5;
    _imageView.layer.masksToBounds = YES;
    _imageView.showActivityIndicator = NO;
    _imageView.contentMode = UIViewContentModeScaleAspectFit;
    
    [self addSubview:_imageView];
}

-(void)setImage:(UIImage *)image
{
    [_imageView setImage:image];
}

-(void)setImageUrl:(NSURL *)imageUrl
{
    [_imageView setImageURL:imageUrl];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    [StyleKitName drawRoundRectViewWithShadowWithFrame:rect];
}


@end
