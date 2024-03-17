import 'package:delivery_app/login_page.dart';
import 'package:flutter/material.dart';
import 'package:textfields/textfields.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  late String username;
  late String password;
  String selectedCountryCode = "+994";
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerUsername = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  void _registerButtonPressed(BuildContext context) {
    if (_controllerName.text.isEmpty ||
        _controllerUsername.text.isEmpty ||
        _controllerEmail.text.isEmpty ||
        _controllerPassword.text.isEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Please fill in all fields.'),
            actions: <Widget>[
              TextButton(
                child: Text('Close'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    }
  }

  Future<void> registerUser(String username, String password) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: username,
        password: password,
      );
    } catch (e) {
      print("Hata: $e");
    }
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Register')),
      body: Column(
        children: [
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: BorderTextFieldWithIcon(
              controller: _controllerName,
              hintText: "Name",
              prefixIcon: Icon(
                Icons.people,
                // color: Colors.white,
              ),
              suffixIcon: Icon(
                Icons.email,
                // color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: BorderTextFieldWithIcon(
              hintText: 'E-mail',
              controller: _controllerEmail,
              prefixIcon: Icon(
                Icons.people,
                // color: Colors.white,
              ),
              suffixIcon: Icon(
                Icons.email,
                // color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: BorderTextFieldWithIcon(
              controller: _controllerUsername,
              hintText: 'Username',
              prefixIcon: Icon(
                Icons.people,
                // color: Colors.white,
              ),
              suffixIcon: Icon(
                Icons.email,
                // color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: BorderTextFieldWithIcon(
              hintText: 'Password',
              obscureText: true,
              controller: _controllerPassword,
              prefixIcon: Icon(
                Icons.people,
                // color: Colors.white,
              ),
              suffixIcon: Icon(
                Icons.password,
                // color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(
                  onPressed: () async {
                    _registerButtonPressed(context);
                    registerUser(username, password);
                    CollectionReference collRef =
                        FirebaseFirestore.instance.collection('clientRegister');
                    collRef.add({
                      'Username': _controllerUsername.text,
                      'Password': _controllerPassword.text,
                      'Email': _controllerEmail.text,
                      'Name': _controllerName.text
                    });
                  },
                  child: Text(
                    'Register',
                    style: TextStyle(fontSize: 20),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
