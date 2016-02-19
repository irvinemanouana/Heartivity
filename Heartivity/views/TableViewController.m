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
#import "Session.h"
#import "ViewController.h"
#import "EventTableViewController.h"
#import "CreateAlertViewController.h"
#import "AlertTableViewController.h"
@interface TableViewController ()
{
    NSMutableArray* menu;
    NSMutableArray* imageArray;
    NSMutableArray* subTitle;
}

@end

@implementation TableViewController
@synthesize tablemenu=_tablemenu;

- (void)viewDidLoad {
    [super viewDidLoad];
    UIBarButtonItem* barButton = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"MeasuringTape.png" ] landscapeImagePhone:nil style:UIBarButtonItemStylePlain  target:self action:@selector(logout:)];
    self.navigationItem.rightBarButtonItem = barButton;

    menu = [NSMutableArray arrayWithObjects:@"Profil",@"Suivi",@"Calendrier",@"Défis",@"Communauté",nil];
     subTitle = [NSMutableArray arrayWithObjects:@"Vos Informations",@"votre suivi",@"a voir",@"Workout",@"espace social",nil];
    imageArray = [NSMutableArray arrayWithObjects:[UIImage imageNamed:@"icone_homme.png"],[UIImage imageNamed:@"icone_suivi.png"],[UIImage imageNamed:@"icone_calendar.png"],[UIImage imageNamed:@"icone_défi.png"],[UIImage imageNamed:@"icone_communaute.png"], nil];
    
   
    // Do any additional setup after loading the view from its nib.
}
-(void)logout:(id)sender{
    Session* session = [Session new];
    [session destroySession];
    ViewController* view = [ViewController new];
    [self presentViewController:view animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    // The first method is used to inform the table view how many rows are in the section
    return [menu count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *simpleTableIdentifier = @"TableViewCell";
    
    
    TableViewCell *cell = (TableViewCell*)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:simpleTableIdentifier owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    
    cell.TitleCell.text = [menu objectAtIndex:indexPath.row];
    cell.SubTitleCell.text =[subTitle objectAtIndex:indexPath.row];
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
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    TableViewCell* cell = [tableView cellForRowAtIndexPath:indexPath];
    NSString* cellValue = cell.TitleCell.text;
    NSLog(@"%@",cellValue);
    if ([cellValue isEqualToString:@"Profil"]) {
        ProfileViewController* profil = [[ProfileViewController alloc]init];
        [self.navigationController pushViewController:profil animated:YES];
    }else if([cellValue isEqualToString:@"Suivi"]){
        FollowViewController* follow = [[FollowViewController alloc]init];
        [self.navigationController pushViewController:follow animated:YES];
    }else if([cellValue isEqualToString:@"Calendrier"] ){
        AlertTableViewController* follow = [[AlertTableViewController alloc]init];
        [self.navigationController pushViewController:follow animated:YES];
    }else if([cellValue isEqualToString:@"Défis"]){
        NSLog(@"%@",cellValue);
    }else if([cellValue isEqualToString:@"Communauté"]){
        EventTableViewController* even = [[EventTableViewController alloc]init];
        [self.navigationController pushViewController:even animated:YES];
    };

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
