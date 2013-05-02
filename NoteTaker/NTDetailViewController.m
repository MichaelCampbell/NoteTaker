//
//  NTDetailViewController.m
//  NoteTaker
//
//  Created by Michael Campbell on 5/2/13.
//  Copyright (c) 2013 Michael Campbell. All rights reserved.
//

#import "NTDetailViewController.h"

@interface NTDetailViewController ()

@end

@implementation NTDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.box.text = self.noteText;
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)save:(id)sender
{
    [self.delegate saveNote:self.box.text for:self.noteId];
    [self.navigationController popViewControllerAnimated:YES];
}

@end
