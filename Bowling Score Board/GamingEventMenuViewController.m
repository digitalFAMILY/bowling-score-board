//
//  GamingEventMenuViewController.m
//  Bowling Score Board
//
//  Created by Laszlo Korte on 08.12.12.
//  Copyright (c) 2012 Digital Family. All rights reserved.
//

#import "GamingEventMenuViewController.h"

@interface GamingEventMenuViewController ()

-(NSDateFormatter*)dateFormatter;

@end

@implementation GamingEventMenuViewController

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

- (void)viewWillAppear:(BOOL)animated
{
    
    NSIndexPath* indexPath;
    NSString* segueIdentifier;
    
    switch (self.menuState) {
        case GamingEventMenuStateEventDetails:
            indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
            segueIdentifier = @"EventDetails";
            break;
            
        case GamingEventMenuStateFood:
            indexPath = [NSIndexPath indexPathForRow:1 inSection:1];
            segueIdentifier = @"Food";
            break;
            
        case GamingEventMenuStateBalance:
            indexPath = [NSIndexPath indexPathForRow:2 inSection:1];
            segueIdentifier = @"Balance";
            break;
            
        case GamingEventMenuStateScoring:
        default:
            indexPath = [NSIndexPath indexPathForRow:0 inSection:1];
            segueIdentifier = @"Scoring";
    }
    
    if(self.gamingEvent)
    {
        self.title = [self.dateFormatter stringFromDate:[self.gamingEvent valueForKey:@"timeStamp"]];
    }
    
    [self.tableView selectRowAtIndexPath:indexPath animated:NO scrollPosition:UITableViewScrollPositionTop];
    [self tableView:self.tableView didSelectRowAtIndexPath:indexPath];
    
    [self performSegueWithIdentifier:segueIdentifier sender:self];
}

#pragma mark - Table view data source



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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    UINavigationController* destination = segue.destinationViewController;
    
    if([[destination.viewControllers[0] class] conformsToProtocol:@protocol(GamingEventMenuItemViewController)])
    {
        id<GamingEventMenuItemViewController> menuItem = destination.viewControllers[0];
        menuItem.gamingEvent = self.gamingEvent;
    }
}

#pragma mark - Helper

-(NSDateFormatter*)dateFormatter
{
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"EEEE, dd.MM.YYYY HH:mm";
    
    return dateFormatter;
}

@end
