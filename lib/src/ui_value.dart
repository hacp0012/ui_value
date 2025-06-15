/// HANDLE UI STATE
///
/// Use less set state [setState] in codes.
///
/// ```dart
/// // Use as this: if yout use it in a method.
/// UIValue<bool> value = UIValue(setState, true);
///
/// // Use as this: if you use it in a class.
/// late UIValue<bool> value = UIValue(setState, true);
/// ```
class UiValue<T> {
  UiValue(this.setState, T value) : _value = value;

  void Function(void Function()) setState;

  T _value;

  /// [T] Value of type.
  T get value => _value;
  set value(T data) => setState.call(() => _value = data);

  /// Manuely update view (ShortCut).
  void update() => setState.call(() {});
}
