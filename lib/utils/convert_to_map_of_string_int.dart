class ConvertToMapOfStringInt {
  final Map<dynamic, dynamic> toConverter;
  ConvertToMapOfStringInt({required this.toConverter});

  Map<String, int> convert() {
    Map<String, int> convertedMap = {};
    toConverter.forEach((key, value) {
      convertedMap[key.toString()] = int.parse(value.toString());
    });
    return convertedMap;
  }
}
