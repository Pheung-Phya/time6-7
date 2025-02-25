enum Category {
  bread,
  cake,
  cookeis,
  donut;
}

class Shop {
  final int id;
  final String name;
  final String description;
  final double price;
  final List<String> size;
  final String image;
  final Category category;

  Shop(
      {required this.id,
      required this.name,
      required this.description,
      required this.price,
      required this.size,
      required this.image,
      required this.category});
}
