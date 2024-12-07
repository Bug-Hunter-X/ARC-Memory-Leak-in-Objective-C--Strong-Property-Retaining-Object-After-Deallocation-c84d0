# Objective-C ARC Memory Leak

This repository demonstrates a common memory leak scenario in Objective-C when using Automatic Reference Counting (ARC).  The example shows how a strong property within a class can retain an object even after the class instance is deallocated if proper memory management is not implemented, leading to memory leaks. The solution shows how to properly manage the memory to prevent this issue.

## Bug Description

The provided `bug.m` file contains a class `MyClass` with a strong property `myObject`. When an instance of `MyClass` is created and `myObject` is assigned a new object, a memory leak occurs if `myObject` is not released or if a weak property is not utilized, because `myObject` will not be deallocated when `MyClass` is destroyed.  This creates a memory leak. 

## Solution

The `bugSolution.m` file demonstrates the solution. We introduce a `weak` property to ensure that when `MyClass` is deallocated, `myObject` is not retained, preventing the memory leak.  This is the most appropriate solution in this case, because it prevents accidental deallocation of `myObject` while `MyClass` is still using it.