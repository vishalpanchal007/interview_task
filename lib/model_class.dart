class Product {
  final int id;
  final String title;
  final String image;
  final double price;
  final double rating;

  Product({
    required this.id,
    required this.title,
    required this.image,
    required this.price,
    required this.rating,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      image: json['image'],
      price: json['price'].toDouble(),
      rating: json['rating']['rate'].toDouble(),
    );
  }
}
