import 'package:delivery_app/login_page.dart';
import 'package:delivery_app/order_page.dart';
import 'package:delivery_app/profile_page.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: Column(children: [
        Column(
          children: [
            SizedBox(
              height: 20,
            ),
            ListTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => ProfilePage())));
              },
              leading: Icon(
                Icons.person,
                size: 45,
                color: Colors.black,
              ),
              title: Text('Profile'),
            ),
            SizedBox(
              height: 2,
              width: 310,
              child: DecoratedBox(
                  decoration: BoxDecoration(color: Colors.blueGrey)),
            ),
            SizedBox(
              height: 20,
            ),
            ListTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => OrderPage()));
              },
              leading: Icon(
                Icons.shopping_cart,
                size: 45,
                color: Colors.black,
              ),
              title: Text('Orders'),
            ),
            SizedBox(
              height: 2,
              width: 310,
              child: DecoratedBox(
                  decoration: BoxDecoration(color: Colors.blueGrey)),
            ),
            SizedBox(
              height: 20,
            ),
            ListTile(
              onTap: () {},
              leading: Icon(
                Icons.contact_support_outlined,
                size: 45,
                color: Colors.black,
              ),
              title: Text('Supports'),
            ),
            SizedBox(
              height: 2,
              width: 310,
              child: DecoratedBox(
                  decoration: BoxDecoration(color: Colors.blueGrey)),
            ),
            SizedBox(
              height: 20,
            ),
            ListTile(
              onTap: () {},
              leading: Icon(
                Icons.privacy_tip_outlined,
                size: 45,
                color: Colors.black,
              ),
              title: Text('Privacy Policy'),
            ),
            SizedBox(
              height: 2,
              width: 310,
              child: DecoratedBox(
                  decoration: BoxDecoration(color: Colors.blueGrey)),
            ),
            SizedBox(
              height: 20,
            ),
            ListTile(
              onTap: () {},
              leading: Icon(
                Icons.security_outlined,
                size: 45,
                color: Colors.black,
              ),
              title: Text('Security'),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
        SizedBox(height: 140),
        SizedBox(
          width: 200,
          height: 50,
          child: OutlinedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginScreen()));
            },
            child: Text(
              'Log out',
              style: TextStyle(fontSize: 19, color: Colors.black),
            ),
            style: OutlinedButton.styleFrom(
              backgroundColor: Colors.red,
            ),
          ),
        )
      ]),
    );
  }
}
