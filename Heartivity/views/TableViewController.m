//
//  TableViewController.m
//  Heartivity
//
//  Created by Manouana on 24/11/2015.
//  Copyright © 2015 Manouana. All rights reserved.
//

#import "TableViewController.h"
#import "CreateAccountViewController.h"
#import "TableViewCell.h"

#import "ProfileViewController.h"
#import "FollowViewController.h"
#import "CalendarViewController.h"

@interface TableViewController ()
{
    NSMutableArray* menu;
    NSMutableArray* imageArray;
}

@end

@implementation TableViewController
@synthesize tablemenu=_tablemenu;

- (void)viewDidLoad {
    [super viewDidLoad];
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
    
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Retour" style:UIBarButtonItemStylePlain target:nil action:nil];
   
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    // The first method is used to inform the table view how many rows are in the section
    return 5;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *simpleTableIdentifier = @"TableViewCell";
    
    
    TableViewCell *cell = (TableViewCell*)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:simpleTableIdentifier owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    
    cell.TitleCell.text = [menu objectAtIndex:indexPath.row];
    cell.SubTitleCell.text =[menu objectAtIndex:indexPath.row];
    cell.ImageCell.image =[imageArray objectAtIndex:indexPath.row];
    return cell;

}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    long selectedRow = (long)indexPath.item;
    switch (selectedRow) {
        case 0:
        {
            NSLog(@"Go to profile");
            ProfileViewController* profilePage = [ProfileViewController new];
            [self presentViewController:profilePage animated:YES completion:nil];
            break;
        }
            
        case 1:
        {
            NSLog(@"Go to suivi");
            FollowViewController* followPage = [FollowViewController new];
            [self presentViewController:followPage animated:YES completion:nil];
            break;
        }
        case 2:
        {
            NSLog(@"Go to calendrier");
            CalendarViewController* calendarPage = [CalendarViewController new];
            [self presentViewController:calendarPage animated:YES completion:nil];
        }
//            case 3:
            
        default:
            break;
    }
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
