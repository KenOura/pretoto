//
//  ExpectHoldViewController.m
//  PreToto
//
//  Created by Ken Oura on 2013/09/29.
//  Copyright (c) 2013年 Ken Oura. All rights reserved.
//

#import "ExpectHoldViewController.h"
#import "ExpectViewController.h"

@interface ExpectHoldViewController ()

@end

@implementation ExpectHoldViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.tableView.rowHeight = 60.0;    //テーブル一行一行の幅の高さ

    Type = [[NSDictionary alloc] initWithObjectsAndKeys:
            @"toto", @"1",
            @"mini toto A", @"2",
            @"mini toto B", @"3",
            @"toto GOAL", @"4",
            nil];

    NSDictionary *Hold1 =  [[NSDictionary alloc] initWithObjectsAndKeys:
                            @"99", @"id",
                            @"2013-10-10 00:00:00", @"open_date",
                            @"2013-10-20 12:50:00", @"close_date",
                            nil];
    NSDictionary *Hold2 =  [[NSDictionary alloc] initWithObjectsAndKeys:
                            @"100", @"id",
                            @"2013-10-17 00:00:00", @"open_date",
                            @"2013-10-27 12:50:00", @"close_date",
                            nil];
    HoldList = [[NSArray alloc] initWithObjects:Hold1, Hold2, nil];

    NSArray *TotoColumns = [[NSArray alloc] initWithObjects:@"id", @"type", @"result_datetime", nil];

    NSArray *TotoVal = [[NSArray alloc] initWithObjects:@"1", @"1", @"2013-10-21", nil];
    NSDictionary *Toto = [[NSDictionary alloc] initWithObjects:TotoVal forKeys:TotoColumns];

    NSArray *MiniTotoAVal = [[NSArray alloc] initWithObjects:@"2", @"2", @"2013-10-20", nil];
    NSDictionary *MiniTotoA = [[NSDictionary alloc] initWithObjects:MiniTotoAVal forKeys:TotoColumns];

    NSArray *MiniTotoBVal = [[NSArray alloc] initWithObjects:@"3", @"3", @"2013-10-20", nil];
    NSDictionary *MiniTotoB = [[NSDictionary alloc] initWithObjects:MiniTotoBVal forKeys:TotoColumns];
    
    NSArray *TotoGoalVal = [[NSArray alloc] initWithObjects:@"4", @"4", @"2013-10-20", nil];
    NSDictionary *TotoGoal = [[NSDictionary alloc] initWithObjects:TotoGoalVal forKeys:TotoColumns];

    NSArray *Toto1 = [[NSArray alloc] initWithObjects:Toto, MiniTotoA, MiniTotoB, TotoGoal, nil];
    NSArray *Toto2 = [[NSArray alloc] initWithObjects:MiniTotoA, MiniTotoB, TotoGoal, nil];
    TotoList = [[NSArray alloc] initWithObjects:Toto1, Toto2, nil];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return HoldList.count;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    static NSString *format = @"第%@回 %@〜%@";
    NSDictionary *hold = [HoldList objectAtIndex:section];
    return [NSString stringWithFormat:format, [hold objectForKey:@"id"], [hold objectForKey:@"open_date"], [hold objectForKey:@"close_date"]];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    NSArray *toto = [TotoList objectAtIndex:section];
    return toto.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    NSArray *totos = [TotoList objectAtIndex:indexPath.section];
    NSDictionary *toto_info = [totos objectAtIndex:indexPath.row];
    
    cell.textLabel.text = [Type objectForKey:[toto_info objectForKey:@"type"]];
    cell.detailTextLabel.text = [toto_info objectForKey:@"result_datetime"];

    return cell;
}

- (UITableViewCellAccessoryType)tableView:(UITableView *)tableView accessoryTypeForRowWithIndexPath:(NSIndexPath *)indexPath{
    return UITableViewCellAccessoryDisclosureIndicator;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ExpectViewController *evc = [[ExpectViewController alloc] initWithNibName:@"ExpectViewController" bundle:nil];
    evc.hidesBottomBarWhenPushed = YES;
 
    [self.navigationController pushViewController:evc animated:YES];
}

@end
