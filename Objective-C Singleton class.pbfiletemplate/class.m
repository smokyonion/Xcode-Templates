//
//  «FILENAME»
//  «PROJECTNAME»
//
//  Created by «FULLUSERNAME» on «DATE».
//  Copyright «YEAR» «ORGANIZATIONNAME». All rights reserved.
//

#import "«FILEBASENAMEASIDENTIFIER».h"

static «FILEBASENAMEASIDENTIFIER» *singleton«FILEBASENAMEASIDENTIFIER» = nil;

@implementation «FILEBASENAMEASIDENTIFIER»

+ («FILEBASENAMEASIDENTIFIER» *)shared«FILEBASENAMEASIDENTIFIER» {
	@synchronized([self class]) {
		if (singleton«FILEBASENAMEASIDENTIFIER» == nil) {
#ifdef __OBJC_GC__
			// Singleton creation is easy in the GC case, just create it if it hasn't been created yet,
			// it won't get collected since globals are strongly referenced.
			[[self alloc] init]; // assignment not done here
#else
			// The call to +alloc. Instead of sending it to «FILEBASENAMEASIDENTIFIER»
			// directly, we instead send it to [self class]. Normally they will 
			// give the same result. We use this implementation because we want to
			// take the full advantage of Objective-C's polymorphism. By dynamically 
			// looking up the class object at runtime, this allows for the shared instance
			// to be an instance of a particular subclass.
			singleton«FILEBASENAMEASIDENTIFIER» = [[[self class] alloc] init];
#endif
		}
	}
	return singleton«FILEBASENAMEASIDENTIFIER»;
}

- (id)init
{
	if ([super init]) {
		// initialize stuff here
	}
	return self;
}

+ (id)hiddenAlloc
{
	// leak...
	return [super alloc];
}

#ifndef __OBJC_GC__

// Every method that causes the allocation of a new instance needs 
// to be overridden to prevent instantiation
// +alloc, +new, +allocWithZone

+ (id)alloc
{
	@synchronized([self class]) {
		if (singleton«FILEBASENAMEASIDENTIFIER» == nil) {
			singleton«FILEBASENAMEASIDENTIFIER» = [super alloc]; // assignment and return on first allocation
			return singleton«FILEBASENAMEASIDENTIFIER»;
		}
	}
	NSLog(@"%@: Attempted to allocate a second instance of a singleton. \
		  Use +shared«FILEBASENAMEASIDENTIFIER» instaed of +alloc", [[self class] className]);
	return nil;
}

+ (id)allocWithZone:(NSZone *)zone
{
    @synchronized([self class]) {
        if (singleton«FILEBASENAMEASIDENTIFIER» == nil) {
            singleton«FILEBASENAMEASIDENTIFIER» = [super allocWithZone:zone];
            return singleton«FILEBASENAMEASIDENTIFIER»;  // assignment and return on first allocation
        }
    }
	NSLog(@"%@: Attempted to allocate a second instance of a singleton. \
		  Use +shared«FILEBASENAMEASIDENTIFIER» instaed of +allocWithZone", [[self class] className]);
    return nil; // on subsequent allocation attempts return nil
}

+ (id)new
{
	NSLog(@"Use +shared«FILEBASENAMEASIDENTIFIER» instaed of +new");
	// This is bad, beacause you are asking a non existed object to call its method
	// count = 0
	//return [self shared«FILEBASENAMEASIDENTIFIER»];
	
	@synchronized([self class]) {
		if (singleton«FILEBASENAMEASIDENTIFIER» == nil) {
#ifdef __OBJC_GC__
			// Singleton creation is easy in the GC case, just create it if it hasn't been created yet,
			// it won't get collected since globals are strongly referenced.
			[[self alloc] init]; // assignment not done here
#else
			// The call to +alloc. Instead of sending it to «FILEBASENAMEASIDENTIFIER»
			// directly, we instead send it to [self class]. Normally they will 
			// give the same result. We use this implementation because we want to
			// take the full advantage of Objective-C's polymorphism. By dynamically 
			// looking up the class object at runtime, this allows for the shared instance
			// to be an instance of a particular subclass.
			singleton«FILEBASENAMEASIDENTIFIER» = [[[self class] alloc] init];
#endif
		}
	}
	return singleton«FILEBASENAMEASIDENTIFIER»;
}

- (id)copyWithZone:(NSZone *)zone
{
	// -copy inherited from NSObject calls -copyWithZone:
	NSLog(@"%@: attempt to -copy may be a bug", [[self class] className]);
	//[self retain];
    return self;
}

- (id)mutableCopyWithZone:(NSZone *)zone
{
	// -mutableCopy inherited from NSObject calls -mutableCopyWithZone
	return [self copyWithZone:zone];
}

- (id)retain
{
    return self;
}

- (NSUInteger)retainCount
{
    return NSUIntegerMax;  //denotes an object that cannot be released
}

- (void)release
{
    //do nothing
}

- (id)autorelease
{
    return self;
}

- (void)dealloc
{
	//[_classVaraible release]; _classVaraible = nil;
	[super dealloc];
}

#endif

@end
