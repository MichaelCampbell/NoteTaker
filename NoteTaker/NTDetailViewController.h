//
//  NTDetailViewController.h
//  NoteTaker
//
//  Created by Michael Campbell on 5/2/13.
//  Copyright (c) 2013 Michael Campbell. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NTNotesViewController.h"

@interface NTDetailViewController : UIViewController

@property (weak, nonatomic) NSString *noteText;
@property (assign, nonatomic) int noteId;
@property (weak, nonatomic) NTNotesViewController *delegate;

@property (weak, nonatomic) IBOutlet UITextView *box;
- (IBAction)save:(id)sender;

@end
