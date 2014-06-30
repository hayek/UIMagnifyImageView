//
//  TableViewCell.h
//  UIMagnifyImageView
//
//  Created by amir hayek on 6/30/14.
//  Copyright (c) 2014 amir hayek. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIMagnifyImageView.h"

@interface TableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIMagnifyImageView *magnifyImageView;

@end
