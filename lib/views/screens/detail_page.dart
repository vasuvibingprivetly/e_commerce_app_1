import 'package:e_commerce_app/utils/product_utils.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DPState();
}

class _DPState extends State<DetailPage> {
  late Map<String, dynamic> product;

  @override
  Widget build(BuildContext context) {
    product = (ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>) ?? allproduct[0];

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(product['title'] ?? "No Data"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // ThumbnailView
            SingleChildScrollView(
              // physics: BouncingScrollPhysics(parent:AlwaysScrollableScrollPhysics(), ),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  (product['images'] as List<dynamic>?)?.length ?? 0,
                      (index) => Container(
                    height: size.height * 0.3,
                    width: size.width * 0.9,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      image: DecorationImage(
                        image: NetworkImage(product['images'][index] ?? ''),
                        fit: BoxFit.cover,
                      ),
                    ),
                    margin: const EdgeInsets.all(10),
                  ),
                ),
              ),
            ),
            const Spacer(),
            // DetailsCard
            Container(
              height: size.height * 0.5,
              width: size.width,
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 6,
                    spreadRadius: 3,
                    offset: Offset(0, -2),
                  ),
                ],
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(40),
                ),
              ),
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product['title'],
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    product['description'],
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    product['price']?.toString() ?? "No Price",
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          late SnackBar snackBar;
          if (cartItems.contains(product)) {
            cartItems.remove(product);
            snackBar = SnackBar(
              content: Text("${product['title']} removed from the CART !!"),
              backgroundColor: Colors.red,
              behavior: SnackBarBehavior.floating,
            );
          } else {
            cartItems.add(product);
            snackBar = SnackBar(
              content: Text("${product['title']} added to the CART !!"),
              backgroundColor: Colors.green,
              behavior: SnackBarBehavior.floating,
            );
          }

          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        icon: const Icon(Icons.shopping_cart),
        label: const Text("Add to cart"),
      ),
    );
  }
}
