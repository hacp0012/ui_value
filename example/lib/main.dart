// **** SIMPLE EXEMPLE ****
// This example demonstrates how to use the `ui_value` package to manage UI state in a Flutter application.
// This Exemple use `UiValueMixin` to simplify state management and reduce the need for multiple `setState` calls.

import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:ui_value/ui_value.dart';

class ExemplScreen extends StatefulWidget {
  const ExemplScreen({super.key});

  @override
  State<ExemplScreen> createState() => _ExemplScreenState();
}

class _ExemplScreenState extends State<ExemplScreen> with UiValueMixin {
  late var isLoading = uiValue(false);
  bool isLoading2 = false;

  // Using UiValue directly
  late final UiValue<int> counter = UiValue(setState, 0);

  // Example: Using UiValueMixin with uiValue
  late final UiValue<String> message = uiValue("Hello, UiValue!");

  // VIEW !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  // OVERRIGING UI STATE.
  @override
  void Function(void Function() p1) get uiSetState => setState;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("UI Value Example")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (isLoading.value || isLoading2) const Text("Is in loading ...") else Text("LOADING DONE"),

              SizedBox(height: 18),
              ElevatedButton(onPressed: () => isLoading.value = !isLoading.value, child: Text("Toggle loading")),

              SizedBox(height: 18),
              ElevatedButton(
                onPressed: () {
                  // If you want to update UI after changing counter, call uiSetState or uiUpdate
                  uiUpdate(() => isLoading2 = !isLoading2);
                  // Alternatively, you can use uiSetState directly or as this:
                  // uiUpdate();
                },
                child: Text("Toggle using uiUpdate"),
              ),

              SizedBox(height: 18),
              ElevatedButton(onPressed: incrementCounter, child: Text("Increment Counter: ${counter.value}")),

              SizedBox(height: 18),
              ElevatedButton(
                onPressed: () => updateMessage("New Message at ${DateTime.now()}"),
                child: Text("Update Message: ${message.value}"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // METHODS !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  // You can add more methods here if needed, but remember to use `uiUpdate` to update the UI state.
  // Example: Using UiValue directly

  void incrementCounter() => counter.value++;

  void updateMessage(String newMessage) => message.value = newMessage;

  void exemple() {
    isLoading.update(); // This will update the UI without needing to call setState directly.
  }

  print(String s) {
    // This is just a placeholder for any print statements you might want to use.
    // In a real application, you might want to use logging instead.
    debugPrint(s);
  }
}

// MAIN ======================================================================================================================
void main() => runApp(MaterialApp(home: ExemplScreen()));
