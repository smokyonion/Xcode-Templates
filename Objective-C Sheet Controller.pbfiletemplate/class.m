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
//	«FILEBASENAMEASIDENTIFIER» *mySheetController_;
//}
//@end


// *.m
// implement this method in the class file which you call this sheet controller

//- («FILEBASENAMEASIDENTIFIER» *)mySheetController
//{
//	if (mySheetController_) return mySheetController_;
//	@synchronized(self)
//	{
//		if (!mySheetController_)
//			mySheetController_ = [[«FILEBASENAMEASIDENTIFIER» alloc] init«FILEBASENAMEASIDENTIFIER»WithParentWindow:window];
//	}
//	return mySheetController_;
//}

@implementation «FILEBASENAMEASIDENTIFIER»

- («FILEBASENAMEASIDENTIFIER» *)initWithWindowNibName:(NSString*)nibName
{
	[super initWithWindowNibName:nibName];
	[self window]; // force loading of the actual nib (strange that the default initWithWindowNibName) doesn't do this.
	return self;
}

// it's important to turn off visible at launch attribute of the sheet window
- («FILEBASENAMEASIDENTIFIER» *)init«FILEBASENAMEASIDENTIFIER»WithParentWindow:(NSWindow *)parent
{
	parentWindow_ = parent;
	// replace SheetNibName to your own Nib
	[NSBundle loadNibNamed:@"SheetNibName" owner:self];
	[self window]; // force loading of the actual nib (strange that the default initWithWindowNibName) doesn't do this.
	return self;
}

- (void)open«FILEBASENAMEASIDENTIFIER»
{
	[NSApp beginSheet:[self window] modalForWindow:parentWindow_ modalDelegate:nil didEndSelector:nil contextInfo:nil];
}

- (IBAction)close«FILEBASENAMEASIDENTIFIER»:(id)sender
{
	[NSApp endSheet:[self window]];
	[[self window] orderOut:sender];
}

- (IBAction)cancel:(id)sender
{
	if ([self respondsToSelector:@selector(sheetButtonCancel:)])
		[self performSelector:@selector(sheetButtonCancel:) withObject:self];
}

- (void)dealloc
{
	//[_classVaraible release]; _classVaraible = nil;
	[super dealloc];
}

@end
