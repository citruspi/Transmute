//
//  TM_AppDelegate.m
//  Transmute
//
//  Created by Mihir Singh on 8/18/12.
//  Copyright (c) 2012 The Royal Panda Company. All rights reserved.
//

#import "TM_AppDelegate.h"

@implementation TM_AppDelegate

@synthesize warning, convert; //The two NSViews

@synthesize info, infoButton; //The NSPopover and the NSButton

NSFileManager *fileManager;
- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    fileManager = [[NSFileManager alloc] init];
    [NSFileManager defaultManager];
    //By default, both the warning and the main view are hidden. Then, we show the one we need
    
    if (![fileManager fileExistsAtPath:@"/usr/bin/ebook-convert"]){ //Check if Calibre CLI is installed
        [warning setHidden:NO]; //Show the warning view
    }
    
    else{        
        [convert setHidden:NO]; //Show the main view
    }
}

//When the user skips the CLI, hide and show the appropriate views
- (IBAction)hideWarning:(id)sender{
    
    //Check if we have already placed Kindlegen in the Applications directory
    if (![fileManager fileExistsAtPath:@"/Applications/kindlegen"]){
        NSTask *task = [[NSTask alloc] init];
        [task setLaunchPath:@"/bin/cp"]; //Location of "cp"
        
        [task setArguments:[NSArray arrayWithObjects: [[NSBundle mainBundle] pathForResource:@"kindlegen" ofType:@""], @"/Applications/", nil]]; //Set arguments to: a) Location of kindlegen within Application bundle b) Applications directory
        [task launch]; //If we haven't, use an NSTask to put it there
    }
    
    [warning setHidden:YES]; //Hides the warning view
    [convert setHidden:NO]; //Shows the main view
}

//When the user chooses to install the CLI
- (IBAction)downloadCLI:(id)sender{
    [[NSWorkspace sharedWorkspace] openURL:[NSURL URLWithString:@"http://therealmihir.github.com/Transmute/"]]; //Opens the instructional URL
    [NSApp terminate:self]; //Quits the app - after the CLI is installed, the user will re-open the app and will not see the warning view
}

//Handles the NSPopover
- (IBAction)toggleInfo:(id)sender
{
    if (self.buttonIsPressed) {
        [self.info showRelativeToRect:[infoButton bounds]
                                  ofView:infoButton
                           preferredEdge:NSMaxYEdge];
    } else {
        [self.info close];
    }
}

- (BOOL)buttonIsPressed
{
    return self.infoButton.intValue == 1;
}

@end
