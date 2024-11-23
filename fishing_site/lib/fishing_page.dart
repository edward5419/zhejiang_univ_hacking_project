// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:fishing_site/black_box_mobile.dart';
import 'package:flutter/material.dart';

import 'black_box_pc.dart';

class FishingPage extends StatelessWidget {
  FishingPage({Key? key}) : super(key: key);

  final TextEditingController _idController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset('assets/background.jpg', fit: BoxFit.cover),
          Positioned(
              right: 10,
              top: 10,
              child: Text(
                '中文|english',
                style: TextStyle(
                    fontSize: 14, color: Color.fromRGBO(51, 122, 183, 1)),
              )),
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            bottom: -100,
            child: Center(
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  if (constraints.maxWidth >= 770) {
                    return BlackBoxPc(
                      idController: _idController,
                      passwordController: _passwordController,
                    );
                  } else {
                    return BlackBoxMobile(
                        idController: _idController,
                        passwordController: _passwordController);
                  }
                },
              ),
            ),
          ),
          LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              if (constraints.maxWidth >= 1440) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 190,
                    ),
                    Image.asset(
                      'assets/cas_logo.png',
                      width: 482.43,
                      height: 69.99,
                    ),
                  ],
                );
              } else {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 50,
                    ),
                    Image.asset(
                      'assets/cas_logo.png',
                      width: 482.43,
                      height: 69.99,
                    ),
                  ],
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
