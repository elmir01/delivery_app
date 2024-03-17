import 'package:delivery_app/order_page.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class OrderAbout extends StatelessWidget {
  const OrderAbout({super.key});
  final burgerImage1 =
      'https://onehotoven.com/wp-content/uploads/2023/07/cast-iron-burgers-5.jpg';
  final burgerImage2 =
      'https://www.allrecipes.com/thmb/5JVfA7MxfTUPfRerQMdF-nGKsLY=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/25473-the-perfect-basic-burger-DDMFS-4x3-56eaba3833fd4a26a82755bcd0be0c54.jpg';
  final burgerImage3 =
      'https://static01.nyt.com/images/2023/05/25/multimedia/SS-Smashburger-update-vzhf/SS-Smashburger-update-vzhf-superJumbo.jpg';
  final burgerSubtitleText = 'Burger and fries';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.favorite_outline,
                size: 30,
                color: Colors.black,
              ))
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: CarouselSlider(
                    options: CarouselOptions(height: 300.0),
                    items: [burgerImage1, burgerImage2, burgerImage3].map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return ClipOval(
                            child: Image.network(
                              i,
                              fit: BoxFit.cover,
                              width: 300,
                              height: 300,
                            ),
                          );
                        },
                      );
                    }).toList(),
                  )),
            ),
          ),
          Expanded(
            child: Container(
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                      burgerSubtitleText,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      "7.50\$",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      child: Text(
                        'Delivery info',
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      alignment: Alignment.centerLeft,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      DeliveryInfo().infoText,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  SizedBox(height: 60.0),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => OrderPage()));
                    },
                    child: Text(
                      'Add to cart',
                      style: TextStyle(color: Colors.black),
                    ),
                    style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        side: BorderSide(width: 2, color: Colors.black)),
                  )
                ],
              ),
              width: 390,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(30)),
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DeliveryInfo {
  final infoText =
      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.';
}
