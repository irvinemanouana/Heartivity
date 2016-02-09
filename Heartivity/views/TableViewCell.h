//
//  TableViewCell.h
//  Heartivity
//
//  Created by Manouana on 02/02/2016.
//  Copyright © 2016 Manouana. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *ImageCell;

@property (weak, nonatomic) IBOutlet UILabel *TitleCell;

@property (weak, nonatomic) IBOutlet UILabel *SubTitleCell;


@end
