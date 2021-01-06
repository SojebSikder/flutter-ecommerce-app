import 'package:flutter/material.dart';

class Cart_products extends StatefulWidget {
  @override
  _Cart_productsState createState() => _Cart_productsState();
}

class _Cart_productsState extends State<Cart_products> {
  var Product_on_the_cart = [
    {
      "name": "Blazer",
      "picture": "images/products/blazer1.jpeg",
      "price": 85,
      "size": "M",
      "color": "Black",
      "quantity": 1,
    },
    {
      "name": "Red dress1",
      "picture": "images/products/dress1.jpeg",
      "price": 50,
      "size": "M",
      "color": "Red",
      "quantity": 1,
    }
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: Product_on_the_cart.length,
      itemBuilder: (BuildContext context, int index) {
        return Single_cart_product(
          cart_product_name: Product_on_the_cart[index]["name"],
          cart_product_picture: Product_on_the_cart[index]["picture"],
          cart_product_price: Product_on_the_cart[index]["price"],
          cart_product_size: Product_on_the_cart[index]["size"],
          cart_product_color: Product_on_the_cart[index]["color"],
          cart_product_quantity: Product_on_the_cart[index]["quantity"],
        );
      },
    );
  }
}

// cart product elements
class Single_cart_product extends StatelessWidget {
  final cart_product_name;
  final cart_product_picture;
  final cart_product_price;
  final cart_product_size;
  final cart_product_color;
  final cart_product_quantity;

  const Single_cart_product({
    this.cart_product_name,
    this.cart_product_picture,
    this.cart_product_price,
    this.cart_product_size,
    this.cart_product_color,
    this.cart_product_quantity,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.asset(
          cart_product_picture,
          width: 80.0,
          height: 80.0,
        ),
        title: Text(cart_product_name),
        subtitle: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Text("Size:"),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    cart_product_size,
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 8.0, 8.0, 8.0),
                  child: Text("Color:"),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    cart_product_color,
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ],
            ),
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                "\$$cart_product_price",
                style: TextStyle(
                  fontSize: 17.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),
        trailing: SingleChildScrollView(
          child: Column(
            children: [
              IconButton(
                icon: Icon(Icons.arrow_drop_up),
                onPressed: () {},
              ),
              Text("$cart_product_quantity"),
              IconButton(
                icon: Icon(Icons.arrow_drop_down),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  //
  void addQuantity() {
    //cart_product_quantity = cart_product_quantity + 1;
  }
}
