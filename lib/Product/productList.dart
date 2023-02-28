class Product {
  late final String name;
  late final double price;
  late final String imageUrl;

  Product({required this.name, required this.price, required this.imageUrl});

  static List<Product> products = [
    Product(
        name: "Mango",
        price: 10,
        imageUrl:
            "https://image.shutterstock.com/image-photo/mango-isolated-on-white-background-600w-610892249.jpg"),
    Product(
        name: "Orange",
        price: 20,
        imageUrl:
            "https://image.shutterstock.com/image-photo/orange-fruit-slices-leaves-isolated-600w-1386912362.jpg"),
    Product(
        name: "Grapes",
        price: 30,
        imageUrl:
            "https://image.shutterstock.com/image-photo/green-grape-leaves-isolated-on-600w-533487490.jpg"),
  ];
}
