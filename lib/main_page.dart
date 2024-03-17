import 'package:delivery_app/history_page.dart';
import 'package:delivery_app/order_about.dart';
import 'package:delivery_app/order_page.dart';
import 'package:delivery_app/profile_page.dart';
import 'package:delivery_app/settings_page.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});
  final mainAccesText = 'Delicious\nfood for you';
  final foodText = 'Foods';
  final drinksText = 'Drinks';
  final snacksText = 'Snacks';
  final sweetsText = 'Sweets';
  final seemoreText = 'See more';
  final burgerImage =
      'https://onehotoven.com/wp-content/uploads/2023/07/cast-iron-burgers-5.jpg';
  final caserSaladImage =
      'https://www.allrecipes.com/thmb/mXZ0Tulwn3x9_YB_ZbkiTveDYFE=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/229063-Classic-Restaurant-Caesar-Salad-ddmfs-4x3-231-89bafa5e54dd4a8c933cf2a5f9f12a6f.jpg';
  final caserSaladText = 'Classic Caesar Salad';
  final burgerSubtitleText = 'Burger and fries';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SettingsPage()));
                  },
                  iconSize: 30,
                  color: Colors.black,
                ),
                Spacer(),
                IconButton(
                  icon: Icon(
                    Icons.shopping_cart,
                    size: 28,
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => OrderPage()));
                  },
                  color: Colors.black,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 180),
            child: Text(
              mainAccesText,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              textAlign: TextAlign.left,
            ),
          ),
          SizedBox(height: 20),
          TextFields(),
          SizedBox(
            height: 70,
          ),
          MenuRows(
              foodText: foodText,
              drinksText: drinksText,
              snacksText: snacksText,
              sweetsText: sweetsText),
          SizedBox(height: 20),
          SeeMoreButtonRow(seemoreText: seemoreText),
          SizedBox(
            height: 20,
          ),
          FoodItemsRow(
              burgerImage: burgerImage,
              burgerSubtitleText: burgerSubtitleText,
              caserSaladImage: caserSaladImage,
              caserSaladText: caserSaladText),
          Spacer(flex: 1),
          Expanded(flex: 1, child: BottomRowIcons())
        ],
      ),
    );
  }
}

class FoodItemsRow extends StatelessWidget {
  const FoodItemsRow({
    super.key,
    required this.burgerImage,
    required this.burgerSubtitleText,
    required this.caserSaladImage,
    required this.caserSaladText,
  });

  final String burgerImage;
  final String burgerSubtitleText;
  final String caserSaladImage;
  final String caserSaladText;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 4),
          child: Container(
            width: 190,
            height: 290,
            decoration: BoxDecoration(
                border: Border.all(width: 3),
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: ListTile(
                title: ClipOval(
                  child: Image.network(
                    burgerImage,
                    fit: BoxFit.cover,
                    width: 60,
                    height: 150,
                  ),
                ),
                subtitle: Column(children: [
                  Container(
                    child: Text(
                      burgerSubtitleText,
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    '7.50\$',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.red,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OrderAbout()));
                    },
                    child: Text(
                      'Order',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    style: ElevatedButton.styleFrom(
                      side: BorderSide(width: 2, color: Colors.black),
                      backgroundColor: Colors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7),
                      ),
                    ),
                  )
                ])),
          ),
        ),
        ////////////////////////////////////////////////////////////////////////////////////////////

        Padding(
          padding: const EdgeInsets.only(left: 4),
          child: Container(
            width: 190,
            height: 290,
            decoration: BoxDecoration(
                border: Border.all(width: 3),
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: ListTile(
                title: ClipOval(
                  child: Image.network(
                    caserSaladImage,
                    fit: BoxFit.cover,
                    width: 60,
                    height: 150,
                  ),
                ),
                subtitle: Column(children: [
                  Container(
                    child: Text(
                      caserSaladText,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 14.75, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    '5.00\$',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.red,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Order',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      side: BorderSide(width: 2, color: Colors.black),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7),
                      ),
                    ),
                  )
                ])),
          ),
        )
      ],
    );
  }
}

class SeeMoreButtonRow extends StatelessWidget {
  const SeeMoreButtonRow({
    super.key,
    required this.seemoreText,
  });

  final String seemoreText;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Spacer(
          flex: 3,
        ),
        Expanded(
            flex: 1,
            child: InkWell(
                onTap: () {},
                child: Text(
                  seemoreText,
                  style: TextStyles().seeMoreStyle,
                ))),
      ],
    );
  }
}

class MenuRows extends StatelessWidget {
  const MenuRows({
    super.key,
    required this.foodText,
    required this.drinksText,
    required this.snacksText,
    required this.sweetsText,
  });

  final String foodText;
  final String drinksText;
  final String snacksText;
  final String sweetsText;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Spacer(),
        Expanded(
            flex: 2,
            child: InkWell(
              onTap: () {},
              child: Text(
                foodText,
                style: TextStyles().horizontalMenuTexts,
              ),
            )),
        Expanded(
            flex: 2,
            child: InkWell(
              onTap: () {},
              child: Text(drinksText),
            )),
        Expanded(
            flex: 2,
            child: InkWell(
              onTap: () {},
              child: Text(snacksText),
            )),
        Expanded(
            flex: 2,
            child: InkWell(
              onTap: () {},
              child: Text(sweetsText),
            )),
      ],
    );
  }
}

class BottomRowIcons extends StatelessWidget {
  const BottomRowIcons({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: IconButton(
            onPressed: () {},
            icon: Icon(Icons.home),
            iconSize: 35,
            color: Colors.black,
          ),
        ),
        Expanded(
          flex: 2,
          child: IconButton(
            onPressed: () {},
            icon: Icon(Icons.favorite_outline),
            iconSize: 35,
            color: Colors.black,
          ),
        ),
        Expanded(
          flex: 2,
          child: IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProfilePage()));
            },
            icon: Icon(Icons.person),
            iconSize: 35,
            color: Colors.black,
          ),
        ),
        Expanded(
          flex: 2,
          child: IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HistoryPAge()));
            },
            icon: Icon(Icons.history),
            iconSize: 35,
            color: Colors.black,
          ),
        )
      ],
    );
  }
}

class SizedBoxHeights {}

class Buttons {
  final Icon searchIcon = Icon(Icons.search);
}

class TextStyles {
  final TextStyle horizontalMenuTexts =
      TextStyle(fontWeight: FontWeight.bold, fontSize: 17);
  final TextStyle seeMoreStyle =
      TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 12);
}

class TextFields extends StatelessWidget {
  const TextFields({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 300,
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: Buttons().searchIcon,
          labelText: 'Search',
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              borderSide: BorderSide(color: Colors.red)),
        ),
      ),
    );
  }
}
