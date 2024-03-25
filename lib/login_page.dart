import 'package:delivery_app/firebase_auth_implementation/firebase_auth_services.dart';
import 'package:delivery_app/main_page.dart';
import 'package:delivery_app/register_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:material_text_fields/material_text_fields.dart';
import 'package:material_text_fields/utils/form_validation.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

// final _auth = FirebaseAuth.instance;

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseAuthService _auth = FirebaseAuthService();

  late String username;
  late String password;
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  late bool _passwordVisible;
  void initState() {
    _passwordVisible = false;
  }

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
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    super.dispose();
  }

  void _signIn() async {
    String email = _controller1.text;
    String password = _controller2.text;
    User? user = await _auth.signInWithEmailAndPassword(email, password);
    if (user != null) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MainPage()),
      );
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ZWOLT'),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(children: [
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
            child: MaterialTextField(
              keyboardType: TextInputType.emailAddress,
              hint: 'Email',
              textInputAction: TextInputAction.next,
              prefixIcon: const Icon(Icons.email_outlined),
              controller: _controller1,
              validator: FormValidation.emailTextField,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0) +
                EdgeInsets.only(top: 30, bottom: 30),
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
              controller: _controller2,
              validator: FormValidation.requiredTextField,
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
                      onPressed: () async {
                        _signIn();
                        // loginUser(username, password);
                        CollectionReference collRef = FirebaseFirestore.instance
                            .collection('clientLogin');
                        collRef.add({
                          'Email': _controller1.text,
                          'Password': _controller2.text
                        });
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
      ),
    );
  }
}
