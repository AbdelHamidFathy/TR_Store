class CartItemModel {
  final int id;
  final String title;
  final int price;
  final String image;
  final String description;
  final int quantity;

  CartItemModel({
    required this.id,
    required this.title,
    required this.price,
    required this.image,
    required this.description,
    required this.quantity,
  });
}
