import 'package:exc2/product_model.dart';

Map<String, double> avarage(List<Product> products) {
  Map<String, int> map = {};
  for (var element in products) {
    map.putIfAbsent(element.name, () => 0);
    map[element.name] = map[element.name]! + element.quantity;
  }
  return map.map((key, value) => MapEntry(key, value / products.length));
}

Map<String, String> getPopularBrand(List<Product> products) {
  String getMaxKey(Map<String, int> map) {
    int max = -1;
    String selectedKey = "";
    map.forEach((key, value) {
      if (max < value) {
        max = value;
        selectedKey = key;
      }
    });
    return selectedKey;
  }

  Map<String, Map<String, int>> map = {};
  for (var element in products) {
    map.putIfAbsent(element.name, () => {element.brand: 0});
    map[element.name]!.putIfAbsent(element.brand, () => 0);
    map[element.name]![element.brand] = map[element.name]![element.brand]! + 1;
  }
  return map.map((key, value) => MapEntry(key, getMaxKey(value)));
}

String getFileName(String filePath) => filePath.split("/").last.split(r'\').last;

String filePath(String path, String prefix) => path.replaceAll(getFileName(path), "$prefix${getFileName(path)}");

String getFormatedCSV(Map<String, dynamic> map) {
  String csvString = "";
  map.forEach((key, value) {
    csvString = "$csvString$key,$value\n";
  });
  return csvString;
}
