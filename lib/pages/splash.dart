import 'package:aplikasi_scan/pages/login_page.dart';
import 'package:aplikasi_scan/theme.dart';
import 'package:flutter/material.dart';

class Splash extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  Container(
                    padding: EdgeInsets.only(top: 40, bottom: 20),
                    child: Image.asset("assets/images/undraw_splash.png"),
                  ),
                  Text("Get Started", style: desc),
                  Text("Lets Secure Your Important Documents", style: title),
                  Padding(padding: EdgeInsets.only(top: 30)),
                  Container(
                    height: 50,
                    width: 500,
                    child: TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: Color(0xFF6777EF),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          )),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPage(),
                            // authBloc: authBloc,
                          ),
                        );
                      },
                      child: Text(
                        "Next",
                        style: TextStyle(
                          color: Color(0xffffffff),
                        ),
                      ),
                    ),
                  ),
                ]))));
  }
}
