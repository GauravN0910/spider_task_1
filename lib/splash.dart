import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:spider_task_1/main.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  void initState() {
    super.initState();
    goHome();
  }

  void goHome() async {
    await Future.delayed(Duration(milliseconds: 3000),(){});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MyHomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height:100,
                width:100,
                decoration: BoxDecoration(
                  borderRadius:BorderRadius.circular(20),
                  image: DecorationImage(
                    image: AssetImage('Images/icon.png'),
                  )
                ),
              ),
              SizedBox(height: 20),
              Text('Spider 1',style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white))
            ],
          )
        )
      )
    );
  }
}