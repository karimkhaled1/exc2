import 'package:exc2/exc2.dart';
import 'package:exc2/product_model.dart';
import 'package:test/test.dart';

void main() {
  late List<Product> products;
  setUp(() {
    products = [
      Product("id1", "area1", "name1", 2, "brand1"),
      Product("id2", "area2", "name1", 1, "brand1"),
      Product("id3", "area3", "name1", 5, "brand2"),
      Product("id4", "area4", "name2", 3, "brand3")
    ];
  });

  test('avarage', () {
    expect(avarage(products)['name1'], equals(2));
    expect(avarage(products)['name2'], equals(0.75));
  });

  test('PopularBrand', () {
    expect(getPopularBrand(products)['name1'], equals("brand1"));
    expect(getPopularBrand(products)['name2'], equals("brand3"));
  });
  test("fileName parsing", () {
    expect(getFileName("d/test/bla"), equals("bla"));
    expect(getFileName(r"d\test\bla"), equals("bla"));
  });

  test('from csv parsing', () {
    var testedProduct = Product.fromCSV("ID1,Minneapolis,shoes,2,Air");
    expect(testedProduct.id, equals("ID1"));
    expect(testedProduct.area, equals("Minneapolis"));
    expect(testedProduct.name, equals("shoes"));
    expect(testedProduct.quantity, equals(2));
    expect(testedProduct.brand, equals("Air"));
  });
}
