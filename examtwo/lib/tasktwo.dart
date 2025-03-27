import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryItem {
  final String name;
  final String image;
  final List<String> details;

  CategoryItem({
    required this.name, 
    required this.image, 
    required this.details
  });
}

class CategoryListScreen extends StatelessWidget {
  //const CategoryListScreen({super.key});
  final List<CategoryItem> categories = [
    CategoryItem(name: 'Mobiles, SmartPhones', image: 'assets/mobile.png', details: ['iphone 13 pro', 'Samsung Galaxy S21', 'Google Pixel 6', 'OnePlus 9 Pro']),
    CategoryItem(name: 'Fashion, Clothing', image: 'assets/fashion.png', details: ['Men\'s Casual Shirts', 'Women\'s Casule Shirts', 'Summer Dresses', 'Denim Jeans']),
    CategoryItem(name: 'Electronics and Audio', image: 'assets/electronics.png', details: ['Laptop', 'Digital Camera', 'Wireless HeadPhones', "Smart Speaker"]),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
      ),
      body: GridView.builder(padding: EdgeInsets.all(10), gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 1, crossAxisSpacing: 10, mainAxisSpacing: 10), itemCount: categories.length, itemBuilder: (context, index) {
        final category = categories[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CategoryDetailScreen(category: category))
            );
          },
          child: Container(
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10), boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3)
              ),
            ]
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  category.image,
                  height: 100,
                  width: 100
                ),
                SizedBox(height: 10),
                Text(
                  category.name,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        );
      },
      ),
    );
  }
}
class CategoryDetailScreen extends StatelessWidget {
  final CategoryItem category;
  CategoryDetailScreen({required this.category});
  //const CategoryDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category.name),
      ),
      body: Column(
        children: [
          Image.asset(category.image,height: 250, width: 250, fit: BoxFit.cover),
          Expanded(
              child: ListView.builder(
                  itemCount: category.details.length,
                  itemBuilder: (context, index){
                    return ListTile(
                      title: Text(category.details[index]),
                    );
                  },
              ),
          ),

        ],
      ),
    );
  }
}

