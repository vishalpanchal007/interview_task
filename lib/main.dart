import 'package:flutter/material.dart';
import 'package:untitled/Api_screen.dart';
import 'package:untitled/Product_card.dart';
import 'package:untitled/model_class.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
late Future<List<Product>>products;
String selectedCategory = 'All';
String selected1="jewelery";
@override
  void initState() {
    super.initState();
    products = FetchData();
  }
List<Product> filterProducts(List<Product> products) {
  if (selectedCategory == 'All') {
    return products;
  } else {
    return products.where((product) => product == selectedCategory).toList();
  }
}
List<Product> filterProductss(List<Product> products) {
  if (selected1 == 'jewelery') {
    return products;
  } else {
    return products.where((product) => product == selected1).toList();
  }
}
@override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text(' Cart App')),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text('Categories'),
                decoration: BoxDecoration(
                  color: Colors.red,
                ),
              ),
              Divider(height: 2,),
              ListTile(
                title: Text('All'),
                onTap: () {
                  setState(() {
                    selectedCategory = 'All';
                    Navigator.pop(context);
                  });
                },
              ), Divider(height: 2,),
              ListTile(
                title: Text('jewelery'),
                onTap: () {
                  setState(() {
                    selected1 = 'jewelery';
                    Navigator.pop(context);
                  });
                },
              ), Divider(height: 2,),
              ListTile(
                title: Text('Women\'s Clothing'),
                onTap: () {
                  setState(() {
                    selectedCategory = 'women\'s clothing';
                    Navigator.pop(context);
                  });
                },
              ), Divider(height: 2,),
              ListTile(
                title: Text('Men\'s Clothing'),
                onTap: () {
                  setState(() {
                    selectedCategory = 'men\'s clothing';
                    Navigator.pop(context);
                  });
                },
              ), Divider(height: 2,),
              ListTile(
                title: Text('Smartphones'),
                onTap: () {
                  setState(() {
                    selectedCategory = 'smartphones';
                    Navigator.pop(context);
                  });
                },
              ), Divider(height: 2,),
              ListTile(
                title: Text('Laptops'),
                onTap: () {
                  setState(() {
                    selectedCategory = 'laptops';
                    Navigator.pop(context);
                  });
                },
              ),
            ],
          ),
        ),
        body: FutureBuilder<List<Product>>(
          future: products,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (snapshot.hasData) {
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.7,
                ),
                padding: EdgeInsets.all(10),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  var product = snapshot.data![index];
                  return ProductCard(product: product);
                },
              );
            } else {
              return Center(child: Text('No products found.'));
            }
          },
        ),
      )
    );
  }
}
