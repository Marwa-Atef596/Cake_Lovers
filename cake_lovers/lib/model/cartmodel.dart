class Cart1 {
  late final int id;
  final String? productId;
  final String? productName;
  final int? initPrice;
  final int? productPrice;
  final int? quantity;
  final String images;

  Cart1(
      {required this.productId,
      required this.productName,
      required this.initPrice,
      required this.productPrice,
      required this.quantity,
      required this.images, required this.id});

  Cart1.fromMap(Map<dynamic, dynamic> res)
      : id = res['id'],
        productId = res['productId'],
        productName = res['productName'],
        initPrice = res['initPrice'],
        productPrice = res['productPrice'],
        quantity = res['quantity'],
        images = res['images'];
  Map<String, Object?> toMap() {
    return {
      'id': id,
      'productId': productId,
      'productName': productName,
      'initPrice': initPrice,
      'productPrice': productPrice,
      'quantity': quantity,
      'images': images,
    };
  }
}
