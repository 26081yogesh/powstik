import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:powstik/Authentication/auth_function.dart';
import 'package:powstik/Product/product_screen.dart';
import 'signup.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String email = "";
  String password = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsFlutterBinding.ensureInitialized();
    Firebase.initializeApp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Authentication"),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(15),
              child: TextField(
                onChanged: (value) {
                  email = value;
                },
                decoration: InputDecoration(
                  hintText: "Email",
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: TextField(
                onChanged: (value) {
                  password = value;
                },
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Password",
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(15),
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  if (await signin(email, password) == false) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return ProductListScreen();
                    }));
                  } else {}
                },
                child: Text('Log In'),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Signup();
                }));
              },
              child: Text("Create Account"),
            ),
          ],
        ),
      ),
    );
  }
}
