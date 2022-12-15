import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sasa_florist/home_page.dart';
import 'package:sasa_florist/model/user.dart';
import 'package:sasa_florist/signup_page.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPass = TextEditingController();
  void login(String email, password) async {
      try {
          //print("Login tess");
        var response = await Dio().get('http://192.168.40.1:3000/user?email=' +
            email +
            '&password=' +
            password);
            print("Login tess");
        if (response.data.length > 0) {
          int id = response.data?[0]['id'];
          String nama = response.data?[0]['nama'];
          String imgUrl= response.data?[0]['imgUrl'];
          String email = response.data?[0]['email'];
          String password = response.data?[0]['password'];
          String address= response.data?[0]['address'];

          print("Login success");
          Navigator.push( context, MaterialPageRoute(builder: (context) => HomePage(user: User(id: id, nama: nama, imgUrl: imgUrl, email: email, password: password, address: address),)));
        } else {
          final snackBar = SnackBar(
            backgroundColor: Colors.redAccent,
            content: Text(
              'Invalid email or password',
              style: TextStyle(
                fontFamily: 'Poppins-Regular',
                color: Colors.white,
              ),
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      } catch (e) {
        final snackBar = SnackBar(
          backgroundColor: Colors.redAccent,
          content: Text(
            'invalid username or password',
            style: TextStyle(
              fontFamily: 'Poppins-Regular',
              color: Colors.white,
            ),
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 240, 237, 237),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: <Widget>[
            SizedBox(height: 120),
            Column(
              children: <Widget>[
                Text("Welcome Sasa Florist", style: TextStyle(
                  fontFamily: 'Poppins Bold',
                  fontSize: 23,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                )),
                SizedBox(height: 30),
                Image.asset('assets/images/login.png', height: 188.82, width: 250),
                SizedBox(height: 35),
                Padding(
                  padding: const EdgeInsets.only(right: 10, left: 10),
                  child: TextField(
                    controller: controllerEmail,
                    style: const TextStyle(
                      fontFamily: 'Poppins Light',
                      fontSize: 16,
                    ),
                    decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                      fillColor: Colors.white,
                      filled: true,
                      labelText: "Enter your email",
                      hintText: "Enter your email",
                      contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                      hintStyle: const TextStyle(
                        fontFamily: 'Poppins Light',
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 18),
                Padding(
                  padding: const EdgeInsets.only(right: 10, left: 10),
                  child: TextField(
                    controller: controllerPass,
                    style: const TextStyle(
                      fontFamily: 'Poppins Light',
                      fontSize: 16,
                    ),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                      fillColor: Colors.white,
                      filled: true,
                      labelText: "Confirm password",
                      hintText: "Confirm password",
                      contentPadding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                      hintStyle: const TextStyle(
                        fontFamily: 'Poppins Light',
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 70),
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
                          login(controllerEmail.text, controllerPass.text);
                        }, 
                        child: Text("Sign In",
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
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?",
                        style: TextStyle(
                          fontFamily: 'Poppins Light',
                          fontSize: 16,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500
                        )),
                    SizedBox(width: 3),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => SignUp()),
                        );
                      },
                      child: const Text("Sign up",
                          style: TextStyle(
                            fontFamily: 'Poppins Light',
                            fontSize: 16,
                            color: Color.fromARGB(255, 10, 195, 232),
                          )),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}