class Product {
  late final int productId;
  late final String name;
  late final double price;
  late final String imageUrl;

  Product(
      {required this.name,
      required this.price,
      required this.imageUrl,
      required this.productId});

  static List<Product> products = [
    Product(
        productId: 1,
        name: "Pancake",
        price: 231,
        imageUrl:
            "https://powstik.com/wp-content/uploads/2023/02/AncientRoots1-300x300.png"),
    Product(
        productId: 2,
        name: "Almonds",
        price: 139,
        imageUrl:
            "https://powstik.com/wp-content/uploads/2023/02/c1-1-300x300.png"),
    Product(
        productId: 3,
        name: "Organic Kismis",
        price: 68,
        imageUrl:
            "https://powstik.com/wp-content/uploads/2023/02/Kismis-100-gm-Front-Side-EAN-8906063361701-1-1536x1023.jpg"),
    Product(
        productId: 4,
        name: "Rice",
        price: 558,
        imageUrl:
            "https://powstik.com/wp-content/uploads/2022/05/Befach-rice-image-Front-1536x1536.jpeg"),
    Product(
        productId: 5,
        name: "Sugar",
        price: 560,
        imageUrl:
            "https://powstik.com/wp-content/uploads/2022/05/Sugar-1kg-pet-Jar-Pack-of-2.jpeg"),
    Product(
        productId: 6,
        name: "Amla Juice",
        price: 264,
        imageUrl:
            "https://powstik.com/wp-content/uploads/2022/10/Amla-Juice-1-450x450.png"),
    Product(
        productId: 7,
        name: "Cofeee",
        price: 60,
        imageUrl:
            "https://powstik.com/wp-content/uploads/2022/10/Thirikadugam-Karuppati-coffee-450x450.jpeg"),
  ];
}
