//
//  AlertTableViewController.m
//  Heartivity
//
//  Created by Manouana on 19/02/2016.
//  Copyright © 2016 Manouana. All rights reserved.
//

#import "AlertTableViewController.h"
#import "AlertTableViewCell.h"
#import "CreateAlertViewController.h"

@interface AlertTableViewController ()
{
    NSArray *tableData;
    NSArray* notifications;
}
@end

@implementation AlertTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    notifications = [[UIApplication sharedApplication] scheduledLocalNotifications];
    UIBarButtonItem* barButton = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"Plus-48.png" ] landscapeImagePhone:nil style:UIBarButtonItemStylePlain  target:self action:@selector(createAlert:)];
    self.navigationItem.rightBarButtonItem = barButton;
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)createAlert:(id)sender{
    CreateAlertViewController* alert = [[CreateAlertViewController alloc]init];
    [self.navigationController pushViewController:alert animated:YES];

}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows

    return [notifications count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AlertTableViewCell *cell =(AlertTableViewCell*) [tableView dequeueReusableCellWithIdentifier:@"AlertTableViewCell"];
    
    
    // Configure the cell...
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"AlertTableViewCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
   
    UILocalNotification* localnot = [notifications objectAtIndex:indexPath.row];
    NSDateFormatter* dateFormat = [[NSDateFormatter alloc]init];
    //For Fr format
    [dateFormat setDateFormat:@"dd-MM-yyyy HH:mm:ss"];
   
    cell.Titletext.text= localnot.alertBody;
    cell.Datetext.text = [dateFormat stringFromDate:localnot.fireDate];
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here, for example:
    // Create the next view controller.
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:<#@"Nib name"#> bundle:nil];
    
    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
