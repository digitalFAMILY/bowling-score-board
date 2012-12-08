//
//  GamingEventDetailViewController.m
//  Bowling Score Board
//
//  Created by Laszlo Korte on 08.12.12.
//  Copyright (c) 2012 Digital Family. All rights reserved.
//

#import "GamingEventDetailViewController.h"

@interface GamingEventDetailViewController ()


@property (nonatomic,strong) NSArray* players;

-(void)editButtonClicked:(id)sender;
-(void)addButtonClicked:(id)sender;
-(void)cancelButtonClicked:(id)sender;
-(NSDateFormatter*)dateFormatter;
@property (nonatomic) BOOL editMode;

@end

@implementation GamingEventDetailViewController

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

    
    self.players = @[@"Laszlo Korte",@"Markus Ullmann",@"Hajo Piepereit"];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(editButtonClicked:)];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(void)viewWillAppear:(BOOL)animated
{
    if(self.gamingEvent) {
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(editButtonClicked:)];
        self.navigationItem.leftBarButtonItem = nil;
    } else {
        self.title = @"Neuer Spieleabend";
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(addButtonClicked:)];
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancelButtonClicked:)];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    switch (section) {
        case 0: return 2;
        case 1: return self.players.count;
        default: return 0;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* cell;
    
    if(indexPath.section==0) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"listCell"forIndexPath:indexPath];
        
        switch (indexPath.row) {
            case 0:
                cell.textLabel.text = @"Datum";
                if(self.gamingEvent) {
                    cell.detailTextLabel.text = [self.dateFormatter stringFromDate:[self.gamingEvent valueForKey:@"timeStamp"]];
                } else {
                    cell.detailTextLabel.text = [self.dateFormatter stringFromDate:[NSDate date]];
                }
                break;
                
            case 1:
                cell.textLabel.text = @"Location";
                cell.detailTextLabel.text = @"UCI Bowling";
                cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
                break;
        }
    } else if(indexPath.section==1) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"playerCell"forIndexPath:indexPath];
        
        cell.textLabel.text = self.players[indexPath.row];
        cell.detailTextLabel.text = @"";
    }
    
    return cell;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    switch (section) {
        case 0: return @"Allgemein";
        case 1: return @"Spieler";
    }
    
    return @"";
}

-(void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section) {
        case 0:
            switch (indexPath.row) {
                case 1:
                    [self performSegueWithIdentifier:@"locationModal" sender:self];
                    break;
            }
            break;
    }
}

-(BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(self.editMode) {
        switch (indexPath.section) {
            case 0:
                break;
        }
    }
    
    
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

#pragma mark - Button Events

-(void)editButtonClicked:(UIBarButtonItem*)button
{
    self.editMode = YES;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(editDoneButtonClicked:)];
}

-(void)editDoneButtonClicked:(UIBarButtonItem*)button
{
    self.editMode = FALSE;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(editButtonClicked:)];
}

-(void)addButtonClicked:(id)sender
{
    [self.delegate addGamingEvent];
}

-(void)cancelButtonClicked:(id)sender
{
    [self performSegueWithIdentifier:@"homeSegue" sender:self];
}

#pragma mark - Helper

-(NSDateFormatter*)dateFormatter
{
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"EEEE, dd.MM.YYYY HH:mm";
    
    return dateFormatter;
}

@end
