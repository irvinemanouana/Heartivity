//
//  EventTableViewCell.m
//  Heartivity
//
//  Created by Manouana on 14/02/2016.
//  Copyright © 2016 Manouana. All rights reserved.
//

#import "EventTableViewCell.h"

@implementation EventTableViewCell
@synthesize TitleLabel = _TitleLabel;
@synthesize DateLabel= _DateLabel;
@synthesize DescriptionLabel = _DescriptionLabel;

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
