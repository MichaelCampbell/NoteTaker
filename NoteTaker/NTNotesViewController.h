//
//  NTNotesViewController.h
//  NoteTaker
//
//  Created by Michael Campbell on 5/2/13.
//  Copyright (c) 2013 Michael Campbell. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NTNotesViewController : UITableViewController

- (void)saveNote:(NSString *)text
             for:(int)noteId;

- (IBAction)add:(id)sender;

@end
