//
//  TableViewCell.m
//  Heartivity
//
//  Created by Manouana on 02/02/2016.
//  Copyright © 2016 Manouana. All rights reserved.
//

#import "TableViewCell.h"

@implementation TableViewCell
@synthesize ImageCell= _imageView;
@synthesize TitleCell=_TitleCell;
@synthesize SubTitleCell=_SubTitleCell;

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
