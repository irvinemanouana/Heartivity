//
//  MenuTableViewController.m
//  Heartivity
//
//  Created by Manouana on 03/02/2016.
//  Copyright © 2016 Manouana. All rights reserved.
//

#import "MenuTableViewController.h"
#import "TableViewCell.h"

@interface MenuTableViewController ()
{
    NSMutableArray* menu;
    NSMutableArray* imageArray;
}
@end

@implementation MenuTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    menu = [NSMutableArray arrayWithObjects:
            @"Profil",
            @"Suivi",
            @"Calendrier",
            @"Défis",
            @"Communauté",
            nil];
    
    imageArray = [NSMutableArray arrayWithObjects:
                  [UIImage imageNamed:@"icone_homme.png"],
                  [UIImage imageNamed:@"icone_suivi.png"],
                  [UIImage imageNamed:@"icone_calendar.png"],
                  [UIImage imageNamed:@"icone_défi.png"],
                  [UIImage imageNamed:@"icone_communaute.png"],
                  nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    TableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"menuCell" forIndexPath:indexPath];
    
    if (cell == nil) {
        
        cell = [[TableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"menuCell"];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }
    //cell.imageCell.image = [imageArray objectAtIndex:indexPath.row];
    //cell.titleCell.text= [menu objectAtIndex:indexPath.row];
    
    return cell;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
