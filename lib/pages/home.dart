import 'package:bihongobuy/components/drawer_component.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

// Custom Package
import 'package:bihongobuy/components/horizontal_listview.dart';
import 'package:bihongobuy/components/products.dart';
import 'package:bihongobuy/pages/cart.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageSate();
}

class _HomePageSate extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    //
    Widget image_carousel = new Container(
      height: 200.0,
      child: Carousel(
        boxFit: BoxFit.cover,
        images: [
          Image.asset("images/c1.jpg"),
          Image.asset("images/m1.jpeg"),
          Image.asset("images/m2.jpg"),
          Image.asset("images/w1.jpeg"),
          Image.asset("images/w3.jpeg"),
          Image.asset("images/w4.jpeg"),
        ],
        autoplay: false,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 1000),
        dotSize: 4.0,
        indicatorBgPadding: 2.0,
        dotBgColor: Colors.transparent,
      ),
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Bihongo"),
            Text(
              "Buy",
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
          IconButton(
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Cart()));
            },
          )
        ],
        //
      ),
      drawer: DrawerComponent(),
      body: Column(
        children: [
          image_carousel,
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "Categories",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          // Horizontal List View
          HorizontalList(),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "Recent products",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),

          // grid view
          Flexible(
            child: Products(),
          ),
        ],
      ),
    );
  }
}
