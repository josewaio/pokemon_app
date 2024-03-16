class Region {
  final String name;
  final String subtitle;
  final int quantity;
  final String image;

  Region({required this.name, required this.subtitle, required this.quantity, required this.image});

  factory Region.fromJson(Map<String, dynamic> json) {
    return Region(
      name: json['name'],
      subtitle: json['subtitle'],
      quantity: json['quantity'],
      image: json['image'],
    );
  }
}
