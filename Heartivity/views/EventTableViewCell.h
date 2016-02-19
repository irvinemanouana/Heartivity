//
//  EventTableViewCell.h
//  Heartivity
//
//  Created by Manouana on 14/02/2016.
//  Copyright © 2016 Manouana. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EventTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *TitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *DateLabel;
@property (weak, nonatomic) IBOutlet UILabel *DescriptionLabel;

@end
