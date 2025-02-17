class Product {
  int? id;
  late String title,description, category,thumbnail  ;
  double? price;


  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    category = json['category'];
    price = json['price'];
    thumbnail = json['thumbnail'];
  }


}
