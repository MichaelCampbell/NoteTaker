//
//  NTNotesViewController.m
//  NoteTaker
//
//  Created by Michael Campbell on 5/2/13.
//  Copyright (c) 2013 Michael Campbell. All rights reserved.
//

#import "NTNotesViewController.h"
#import "NTDetailViewController.h"

@interface NTNotesViewController ()

@property(nonatomic, strong) NSMutableArray *data;

@end

@implementation NTNotesViewController

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        //self.data = @[@"Here is my first note", @"Here is my second note", @"Here is my third note", @"Here is my fourth note"];
//        self.data = [[NSMutableArray alloc] init];
//        [self.data addObject:@"Here is my first note"];
//        [self.data addObject:@"Here is my second note"];
//        [self.data addObject:@"Here is my third note"];
//        [self.data addObject:@"Here is my fourth note"];
        self.data = [[NSUserDefaults standardUserDefaults] objectForKey:@"Data"];
    }
    return self;
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue
                  sender:(id)sender
{
    NTDetailViewController* detailView = segue.destinationViewController;
    detailView.delegate = self;
    
    if (self.tableView.indexPathForSelectedRow) {
        detailView.noteText = self.data[self.tableView.indexPathForSelectedRow.row];
        detailView.noteId = self.tableView.indexPathForSelectedRow.row;
    }
    else
    {
        detailView.noteText = nil;
        detailView.noteId = self.data.count;
    }

}

- (void)saveNote:(NSString *)text for:(int)noteId
{
    self.data[noteId] = text;
    [self.tableView reloadData];
    
    [[NSUserDefaults standardUserDefaults] setObject:self.data forKey:@"Data"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (IBAction)add:(id)sender
{
    [self performSegueWithIdentifier:@"showDetail" sender:self];

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

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return self.data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text = self.data[indexPath.row];
    //cell.textLabel.text = [self.data objectAtIndex:indexPath.row];
    
    return cell;
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
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end
