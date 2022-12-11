import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'dart:async';
import 'package:sasa_florist/home_page.dart';
import 'package:sasa_florist/signin_page.dart';

class Splash extends StatefulWidget{
  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        color: Color.fromARGB(255, 240, 237, 237),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: <Widget>[
              SizedBox(height: 100),
              Expanded(
                flex: 1,
                child: Column(
                  children: <Widget>[
                     Padding(
                       padding: const EdgeInsets.only(left:80),
                       child: const Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "SASA",
                          style: TextStyle(
                            color: Color.fromARGB(255, 10, 195, 232),
                            fontSize: 60,
                            fontFamily: 'Poppins Light',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                    ),
                     ),
                    SizedBox(height: 0),
                    Padding(
                       padding: const EdgeInsets.only(right:100),
                       child: const Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          "FLORIST",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontFamily: 'Poppins Light',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                    ),
                     ),
                    SizedBox(height: 70),
                    Image.asset('assets/images/splash.png', height: 242.91, width: 350),
                    SizedBox(height: 25),
                    Text("In joy and sorrow, flowers are our \n faithhful friends",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Poppins Light',
                      fontSize: 18,
                      color: Colors.black,
                    )),
                    SizedBox(height: 80),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: Column(
                        children: <Widget>[
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Color.fromARGB(255, 10, 195, 232),
                              minimumSize: const Size.fromHeight(55),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            onPressed: (){
                              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>SignIn(),));
                            }, 
                            child: Text("Get Started",
                            style: TextStyle(
                              fontFamily: 'Poppins Bold',
                              fontSize: 25,
                              color: Color.fromARGB(255, 117, 115, 115),
                              fontWeight: FontWeight.w500
                            )),
                          ),   
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}