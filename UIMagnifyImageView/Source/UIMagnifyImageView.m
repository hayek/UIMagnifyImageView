//
//  UIMagnifyImageView.m
//  UIMagnifyImageView
//
//  Created by amir hayek on 6/30/14.
//  Copyright (c) 2014 amir hayek. All rights reserved.
//

#import "UIMagnifyImageView.h"
#import "AsyncImageView.h"
#import "UIRoundRectViewWithShadow.h"

#define kTouchNotification @"TouchNotification"
#define kAnimationSpeed     0.2

#define kKeyTouch       @"TouchValue"
#define kKeyAnimated    @"AnimatedValue"
#define kKeyEnded       @"EndedValue"

@interface UIMagnifyImageView ()

@property (strong, nonatomic) AsyncImageView* imageView;
@property (strong, nonatomic) UIRoundRectViewWithShadow* roundRectView;

@property (weak, nonatomic) UITableView* parentTableView;

@end

@implementation UIMagnifyImageView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupView];
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setupView];
    }
    return self;
}

-(void)setupView
{
    self.backgroundColor = [UIColor clearColor];
    
    _imageView = [[AsyncImageView alloc] init];
    
    _imageView.frame = CGRectMake(0.5, 1, self.frame.size.width-1, self.frame.size.height-2);
    _imageView.layer.cornerRadius = self.frame.size.width/2;
    _imageView.layer.masksToBounds = YES;
    _imageView.showActivityIndicator = NO;
    _imageView.contentMode = UIViewContentModeScaleAspectFill;
    
    [self addSubview:_imageView];
    
    _wrapperView = self.superview;

    _roundRectView = [[UIRoundRectViewWithShadow alloc] init];
    
    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(touchNotification:)
     name:kTouchNotification
     object:nil];
    
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

-(void)didMoveToSuperview
{
    _wrapperView = self.superview;
    _roundRectView.frame = CGRectMake(0, 0, 300, 200);
    _roundRectView.center = _wrapperView.center;
}

- (void)drawRect:(CGRect)rect
{
    [StyleKitName drawMagnifyWithWidth:rect.size.width];
}

-(void)setImage:(UIImage *)image
{
    [_imageView setImage:image];
    [_roundRectView setImage:image];
}

-(void)setImageUrl:(NSURL *)imageUrl
{
    [_imageView setImageURL:imageUrl];
    [_roundRectView setImageUrl:imageUrl];
}

#pragma mark - touch handling

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];

    
    [self showBigImage];
    [self setRoundRectCenterFromTouch:touch];
    
    [self animateInFromPoint:[touch locationInView:_wrapperView]];

    if (_parentTableView == nil) {
        _parentTableView = (UITableView*)self.superview;
        while (_parentTableView != nil && [_parentTableView isKindOfClass:[UITableView class]] == NO ) {
            _parentTableView = (UITableView*)_parentTableView.superview;
        }
    }
    
    if (_parentTableView) {
        _parentTableView.scrollEnabled = NO;
    }
}

- (void)sendTouchNotification:(UITouch *)touch ended:(BOOL)ended animated:(BOOL)animated
{
    NSDictionary *dictionary = @{kKeyTouch: touch, kKeyEnded: [NSNumber numberWithBool:ended] ,kKeyAnimated: [NSNumber numberWithBool:animated]};
    [[NSNotificationCenter defaultCenter] postNotificationName:kTouchNotification object:dictionary];
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];

    [self sendTouchNotification:touch ended:NO animated:NO];
    
    [self setRoundRectCenterFromTouch:touch];

}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];

    if([self pointInside:[touch locationInView:self] withEvent:event] == NO){
        [self sendTouchNotification:touch ended:YES animated:YES];
    }else{
        [self animateOutToPoint:[touch locationInView:_wrapperView]];
    }
    
    if (_parentTableView) {
        _parentTableView.scrollEnabled = YES;
    }
}

- (void)touchNotification:(NSNotification *)notification
{
    NSDictionary *dictionary = [notification object];
    
    UITouch *touch = [dictionary valueForKey:kKeyTouch];
    BOOL animated = [[dictionary valueForKey:kKeyAnimated] boolValue];
    BOOL ended = [[dictionary valueForKey:kKeyEnded] boolValue];
    if(ended == YES || [self pointInside:[touch locationInView:self] withEvent:nil] == NO){
        if (animated) {
            [self animateOutToPoint:[touch locationInView:_wrapperView]];
        }else{
            [self hideBigImage];
        }
    }else{
        [self showBigImage];
        [self setRoundRectCenterFromTouch:touch];
    }
}

-(void)showBigImage
{
    if (_roundRectView.superview == nil) {
        [_wrapperView addSubview:_roundRectView];
    }
}

-(void)hideBigImage
{
    [_roundRectView removeFromSuperview];
}

- (void)setRoundRectCenterFromTouch:(UITouch *)touch
{
    int y = [touch locationInView:_wrapperView].y;
    if ( y <= _roundRectView.bounds.size.height) {
        y = y + _roundRectView.bounds.size.height/2;
    }else{
        y = y - _roundRectView.bounds.size.height/2;
    }
    _roundRectView.center = CGPointMake(_wrapperView.center.x,y);
}

- (void)animateInFromPoint:(CGPoint)touchPoint
{
    _roundRectView.alpha = 0.0;
    _roundRectView.transform =CGAffineTransformMakeScale(0.5,0.5);
    CGPoint center = _roundRectView.center;
    _roundRectView.center = touchPoint;
    
    [UIView animateWithDuration:kAnimationSpeed animations:^{
        _roundRectView.alpha = 1.0;
        _roundRectView.transform =CGAffineTransformMakeScale(1,1);
        _roundRectView.center = center;
        
    }];
}

- (void)animateOutToPoint:(CGPoint)touchPoint
{
    _roundRectView.alpha = 1.0;
    
    [UIView animateWithDuration:kAnimationSpeed animations:^{
        _roundRectView.alpha = 0.0;
        _roundRectView.transform =CGAffineTransformMakeScale(0.5,0.5);
        _roundRectView.center = touchPoint;
    } completion:^(BOOL finished) {
        _roundRectView.transform =CGAffineTransformMakeScale(1,1);
        _roundRectView.alpha = 1.0;
        [self hideBigImage];
    }];
}


@end
