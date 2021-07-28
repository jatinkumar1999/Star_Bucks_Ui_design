import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: "Montserrat",
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var itemSelected = "All Products";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
        actions: [
          Stack(children: [
            Container(
              width: 70,
              height: 70,
            ),
            Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.circular(100.0),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 10,
                        color: Colors.teal,
                      ),
                    ]),
                child: Icon(
                  Icons.shopping_bag_outlined,
                  color: Colors.white,
                )),
            Container(
                margin: EdgeInsets.only(
                  top: 30,
                ),
                alignment: Alignment.center,
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Text("8",
                    style: TextStyle(
                      color: Colors.white,
                    )))
          ]),
        ],
      ),
      body: Container(
        margin: EdgeInsets.only(top: 15, left: 20, right: 20),
        child: ListView(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              child: Text(
                "Starbucks Coffee",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: 30),
            Container(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  buildCardTile(5, "All Products"),
                  buildCardTile(5, "Espresso"),
                  buildCardTile(5, "Iced  Tea"),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: MediaQuery.of(context).size.height - 240,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  buildbigCard("assets/images.icecoffe.jpg", "Ice Coffe",
                      "\$ 2.99", "Latte Hard Coffee"),
                  buildbigCard("assets/images.icecoffe.jpg", "Ice Coffe",
                      "\$ 2.99", "Latte Hard Coffee"),
                  buildbigCard("assets/images.icecoffe.jpg", "Ice Coffe",
                      "\$ 2.99", "Latte Hard Coffee"),
                  buildbigCard("assets/images.icecoffe.jpg", "Ice Coffe",
                      "\$ 2.99", "Latte Hard Coffee"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  buildbigCard(String imagepath, name, price, desc) {
    return Column(
      children: [
        Container(
            margin: EdgeInsets.only(
              top: 10,
              left: 15,
              right: 15,
            ),
            width: 300,
            height: 500,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 300,
                  width: 300,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/images/icecoffee.jpg"))),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        desc,
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey[400],
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        name,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.teal,
                        ),
                      ),
                      SizedBox(height: 20),
                      Divider(
                        color: Colors.grey[400],
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            price,
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          ),
                          Icon(
                            Icons.add_circle_outline_outlined,
                            color: Colors.grey[400],
                            size: 30,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            )),
      ],
    );
  }

  buildCardTile(int number, String productName) {
    return Stack(
      children: [
        AnimatedContainer(
            duration: Duration(milliseconds: 500),
            curve: Curves.easeIn,
            width: 180,
            height: 120,
            margin: EdgeInsets.only(left: 10),
            padding: EdgeInsets.only(left: 20, bottom: 10),
            decoration: BoxDecoration(
              color: switchTileColor(productName),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: switchTileShadowColor(productName),
                  blurRadius: 10,
                  offset: Offset(-5, 8),
                ),
              ],
            ),
            child: InkWell(
              onTap: () {
                selectedproduct(productName);
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Text(
                    number.toString(),
                    style: TextStyle(
                      color: switchTextColor(productName),
                      fontSize: 30,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    productName,
                    style: TextStyle(
                      color: switchTextColor(productName),
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 5),
                ],
              ),
            )),
      ],
    );
  }

  selectedproduct(prodName) {
    setState(() {
      itemSelected = prodName;
    });
  }

  switchTileColor(prodName) {
    if (itemSelected == prodName) {
      return Colors.teal;
    } else {
      return Colors.grey.withOpacity(0.5);
    }
  }

  switchTileShadowColor(prodName) {
    if (itemSelected == prodName) {
      return Colors.teal[200];
    } else {
      return Colors.transparent;
    }
  }

  switchTextColor(prodName) {
    if (itemSelected == prodName) {
      return Colors.white;
    } else {
      return Colors.black;
    }
  }
}
