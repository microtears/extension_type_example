extension type const JsonValue._(Object? value) {
  factory JsonValue(Object? value) {
    if (value == null) {
      return const JsonNull();
    }
    return switch (value) {
      bool _ => JsonBool(value),
      num _ => JsonNumber(value),
      String _ => JsonString(value),
      List<dynamic> _ => JsonList(value as List<JsonValue>),
      Map<String, dynamic> _ => JsonMap(value as Map<String, JsonValue>),
      _ => throw ArgumentError.value(value, 'value',
          'Must be null, json, bool, List<Object?>, Map<String, Object?>, num or String'),
    };
  }
}

extension type const JsonBool(bool value) implements JsonValue {}

extension type const JsonNumber(num value) implements JsonValue {}

extension type const JsonString(String value) implements JsonValue {}

extension type const JsonList(List<JsonValue> value) implements JsonValue {}

extension type const JsonMap(Map<String, JsonValue> value)
    implements JsonValue {}

extension type const JsonNull._(Null value) implements JsonValue {
  const JsonNull() : this._(null);
}
