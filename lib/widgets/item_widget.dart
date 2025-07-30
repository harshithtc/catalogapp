import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/catalog.dart';

class ItemWidget extends StatelessWidget {
  final Item item;
  const ItemWidget({super.key, required this.item});
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: ListTile(
        contentPadding: const EdgeInsets.all(10),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            item.imageUrl,
            width: 60,
            height: 80,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(
          "${item.brand} ${item.model}",
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          "RAM: ${item.ram}, Storage: ${item.storage}\nCamera: ${item.camera}",
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "₹${item.price}",
              style: const TextStyle(
                color: Color.fromARGB(255, 52, 7, 232),
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 4),
            Icon(
              item.isAvailable ? Icons.check_circle : Icons.cancel,
              color: item.isAvailable ? Colors.green : Colors.red,
              size: 18,
            ),
          ],
        ),
      ),
    );
  }
}
