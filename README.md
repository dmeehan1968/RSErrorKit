RSErrorKit
==========

RSErrorKit is a framework to help manage NSError objects.  Its designed to simplify creation of NSError objects, and provide a mechanism for handling errors via blocks throughout your code.

NSError is much overlooked by developers, who often check only for success/failure of a call and either ignore the error value or just supply `nil` so that the error is lost.

RSErrorKit is designed to encourage you to 'do the right thing' and handle errors, creating new error values at each class level and pass the errors back to an appropriate point where the application can report them to the user.

## Every Object Should Be An Error Reporter

RSErrorKit starts by adding a category to NSObject to provide basic error reporting functionality.  The class method `errorDomain` provides a unique domain identifier based on the containing class.  This saves you from scattering `const` strings around your modules.  Every object becomes a viable NSError domain.

You may choose to override this in classes to return either a class cluster name, or a library name if you do not desire class level domain indentifiers

## Convenience Error Creation

The category adds `-errorWithCode:underlyingError:errorHandler:` to all NSObject based classes as a convenience constructor for NSError objects.  Although this method returns an instance of NSError, the framework handles errors through the errorHandler block.  The block acts as a convenient way of passing error objects back up the stack, and as a hook to allow underlying errors to be encapsulated within an appropriate error for the higher domain.

An important principle here is that instead of passing an `NSError **` into your methods, you pass a block of type `RSErrorHandler` (`void(^)(NSError *)`) which carries the error object.

```
-(void)someMethod {

	[self anotherMethodWithError:^(NSError *error) {
	
		NSLog("%@", error);

	}];

}

-(void)anotherMethodWithError:(RSErrorHandler)errorHandler {

	[self elsewhereMethodWithError:errorHandler];
	
}

-(void)elsewhereMethodWithError:(RSErrorHandler)errorHandler {

	NSError *underlyingError;
	
	if ([anotherObject doSomething:YES error:&underlyingError]) {

		if (errorHandler) {
		
			[self errorWithCode:1 underlyingError:underlyingError errorHandler:errorHandler];
			
		}

	}

}
```

In `elsewhereMethodWithError:`, we capture an error from a typical system API.  We use the convenience method `errorWithCode:underlyingError:errorHandler` to wrap the underlying error in a new error specific to this domain.  The convenience method also takes can of calling back up the stack to the original error handler.

If so desired, in `anotherMethodWithError:` we could have supplied our own handler and passed on the original handler, allowing us to wrap the error at another level, providing more context to the error and a more relevant error description to the user, thus:

```
-(void)anotherMethodWithError:(RSErrorHandler)errorHandler {

	[self elsewhereMethodWithError:^(NSError *error) {
	
		[self errorWithCode:2 underlyingError:error errorHandler:errorHandler];

	}];
	
}
```


## RSErrorBuilder

This is a class that is, in effect, a mutable NSError (although does not inherit from NSError).  Instead of trying to load all values into the `userInfo` dictionary and then create the error in a single call, RSErrorBuilder is designed to allow you to create a builder with the essential information for good error reporting, then build upon that by setting other values as appropriate.

