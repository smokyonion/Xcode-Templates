//
//  «FILENAME»
//  «PROJECTNAME»
//
//  Created by «FULLUSERNAME» on «DATE».
//  Copyright «YEAR» «ORGANIZATIONNAME». All rights reserved.
//

#import "«FILEBASENAMEASIDENTIFIER».h"

// it's important to turn off visible at launch(IB) attribute of the sheet window

//*.h
// declare the sheet controller in the class file which you call this sheet controller
//@interface SomeClass : NSObject
//{
//	«FILEBASENAMEASIDENTIFIER» *myPanelController_;
//}
//@end


// *.m
// implement this method in the class file which you call this sheet controller

//- («FILEBASENAMEASIDENTIFIER» *)myPanelController
//{
//	if (myPanelController_) return myPanelController_;
//	@synchronized(self)
//	{
//		if (!myPanelController_)
//			myPanelController_ = [[«FILEBASENAMEASIDENTIFIER» alloc] initWithWindowNibName:@"NibName"];
//	}
//	return myPanelController_;
//}

// or use this as a parent class
//
//- (id)init
//{
//	return [super initWithWindowNibName:@"NibName"];
//}

@implementation «FILEBASENAMEASIDENTIFIER»

- («FILEBASENAMEASIDENTIFIER» *)init
{	
	return [self initWithWindowNibName:@"YourNibName"];
}

// it's important to turn off visible at launch attribute of the sheet window
- («FILEBASENAMEASIDENTIFIER» *)initWithWindowNibName:(NSString*)nibName
{
	[super initWithWindowNibName:nibName];
	[self window]; // force loading of the actual nib (strange that the default initWithWindowNibName) doesn't do this.
	return self;
}

//- (void)windowDidLoad
//{
//	[[self window] setMovableByWindowBackground:YES];
//	[super windowDidLoad];
//}

- (void)awakeFromNib
{	
	[[NSNotificationCenter defaultCenter] addObserver:self 
											 selector:@selector(applicationWillTerminate:) 
												 name:NSApplicationWillTerminateNotification 
											   object:nil];
	
	// Autosave Window Frame
	// or set up Window autosave in IB attributes inspector
	NSWindow *window = [self window];
	[[window windowController] setShouldCascadeWindows:NO];	// Tell the controller to not cascade its windows.
	//[window setFrameAutosaveName:[window representedFilename]]; // This is for NSDocument based Application
	[window setFrameAutosaveName:@"«FILEBASENAMEASIDENTIFIER»FrameAutosaveName"]; // Specify the autosave name for the window.
	
}

- (void)toggle«FILEBASENAMEASIDENTIFIER»:(id)sender
{
	NSWindow *window = [self window];
	if([window isVisible])
		[window orderOut:sender];
	else
		[window orderFront:sender];
}

- (IBAction)close«FILEBASENAMEASIDENTIFIER»:(id)sender
{
	[[self window] close];
}

- (void)applicationWillTerminate:(NSNotification *)notification
{
	[[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
