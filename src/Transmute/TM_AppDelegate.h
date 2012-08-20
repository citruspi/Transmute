//
//  TM_AppDelegate.h
//  Transmute
//
//  Created by Mihir Singh on 8/18/12.
//  Copyright (c) 2012 The Royal Panda Company. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface TM_AppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;

@property (nonatomic, retain) IBOutlet NSView *warning;
@property (nonatomic, retain) IBOutlet NSView *convert;

@property (nonatomic, retain) IBOutlet NSPopover *info;
@property (nonatomic, retain) IBOutlet NSButton *infoButton;

- (IBAction)hideWarning:(id)sender;
- (IBAction)downloadCLI:(id)sender;

@end
