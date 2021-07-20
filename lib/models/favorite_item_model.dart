class FavoriteItem {
  final int productId;

  FavoriteItem({this.productId});

  factory FavoriteItem.fromMap(Map<String, dynamic> json) =>
      FavoriteItem(productId: json["productId"]);

  Map<String, dynamic> toMap() => {
        "productId": productId,
      };
}
