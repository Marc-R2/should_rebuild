Decide when your Widget should be rebuilt.

## Features

You can let a widget decide for itself whether it needs to be rebuilt or not if keys, constants and optimizations don't do the job. In for example very dynamic environments like for loops, Flutter still has problems and sometimes rebuilds widgets unnecessarily. This can quickly affect performance and is especially annoying with more complex widgets. This can be counteracted with this.

## Getting started

TODO: List prerequisites and provide or point to information on how to
start using the package.

## Usage

Simply implement your stateful or stateless widget in your application with
```dart
class YourWidget extends StatelessWidget implements ShouldRebuild<YourWidget> {}
```

```dart
class YourWidget extends StatefulWidget implements ShouldRebuild<YourWidget> {}
```
and override the 
```dart
bool shouldRebuild(T oldWidget, T newWidget) => true; // true => rebuild / false => don't rebuild
```

method with your logic. \
Based on this logic the widget decides on each build if the child widget should be rebuilt or not. \
Now this widget can be used in a ShouldRebuildWidget.

```dart
ShouldRebuildWidget(
  key: ValueKey<String>('your key'), // This should be unique in the widget tree and always the same for the same child.
  child: YourWidget(),
),
```

)

## Additional information

As mentioned above, there are other ways to convince a widget to not rebuild itself. 
Please try these beforehand if possible. \
Flutter is actually very good at figuring these out for itself and these are then the optimized solutions. \
It just doesn't always work that way. 
