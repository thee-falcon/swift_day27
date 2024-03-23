# UIKit

![Swift Logo](https://cdn-icons-png.flaticon.com/256/919/919833.png)

# Capture lists come before a closure’s parameter list in your code, and capture values from the environment as either strong, weak, or unowned. We use them a lot, mainly to avoid strong reference cycles – aka retain cycles.

## Deciding which to use isn’t easy when you’re learning, so you can spend time trying to figure out strong vs weak, or weak vs unowned, but as you progress with your learning you’ll start to realize there’s often only one right choice.

### How ARC Works?

Every time you create a new instance of a class, ARC allocates a chunk of memory to store information about that instance. This memory holds information about the type of the instance, together with the values of any stored properties associated with that instance.
Additionally, when an instance is no longer needed, ARC frees up the memory used by that instance so that the memory can be used for other purposes instead. This ensures that class instances don’t take up space in memory when they’re no longer needed.
However, if ARC were to deallocate an instance that was still in use, it would no longer be possible to access that instance’s properties, or call that instance’s methods. Indeed, if you tried to access the instance, your app would most likely crash.
To make sure that instances don’t disappear while they’re still needed, ARC tracks how many properties, constants, and variables are currently referring to each class instance. ARC will not deallocate an instance as long as at least one active reference to that instance still exists.
To make this possible, whenever you assign a class instance to a property, constant, or variable, that property, constant, or variable makes a strong reference to the instance. The reference is called a “strong” reference because it keeps a firm hold on that instance, and doesn’t allow it to be deallocated for as long as that strong reference remains

![Page 1](day27.png)
