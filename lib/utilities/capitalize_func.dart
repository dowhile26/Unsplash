String capitalize(String string) {
  if (string == null) {
//    throw ArgumentError("string: $string");
    return '';
  }

  if (string.isEmpty) {
    return string;
  }

  return string[0].toUpperCase() + string.substring(1);
}