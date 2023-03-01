import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:powstik/cart.dart';
import 'productList.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({Key? key}) : super(key: key);

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  CollectionReference products =
      FirebaseFirestore.instance.collection('products');

  Future<void> addUser(int prId, String prName, double prPrice, String img) {
    // Call the user's CollectionReference to add a new user
    return products
        .add({
          'productId': prId,
          'productName': prName,
          'productPrice': prPrice,
          'img': img,
        })
        .then((value) => print("Product Added"))
        .catchError((error) => print("Failed to add product: $error"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Products"),
        automaticallyImplyLeading: false,
        actions: [
          Center(
            child: GestureDetector(
              child: Icon(Icons.shopping_bag_outlined),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Cart();
                }));
              },
            ),
          ),
          SizedBox(width: 20),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: 7,
                itemBuilder: (context, index) {
                  return Card(
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Image.network(
                                Product.products[index].imageUrl,
                                height: 100,
                                width: 100,
                              ),
                              SizedBox(width: 15),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      Product.products[index].name,
                                      style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text("Rs " +
                                        (Product.products[index].price)
                                            .toString()),
                                    Align(
                                      // alignment: Alignment.,
                                      child: GestureDetector(
                                        onTap: () {
                                          addUser(
                                            Product.products[index].productId,
                                            Product.products[index].name,
                                            Product.products[index].price,
                                            Product.products[index].imageUrl,
                                          );
                                          Navigator.push(context,
                                              MaterialPageRoute(
                                                  builder: (context) {
                                            return Cart();
                                          }));
                                        },
                                        child: Container(
                                          width: double.infinity,
                                          margin: EdgeInsets.only(top: 5),
                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            color: Colors.orange,
                                          ),
                                          child: Center(
                                            child: Text(
                                              "Add To Cart",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
          GestureDetector(
            onTap: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.pop(context);
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.black,
              ),
              margin: EdgeInsets.all(20),
              height: 50,
              width: double.infinity,
              child: Center(
                child: Text(
                  'Sign Out',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
