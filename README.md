Simplify state management and reduce the need for multiple `setState` calls.

## Features

If you're tired of constantly calling `setState` just for a single variable,
then you're in the right place.

I'm offering a small alternative (nothing big) that has become indispensable for me.
I hope it will be for you too.

Prerequisites:

- Just Flutter (Even though the mixin doesn't require being declared on a [State] class,
I trust you'll use it properly.)

## Getting started

Start by importing this into your code:

```dart
import 'package:ui_value/ui_value.dart';
```

That's it! You now have the `UiValue` class and the `UiValueMixin` mixin at your disposal.

The best part is that you can often use `UiValueMixin`, which I recommend, except for more complex cases.

In the `UiValue` class, you have:

- `value`
- `update()`

Both are available on the variable you declare:

```dart
final UiValue<bool> isValue = UiValue(setState, true);

print("Is value: ${isValue.value}");

// To explicitly update the UI via the object.
isValue.update();
```

In the `UiValueMixin`, you have the following methods available:

- `uiValue()`
- `uiUpdate()` which you can also use like this: `uiUpdate(() {})`

_Note that this mixin extends the `UiValue` class._

## Usage

__UI VALUE MIXIN__

Use only on `State`. It helps you use `setState` less often.

- Remember to use `late` declaration. Otherwise, you'll need to initialize it in `initState`.

```dart
...
class _ExampleScreenState extends State<ExampleScreen> with UiValueMixin {
    late var isLoading = uiValue(false);

    @override
    void Function(void Function()) get uiSetState => setState;

    ...
    
    ElevatedButton(
        onPressed: () => isLoading.value = !isLoading.value,
        child: Text("Toggle loading"),
    ),

    ElevatedButton(
        onPressed: () => uiUpdate(() => showMessage = true),
        child: Text("Show message"),
    ),

    ElevatedButton(
        onPressed: () => isLoading.update(),
        child: Text("Update loading"),
    ),

    ...

    void example() {
        isLoading.update(); // This will update the UI without needing to call setState directly.

        date = DateTime.now();
        isConnected = true;
        uiUpdate(); // This will update the UI.

        // OR
        uiUpdate(() {
          date = DateTime.now();
          isConnected = true;
        });
    }

    void printMessage(String s) {
        // This is just a placeholder for any print statements you might want to use.
        // In a real application, you might want to use logging instead.
        debugPrint(s);
    }
    ...
}
```

More details can be found in the example.

## Additional information

If you want to make improvements, you can contact me by email at
[princeieugene48@gmail.com](mailto:princeieugene48@gmail.com)
or leave a message on my GitHub: hacp0012
