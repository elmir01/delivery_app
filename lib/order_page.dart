import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class OrderPage extends StatelessWidget {
  OrderPage({super.key});
  final caserSaladText = 'Classic Caesar Salad';
  final burgerImage =
      'https://onehotoven.com/wp-content/uploads/2023/07/cast-iron-burgers-5.jpg';
  final caserSaladImage =
      'https://www.allrecipes.com/thmb/mXZ0Tulwn3x9_YB_ZbkiTveDYFE=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/229063-Classic-Restaurant-Caesar-Salad-ddmfs-4x3-231-89bafa5e54dd4a8c933cf2a5f9f12a6f.jpg';
  final double burgerPrice = 7.50;
  final double caserSaladPrice = 5.50;
  final ValueNotifier<double> _totalPrice = ValueNotifier<double>(20.5);
  final ValueNotifier<int> _counter1 = ValueNotifier<int>(1);

  void _incrementCounter1() {
    _counter1.value++;
    _updateTotalPrice();
  }

  void _decrementCounter1() {
    if (_counter1.value > 1) {
      _counter1.value--;
      _updateTotalPrice();
    }
  }

  final ValueNotifier<int> _counter2 = ValueNotifier<int>(1);

  void _incrementCounter2() {
    _counter2.value++;
    _updateTotalPrice();
  }

  void _decrementCounter2() {
    if (_counter2.value > 1) {
      _counter2.value--;
      _updateTotalPrice();
    }
  }

  final ValueNotifier<int> _counter3 = ValueNotifier<int>(1);

  void _incrementCounter3() {
    _counter3.value++;
    _updateTotalPrice();
  }

  void _decrementCounter3() {
    if (_counter3.value > 1) {
      _counter3.value--;
      _updateTotalPrice();
    }
  }

  void _updateTotalPrice() {
    _totalPrice.value = (_counter1.value * burgerPrice +
        _counter2.value * caserSaladPrice +
        _counter3.value * burgerPrice);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Order')),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Center(
              child: Column(
                children: [
                  Container(
                    height: 120,
                    width: 250,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Column(
                      children: [
                        ListTile(
                            title: Text('Burger and fries'),
                            subtitle: Container(
                              child: Text(
                                '$burgerPrice\$',
                                style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            leading: ClipOval(
                              child: Image.network(
                                burgerImage,
                                width: 70,
                                height: 160,
                                fit: BoxFit.cover,
                              ),
                            )),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                icon: Icon(Icons.remove),
                                onPressed: _decrementCounter1,
                              ),
                              ValueListenableBuilder(
                                valueListenable: _counter1,
                                builder: (context, value, child) {
                                  return Text('$value',
                                      style: TextStyle(fontSize: 20));
                                },
                              ),
                              IconButton(
                                icon: Icon(Icons.add),
                                onPressed: _incrementCounter1,
                              ),
                            ])
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
/////--------------------////////////////////////////--------------------------/////////////////

          Expanded(
            flex: 1,
            child: Center(
              child: Column(
                children: [
                  Container(
                    height: 120,
                    width: 250,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Column(
                      children: [
                        ListTile(
                            title: Text(
                              caserSaladText,
                              style: TextStyle(fontSize: 12.3),
                            ),
                            subtitle: Container(
                              child: Text(
                                '$caserSaladPrice\$',
                                style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            leading: ClipOval(
                              child: Image.network(
                                caserSaladImage,
                                width: 70,
                                height: 160,
                                fit: BoxFit.cover,
                              ),
                            )),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                icon: Icon(Icons.remove),
                                onPressed: _decrementCounter2,
                              ),
                              ValueListenableBuilder(
                                valueListenable: _counter2,
                                builder: (context, value, child) {
                                  return Text('$value',
                                      style: TextStyle(fontSize: 20));
                                },
                              ),
                              IconButton(
                                icon: Icon(Icons.add),
                                onPressed: _incrementCounter2,
                              ),
                            ])
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          //////--------------------------//////////////
          Expanded(
            flex: 2,
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      height: 120,
                      width: 250,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Column(
                        children: [
                          ListTile(
                              title: Text('Burger and fries'),
                              subtitle: Container(
                                child: Text(
                                  '$burgerPrice\$',
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              leading: ClipOval(
                                child: Image.network(
                                  burgerImage,
                                  width: 70,
                                  height: 160,
                                  fit: BoxFit.cover,
                                ),
                              )),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                  icon: Icon(Icons.remove),
                                  onPressed: _decrementCounter3,
                                ),
                                ValueListenableBuilder(
                                  valueListenable: _counter3,
                                  builder: (context, value, child) {
                                    return Text('$value',
                                        style: TextStyle(fontSize: 20));
                                  },
                                ),
                                IconButton(
                                  icon: Icon(Icons.add),
                                  onPressed: _incrementCounter3,
                                ),
                              ])
                        ],
                      ),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.favorite_border_rounded,
                          size: 40,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.delete,
                          size: 40,
                        ))
                  ],
                ),
              ],
            ),
          ),
          ValueListenableBuilder<double>(
            valueListenable: _totalPrice,
            builder: (context, value, child) {
              return Text('Total price: \$${value}',
                  style: TextStyle(fontSize: 20));
            },
          ),

          Expanded(
            flex: 1,
            child: Column(
              children: [
                OutlinedButton(
                  onPressed: () {},
                  child: Text(
                    'Complete order',
                  ),
                  style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.orangeAccent),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
