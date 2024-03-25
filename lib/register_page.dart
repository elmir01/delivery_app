import 'package:delivery_app/firebase_auth_implementation/firebase_auth_services.dart';
import 'package:delivery_app/login_page.dart';
import 'package:flutter/material.dart';
import 'package:material_text_fields/material_text_fields.dart';
import 'package:material_text_fields/utils/form_validation.dart';
import 'package:textfields/textfields.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final FirebaseAuthService _auth = FirebaseAuthService();
  // final _auth = FirebaseAuth.instance;
  late String username;
  late String password;
  String selectedCountryCode = "+994";
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerUsername = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  late bool _passwordVisible;
  void initState() {
    _passwordVisible = false;
  }

  void dispose() {
    _controllerName.dispose();
    _controllerUsername.dispose();
    _controllerEmail.dispose();
    _controllerPassword.dispose();
    super.dispose();
  }

  void _signUp() async {
    String name = _controllerName.text;
    String username = _controllerUsername.text;
    String email = _controllerEmail.text;
    String password = _controllerPassword.text;
    User? user = await _auth.signUpWithEmailAndPassword(email, password);
    if (user != null) {
      print('User is succesfully created');
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Please enter correct information.'),
            backgroundColor: Colors.white,
            actions: <Widget>[
              TextButton(
                child: Text(
                  'Close',
                  style: TextStyle(color: Colors.blue),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
      print('Somer error happened');
    }
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: MaterialTextField(
                keyboardType: TextInputType.name,
                hint: 'Name',
                textInputAction: TextInputAction.next,
                prefixIcon: const Icon(Icons.person_pin_sharp),
                controller: _controllerUsername,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: MaterialTextField(
                keyboardType: TextInputType.emailAddress,
                hint: 'Email',
                textInputAction: TextInputAction.next,
                prefixIcon: const Icon(Icons.email_outlined),
                controller: _controllerEmail,
                validator: FormValidation.emailTextField,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: MaterialTextField(
                keyboardType: TextInputType.name,
                hint: 'Username',
                textInputAction: TextInputAction.next,
                prefixIcon: const Icon(Icons.person),
                controller: _controllerUsername,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: MaterialTextField(
                keyboardType: TextInputType.emailAddress,
                hint: 'Password',
                textInputAction: TextInputAction.done,
                obscureText: !_passwordVisible,
                // theme: FilledOrOutlinedTextTheme(
                //   // fillColor: Colors.green.withAlpha(50),
                //   radius: 12,
                // ),
                prefixIcon: Icon(Icons.lock),
                suffixIcon: IconButton(
                  icon: Icon(
                    _passwordVisible ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _passwordVisible = !_passwordVisible;
                    });
                  },
                ),
                controller: _controllerPassword,
                validator: FormValidation.requiredTextField,
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
                      _signUp();
                      CollectionReference collRef = FirebaseFirestore.instance
                          .collection('clientRegister');
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
      ),
    );
  }
}
