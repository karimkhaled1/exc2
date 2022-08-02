class Product {
  String id, area, name, brand;
  int quantity;
  Product(this.id, this.area, this.name, this.quantity, this.brand);
  factory Product.fromCSV(String value) {
    var res = value.split(',');
    return Product(res[0], res[1], res[2], int.parse(res[3]), res[4]);
  }
}
