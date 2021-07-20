class Product {
  final int id;
  final String title;
  final String price;
  final String image;
  final String subtitle;
  final String amount;
  final String category;
  final String foodType;

  Product({
    this.id,
    this.title,
    this.price,
    this.image,
    this.subtitle,
    this.amount,
    this.category,
    this.foodType,
  });

  factory Product.fromMap(Map<String, dynamic> json) => Product(
        id: json["id"],
        title: json["title"],
        price: json["price"],
        image: json["image"],
        subtitle: json["subtitle"],
        amount: json["amount"],
        category: json["category"],
        foodType: json["foodType"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "price": price,
        "image": image,
        "subtitle": subtitle,
        "amount": amount,
        "category": category,
        "foodType": foodType,
      };
}
