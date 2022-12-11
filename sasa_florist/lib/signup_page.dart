import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sasa_florist/signin_page.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController controllerNama = TextEditingController();
  TextEditingController controllerImage = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPass = TextEditingController();


  void register(String nama, image, email, password) async {
    try {
      var response = await Dio().post('http://192.168.40.1:3000/user',
          data: {"nama": nama,"imgUrl":image,"email": email, "password": password});
      if (response.statusCode == 201) {
        print("Account created successfully");
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignIn()));
      } else {
        print("Failed");
      }
    } catch (e) {
      print(e);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromARGB(255, 240, 237, 237),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: <Widget>[
              SizedBox(height: 120),
              Expanded(
                flex: 1,
                child: Column(
                  children: <Widget>[
                    Text("Welcome Sasa Florist", style: TextStyle(
                      fontFamily: 'Poppins Bold',
                      fontSize: 23,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    )),
                    SizedBox(height: 5),
                    Image.asset('assets/images/signup.png', height: 141, width: 178),
                    SizedBox(height: 18),
                    Text("Register with us", style: TextStyle(
                      fontFamily: 'Poppins Bold',
                      fontSize: 15,
                      color: Color.fromARGB(255, 10, 195, 232),
                      fontWeight: FontWeight.w500,
                    )),
                    SizedBox(height: 10),
                    Text("Your Information is safe with us", style: TextStyle(
                      fontFamily: 'Poppins Bold',
                      fontSize: 15,
                      color: Color.fromARGB(255, 113, 113, 113),
                      fontWeight: FontWeight.w500,
                    )),
                    SizedBox(height: 40),
                    Padding(
                      padding: const EdgeInsets.only(right: 10, left: 10),
                      child: TextField(
                        controller: controllerNama,
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
                          labelText: "Enter your name",
                          hintText: "Enter your name",
                          contentPadding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                          hintStyle: const TextStyle(
                            fontFamily: 'Poppins Light',
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(right: 10, left: 10),
                      child: TextField(
                        controller: controllerImage,
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
                          labelText: "Enter your link picture",
                          hintText: "Enter your link picture",
                          contentPadding:
                          const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                          hintStyle: const TextStyle(
                            fontFamily: 'Poppins Light',
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                     SizedBox(height: 10),
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
                          const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                          hintStyle: const TextStyle(
                            fontFamily: 'Poppins Light',
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                     SizedBox(height: 10),
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
                    SizedBox(height: 50),
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
                              register(controllerNama.text,controllerImage.text,controllerEmail.text,controllerPass.text);
                            }, 
                            child: Text("Sign Up",
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
                        const Text("Already have an account?",
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
                              MaterialPageRoute(builder: (context) => SignIn()),
                            );
                          },
                          child: const Text("Sign in",
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}