import 'package:e_commerce_app/utils/product_utils.dart';
import 'package:e_commerce_app/views/screens/cart_page.dart';
import 'package:e_commerce_app/views/screens/profile_page.dart';
import 'package:e_commerce_app/views/screens/search_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> categories = [];

  @override
  void initState() {
    categories =
        allproduct.map((e) => e['category'].toString()).toSet().toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        leading: GestureDetector(
          child: const Icon(Icons.search, color: Colors.black54),
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const SearchPage(),
            ),
          ),
        ),
        title: const Text("Search"),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const CartPage(
                    id: 101,
                    data: "Data from HomePage",
                    title: "Cart Data",
                  ),
                ),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.shopping_cart,
                color: Colors.black54,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: const [
            DrawerHeader(
              child: Text('User'),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.5),
        child: Column(
          children: [
            // TopItemView
            Expanded(
              flex: 3,
              child: PageView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 5,
                          offset: Offset(3, 3),
                        ),

                      ],
                      image: const DecorationImage(
                        image: AssetImage("assets/images/e_commerce_app_1.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),

            Container(
              margin: const EdgeInsets.only(top: 16),
              alignment: Alignment.centerLeft,
              child: const Text(
                "Categories",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),

            SizedBox(
              height: size.height * 1 / 100,
            ),

            // CategoriesView
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: categories
                    .map(
                      (e) => Container(
                    margin: const EdgeInsets.all(5),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.orangeAccent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      e.replaceFirst(e[0], e[0].toUpperCase()),
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                )
                    .toList(),
              ),
            ),

            Container(
              margin: const EdgeInsets.only(top: 16),
              alignment: Alignment.centerLeft,
              child: const Text(
                "Popular Product",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),

            // AllItemView
            Expanded(
              flex: 3,
              child: PageView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: allproduct.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        'detail_page',
                        arguments: allproduct[index],
                      );
                    },
                    child: Container(
                      width: size.width * 0.8,
                      margin: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 7,
                            offset: Offset(3, 3),
                          )
                        ],
                      ),
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          // ProductImage
                          Expanded(
                            flex: 2,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: NetworkImage(
                                    allproduct[index]['thumbnail'],
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          // Add space between image and data
                          const SizedBox(width: 10),
                          // ProductData
                          Expanded(
                            flex: 2,
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    allproduct[index]['title']
                                        .toString()
                                        .toUpperCase(),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  // Add space between title and description
                                  const SizedBox(height: 8),
                                  Text(
                                    allproduct[index]['description'],
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  // Add space between description and price
                                  const SizedBox(height: 8),
                                  Text(
                                    "\$ ${allproduct[index]['price'].toString()}/-",
                                    style: const TextStyle(
                                      color: Colors.orangeAccent,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              height: 30,
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(25),
              ),
              margin: const EdgeInsets.fromLTRB(0, 16, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    child: const Icon(Icons.home, color: Colors.white),
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const HomePage(),
                      ),
                    ),
                  ),
                  GestureDetector(
                    child: const Icon(Icons.search, color: Colors.white),
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const SearchPage(),
                      ),
                    ),
                  ),
                  GestureDetector(
                    child: const Icon(Icons.person, color: Colors.white),
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const ProfilePage(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}