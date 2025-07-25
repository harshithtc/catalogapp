class Items {
  final String id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Items({
    required this.id,
    required this.name,
    required this.desc,
    required this.price,
    required this.color,
    required this.image,
  });
}

final List<Items> products = [
  Items(
    id: "001",
    name: "Phone Alpha",
    desc: "A powerful smartphone with a sleek design.",
    price: 499,
    color: "Midnight Black",
    image: "https://images.unsplash.com/photo-1511707171634-5f897ff02aa9",
  ),
  Items(
    id: "002",
    name: "Phone Beta",
    desc: "Affordable smartphone with a great camera.",
    price: 349,
    color: "Crimson Red",
    image: "https://images.unsplash.com/photo-1510557880182-3b1c5c6e4c98",
  ),
  Items(
    id: "003",
    name: "Phone Gamma",
    desc: "Top-tier performance with all-day battery.",
    price: 599,
    color: "Ocean Blue",
    image: "https://images.unsplash.com/photo-1482062364825-616fd23b8fc1",
  ),
  Items(
    id: "004",
    name: "Phone Delta",
    desc: "Compact size, advanced features.",
    price: 429,
    color: "Forest Green",
    image: "https://images.unsplash.com/photo-1464076598081-cbce1f2658b1",
  ),
  Items(
    id: "005",
    name: "Phone Epsilon",
    desc: "Classic smartphone, robust build quality.",
    price: 379,
    color: "Pearl White",
    image: "https://images.unsplash.com/photo-1506744038136-46273834b3fb",
  ),
  Items(
    id: "006",
    name: "Phone Zeta",
    desc: "Perfect for productivity on the go.",
    price: 459,
    color: "Sunset Orange",
    image: "https://images.unsplash.com/photo-1519125323398-675f0ddb6308",
  ),
  Items(
    id: "007",
    name: "Phone Eta",
    desc: "Budget-friendly, reliable everyday use.",
    price: 299,
    color: "Slate Gray",
    image: "https://images.unsplash.com/photo-1465101046530-73398c7f28ca",
  ),
  Items(
    id: "008",
    name: "Phone Theta",
    desc: "Elegant design, vibrant display.",
    price: 549,
    color: "Rose Gold",
    image: "https://images.unsplash.com/photo-1523475496153-3d6cc8760bb8",
  ),
  Items(
    id: "009",
    name: "Phone Iota",
    desc: "Long battery life, smooth performance.",
    price: 399,
    color: "Steel Blue",
    image: "https://images.unsplash.com/photo-1517336714731-489689fd1ca8",
  ),
  Items(
    id: "010",
    name: "Phone Kappa",
    desc: "Premium materials, high-resolution screen.",
    price: 649,
    color: "Emerald Green",
    image: "https://images.unsplash.com/photo-1464454709131-ffd692591ee5",
  ),
];
