//
//  «FILENAME»
//  «PROJECTNAME»
//
//  Created by «FULLUSERNAME» on «DATE».
//  Copyright «YEAR» «ORGANIZATIONNAME». All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface «FILEBASENAMEASIDENTIFIER» : NSWindowController {
	
	NSWindow *parentWindow_;
}

- («FILEBASENAMEASIDENTIFIER» *)init«FILEBASENAMEASIDENTIFIER»WithParentWindow:(NSWindow *)parent;
- (void)open«FILEBASENAMEASIDENTIFIER»;
- (IBAction)close«FILEBASENAMEASIDENTIFIER»:(id)sender;
- (IBAction)cancel:(id)sender;

@end
