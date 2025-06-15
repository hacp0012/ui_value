import 'package:ui_value/ui_value.dart' show UiValue;

/// UI VALUE MIXIN
///
/// Use only on [State]. Is avoid you to use more [setState], use less [setState]
/// - Remember to use [late] declaration. If not you will be constrained to initialize its in
/// [initState].
///
/// ```dart
///  ...
/// class _ExemplScreenState extends State<ExemplScreen> with UiValueMixin {
///   late var isLoading = uiValue(false);
///
///   @ovarride
///   void Function(void Function() p1) get uiSetState => setState;
///   ...
/// }
/// ```
mixin UiValueMixin {
  /// A setState method that will be used to update the UI.
  ///
  /// ```dart
  /// @override
  /// void Function(void Function() p1) get uiSetState => setState;
  /// ```
  void Function(void Function()) get uiSetState;

  /// Initize value and return [UiValue<T>] value.
  ///
  /// ```dart
  /// late var isLoading = uiValue(false);
  /// ```
  UiValue<T> uiValue<T>(T value) => UiValue<T>(uiSetState, value);

  /// Update state by calling [uiSetState]
  ///
  /// ```dart
  /// uiUpdate();
  /// // or
  /// uiUpdate(() {
  ///   isUpdated = true;
  /// });
  /// ```
  void uiUpdate([void Function()? fn]) => fn != null ? uiSetState.call(fn) : uiSetState.call(() {});
}
