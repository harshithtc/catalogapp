class CatalogModel {
  static List<Item> items = [
    Item(
      id: 1,
      brand: "Samsung",
      model: "Galaxy S24 Ultra",
      price: 129999,
      storage: "512GB",
      ram: "12GB",
      camera: "200MP + 12MP + 10MP + 10MP",
      battery: "5000mAh",
      rating: 4.8,
      isAvailable: true,
      imageUrl:
          "https://i.pinimg.com/736x/24/22/32/24223258deb2711a6cfb6ffe2ba3b5e9.jpg",
    ),
  ];
}

class Item {
  final int id;
  final String brand;
  final String model;
  final int price;
  final String storage;
  final String ram;
  final String camera;
  final String battery;
  final double rating;
  final bool isAvailable;
  final String imageUrl;

  // ✅ Constructor
  Item({
    required this.id,
    required this.brand,
    required this.model,
    required this.price,
    required this.storage,
    required this.ram,
    required this.camera,
    required this.battery,
    required this.rating,
    required this.isAvailable,
    required this.imageUrl,
  });

  // ✅ fromJson method
  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map['id'],
      brand: map['brand'],
      model: map['model'],
      price: map['price'],
      storage: map['storage'],
      ram: map['ram'],
      camera: map['camera'],
      battery: map['battery'],
      rating: (map['rating'] as num).toDouble(),
      isAvailable: map['isAvailable'],
      imageUrl: map['imageUrl'],
    );
  }

  // ✅ toJson method
  toMap() => {
    'id': id,
    'brand': brand,
    'model': model,
    'price': price,
    'storage': storage,
    'ram': ram,
    'camera': camera,
    'battery': battery,
    'rating': rating,
    'isAvailable': isAvailable,
    'imageUrl': imageUrl,
  };
}
