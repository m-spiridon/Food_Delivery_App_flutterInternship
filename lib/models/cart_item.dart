class CartItem {
  final int productId;
  final int quantity;

  CartItem({
    this.productId,
    this.quantity,
  });

  factory CartItem.fromMap(Map<String, dynamic> json) =>
      CartItem(productId: json["productId"], quantity: json["quantity"]);

  Map<String, dynamic> toMap() => {
        "productId": productId,
        "quantity": quantity,
      };
}
