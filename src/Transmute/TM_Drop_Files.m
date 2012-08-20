//
//  HZYDragHandle.m
//  Hazy
//
//  Created by Mihir Singh on 4/8/12.
//  Copyright (c) 2012 MaxxySpockDev. All rights reserved.
//

#import "TM_Drop_Files.h"
#import <CoreServices/CoreServices.h>

@implementation TM_Drop_Files

NSString *type; //Type of file to convert

NSString *engine; //Location of the "conversion engine" to be used

NSString *fileName; //File Name (e.g. "Harry Potter.epub")

BOOL *highlight, *mountainLion;

NSThread *convert; //Use thread to stop app from freezing while converting

NSArray *allowed; //File types which the "engine" can convert

NSFileManager *fileManager;

NSString *message;

NSArray *draggedFiles;

- (id)initWithFrame:(NSRect)frame{    
    self = [super initWithFrame:frame];
    if (self) {
        [self registerForDraggedTypes:[NSArray arrayWithObject:NSFilenamesPboardType]];
    }
    return self;
}

- (void)awakeFromNib{
    [self checkOperatingSystem]; //Check the operating system
}

- (NSDragOperation)draggingEntered:(id <NSDraggingInfo>)sender{    
    highlight=YES;
    [self setNeedsDisplay: YES];
    return NSDragOperationGeneric;
}

- (void)draggingExited:(id <NSDraggingInfo>)sender{
    highlight=NO;    
    [self setNeedsDisplay: YES];
}

- (BOOL)prepareForDragOperation:(id <NSDraggingInfo>)sender {
    highlight=NO;
    [self setNeedsDisplay: YES];    
    return YES;
}

- (BOOL)performDragOperation:(id < NSDraggingInfo >)sender {

    draggedFiles = [[sender draggingPasteboard] propertyListForType:NSFilenamesPboardType];
    
    type = [NSString stringWithFormat:@"%@",[[draggedFiles objectAtIndex:0] pathExtension]];
    
    if ([allowed indexOfObject:type] != NSNotFound){
        return YES;
    }
    
    else{
        
        //Wrong file type error message
        
        if([self isMountainLion]){
            message = [NSString stringWithFormat:@"That wasn't a valid file!"];
            
            NSUserNotification *notification = [[NSUserNotification alloc] init];
            [notification setTitle:@"Silly Goose!"];
            [notification setInformativeText:message];
            [notification setDeliveryDate:[NSDate dateWithTimeInterval:0 sinceDate:[NSDate date]]];
            [notification setSoundName:NSUserNotificationDefaultSoundName];
            NSUserNotificationCenter *center = [NSUserNotificationCenter defaultUserNotificationCenter];
            [center scheduleNotification:notification];
        }
        
        return NO;
    }
}

- (void)runConversion:(id)sender{                
    fileName = [[sender lastPathComponent] stringByDeletingPathExtension]; //Extract file name from full path
        
    if([self isMountainLion]){ //If the OS is Mountain Lion, notify the user that the conversion is starting
        
        message = [NSString stringWithFormat:@"%@ is being converted to a .mobi file.", [fileName stringByReplacingOccurrencesOfString:type withString:@""]];
        
        NSUserNotification *notification = [[NSUserNotification alloc] init];
        [notification setTitle:@"Conversion Started"];
        [notification setInformativeText:message];
        [notification setDeliveryDate:[NSDate dateWithTimeInterval:0 sinceDate:[NSDate date]]];
        [notification setSoundName:NSUserNotificationDefaultSoundName];
        NSUserNotificationCenter *center = [NSUserNotificationCenter defaultUserNotificationCenter];
        [center scheduleNotification:notification];
    }

    NSTask *task = [[NSTask alloc] init];
    [task setLaunchPath:engine];

    NSPipe *pipe = [NSPipe pipe];
    [task setStandardOutput:pipe];
    NSFileHandle *file = [pipe fileHandleForReading];
    
    if([engine isEqualToString:@"/Applications/kindlegen"]){
        [task setArguments:[NSArray arrayWithObjects:sender, nil]];
    }
    
    else{
        [task setArguments:[NSArray arrayWithObjects:sender, [sender stringByReplacingOccurrencesOfString:type withString:@"mobi"], nil]];
    }
    
    [task launch];
    
    NSData *data = [file readDataToEndOfFile];
    NSString *string = [[NSString alloc] initWithData: data encoding: NSUTF8StringEncoding];
            
    NSError *error;
    
    BOOL written = [string writeToFile:[sender stringByReplacingOccurrencesOfString:type withString:@"log"] atomically:YES encoding:NSUnicodeStringEncoding error:&error];
    
    if(!written){
        //NSLog(error);
    }
    
    if([self isMountainLion]){        
            message = [NSString stringWithFormat:@"%@ has been converted to a .mobi file.", [fileName stringByReplacingOccurrencesOfString:type withString:@""]];
        
            NSUserNotification *notification = [[NSUserNotification alloc] init];
            [notification setTitle:@"Conversion Complete"];
            [notification setInformativeText:message];
            [notification setDeliveryDate:[NSDate dateWithTimeInterval:0 sinceDate:[NSDate date]]];
            [notification setSoundName:NSUserNotificationDefaultSoundName];
            NSUserNotificationCenter *center = [NSUserNotificationCenter defaultUserNotificationCenter];
            [center scheduleNotification:notification];
    }
        
    [convert cancel]; //Close Thread
}

- (void)checkOperatingSystem{
    NSMutableDictionary *systemInfo = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/System/Library/CoreServices/SystemVersion.plist"]; //Create a dictionary from the contents of the System Version property list
    NSString *version = [systemInfo objectForKey:@"ProductVersion"]; //Get the "Product Version" (e.g. 10.7, 10.7.1, etc.)
    
    version = ([NSString stringWithFormat:@"%.1f", [version doubleValue]]); //Round the version number to ONE decimal (e.g. 10.7 -> 10.7, 10.7.1 -> 10.7)
    
    if([version isEqualToString:@"10.8"]){ //If the rounded version is 10.8, its...
        mountainLion = YES; //A MOUNTAIN LION!!!
    }
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    //Check if the Calibre CLI is installed.
    if ([fileManager fileExistsAtPath:@"/usr/bin/ebook-convert"]){//If it is, use the CLI as the "conversion engine"
        allowed = [NSArray arrayWithObjects:@"azw4", @"chm", @"djvu", @"epub", @"fb2", @"htlz", @"html", @"lit", @"lrf", @"mobi", @"odt", @"pdb", @"pdf", @"pml", @"rb", @"rtf", @"snb", @"tcr", @"txt", @"txtz", @"azw3", nil]; //List of file types Calibre can convert
        engine = [NSString stringWithFormat:@"/usr/bin/ebook-convert"]; //Location of alias to CLI for Calibre
    }
    
    else{//If it isn't, use the bundled version of kindlegen
        allowed = [NSArray arrayWithObjects:@"epub", @"htm", @"html", @"mobi",nil]; //List of file types kindlegen can convert
        engine = [NSString stringWithFormat:@"/Applications/kindlegen"]; //Location of "kindlegen" executable inside app
    }
}

- (BOOL)isMountainLion{
    return *mountainLion; //Return TRUE or FALSE
}

- (void)concludeDragOperation:(id <NSDraggingInfo>)sender{

    draggedFiles = [[sender draggingPasteboard] propertyListForType:NSFilenamesPboardType];
    
    if ([allowed indexOfObject:type] != NSNotFound){
        //Convert each dropped file
        for(NSString *path in draggedFiles) {
            convert = [[NSThread alloc] initWithTarget:self selector:@selector(runConversion:) object:path];
            [convert start];
        }
    }
    
    else{
        //Wrong file type
    }    
}

@end
