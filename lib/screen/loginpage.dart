import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_123210039_kuiz/screen/gamepage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";

  Widget _emailField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        enabled: true,
        onChanged: (value) {
          setState(() {
            email = value;
          });
        },
        decoration: InputDecoration(
          hintText: 'email',
          contentPadding: EdgeInsets.all(8.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8.0),
            ),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty || !value.contains('@')) {
            return 'Masukkan email yang valid';
          }
          return null;
        },
      ),
    );
  }

  Widget _passwordField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        obscureText: true,
        enabled: true,
        onChanged: (value) {
          setState(() {
            password = value;
          });
        },
        decoration: InputDecoration(
          hintText: 'Password',
          contentPadding: EdgeInsets.all(8.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8.0),
            ),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty || value.length < 8) {
            return 'Password harus lebih dari 8 karakter';
          }
          return null;
        },
      ),
    );
  }

  Widget _loginButton(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              if (email == "muhammadihsanuddin18092003@gmail.com" &&
                  password == "123210039") {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return GamesPage();
                }));
              } else {
                SnackBar snackBar = SnackBar(
                  content: Text("Email/password tidak sesuai"),
                  backgroundColor: Colors.red,
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
            }
          },
          child: const Text('Login')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Login Page"),
        ),
        body: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _emailField(),
              SizedBox(height: 10),
              _passwordField(),
              SizedBox(height: 10),
              _loginButton(context),
            ],
          ),
        ));
  }
}
