import 'package:aplikasi_scan/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:aplikasi_scan/theme.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
      resizeToAvoidBottomInset: false,  
        backgroundColor: Colors.white,
        body: Container(
            padding: EdgeInsets.all(20),
            child: SafeArea(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  Row(
                    children: [
                      Image.asset(
                        "assets/images/document_logo.png",
                        height: 40,
                        width: 40,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 15),
                      ),
                      Text(
                        "Scanner App",
                        style: text,
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 80),
                  ),
                  Text(
                    "Login",
                    style: title,
                  ),
                  // Container(
                  //   padding: const EdgeInsets.all(10),
                  //   child: TextField(
                  //     controller: passwordController,
                  //     decoration: const InputDecoration(
                  //       border: ,
                  //       labelText: 'Password',
                  //     ),
                  //   ),
                  // ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
                    child: TextFormField(
                      cursorColor: Color(0x1a34395E),
                      controller: nameController,
                      keyboardType: TextInputType.emailAddress,
                      autofocus: false,
                      decoration: InputDecoration(
                        icon: Icon(Icons.email), iconColor: purple,
                        hintText: 'email',
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 30),
                    child: TextFormField(
                      cursorColor: Color(0x1a34395E),
                      controller: passwordController,
                      obscureText: true,
                      autofocus: false,
                      decoration: InputDecoration(
                        icon: Icon(Icons.key),iconColor: purple,
                        hintText: 'password',
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      const Text("Dont have an account?", style: TextStyle(fontSize: 16),),
                      Text(" Create One", style: TextStyle(color: purple, fontSize: 16,))
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    height: 50,
                    width: 500,
                    child: TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: const Color(0xFF6777EF),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          )),
                      // onPressed: () {},
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage()),
                        );
                      },
                      child: const Text(
                        "Sign In",
                        style: TextStyle(
                          color: Color(0xffffffff),
                        ),
                      ),
                    ),
                  ),
                ]))));
  }
}