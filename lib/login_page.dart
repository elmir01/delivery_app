import 'package:delivery_app/main_page.dart';
import 'package:delivery_app/register_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

// final _auth = FirebaseAuth.instance;

class _LoginScreenState extends State<LoginScreen> {
  late String username;
  late String password;
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();

  // Future<void> loginUser(String username, String password) async {
  //   try {
  //     await FirebaseAuth.instance.signInWithEmailAndPassword(
  //       username: username,
  //       password: password,
  //     );
  //   } catch (e) {
  //     print("Hata: $e");
  //   }
  // }

  // Future<Map<String, dynamic>> getUserInfo(String username) async {
  //   QuerySnapshot querySnapshot = await FirebaseFirestore.instance
  //       .collection('clientRegister')
  //       .where('username', isEqualTo: username)
  //       .get();

  //   if (querySnapshot.docs.isNotEmpty) {
  //     return querySnapshot.docs.first.data() as Map<String, dynamic>;
  //   } else {
  //     return null as Map<String, dynamic>;
  //   }
  // }

  // Future<void> loginUserWithCheck(String username, String password) async {
  //   // Kullanıcı bilgilerini Firestore'dan çek
  //   Map<String, dynamic> userInfo = await getUserInfo(username);

  //   if (userInfo != null && userInfo['password'] == password) {
  //     // Kullanıcı bilgileri doğru ise giriş yap
  //     await loginUser(username, password);
  //     print("Giriş başarılı!");
  //   } else {
  //     // Kullanıcı bilgileri yanlış ise hata mesajı göster
  //     print("Giriş başarısız! Kullanıcı adı veya şifre hatalı.");
  //   }
  // }

  void _loginButtonPressed(BuildContext context) {
    if (_controller1.text.isEmpty || _controller2.text.isEmpty) {
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
        MaterialPageRoute(builder: (context) => MainPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ZWOLT'),
        automaticallyImplyLeading: false,
      ),
      body: Column(children: [
        Center(
            child: Padding(
          padding: const EdgeInsets.all(8.0) + EdgeInsets.only(top: 30),
          child: Text(
            'Sign in',
            style: TextStyle(fontSize: 30),
          ),
        )),
        Padding(
          padding: const EdgeInsets.all(8.0) + EdgeInsets.only(top: 100),
          child: TextField(
              controller: _controller1,
              onChanged: (value) {
                username = value;
                //Do something with the user input.
              },
              decoration: InputDecoration(
                labelText: "Username",
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 2)),
              )),
        ),
        Padding(
          padding:
              const EdgeInsets.all(8.0) + EdgeInsets.only(top: 30, bottom: 30),
          child: TextField(
            controller: _controller2,
            obscureText: true,
            decoration: InputDecoration(
                labelText: "Password",
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 2))),
          ),
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0) +
                  EdgeInsets.only(top: 24) +
                  EdgeInsets.only(left: 80),
              child: SizedBox(
                  width: 200,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      _loginButtonPressed(context);
                      // loginUser(username, password);
                    },
                    child: Text(
                      'Log in',
                      style: TextStyle(fontSize: 20),
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0) +
                  EdgeInsets.only(
                    top: 100,
                  ),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RegistrationScreen()));
                },
                child: Text('Register'),
              ),
            )
          ],
        )
      ]),
    );
  }
}
