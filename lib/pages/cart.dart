import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Shopping"),
            Text(
              "Cart",
              style: TextStyle(
                color: Colors.green,
              ),
            ),
          ],
        ),
        centerTitle: true,
        elevation: 0.0,
        //
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ],
        //
      ),
      //
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Row(
          children: [
            // Total Money
            Expanded(
              child: ListTile(
                title: Text("Total:"),
                subtitle: Text("\$[money]"),
              ),
            ),
            // Checkout Button
            Expanded(
              child: MaterialButton(
                onPressed: () {},
                child: Text(
                  "Check out",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
