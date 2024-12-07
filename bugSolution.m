To fix this, we must either use a weak reference or ensure the object is explicitly released when it is no longer needed within the lifecycle of 'MyClass'.  The weak reference approach is better to avoid accidental premature releases.

```objectivec
@interface MyClass : NSObject
@property (weak, nonatomic) MyOtherClass *myObject; // Changed to weak
@end

@implementation MyClass
- (void)someMethod {
    self.myObject = [[MyOtherClass alloc] init];
    // ... some code ...
}
@end
```

By changing the property to 'weak', the object is only referenced weakly, meaning that the 'MyClass' object doesn't increase the object's retain count. Thus when 'MyClass' deallocates, there is no longer a strong reference to 'myObject' and it will then be deallocated as well.  This resolves the memory leak.