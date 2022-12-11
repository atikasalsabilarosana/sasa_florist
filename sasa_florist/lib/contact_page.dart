import 'package:flutter/material.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
   Widget build(BuildContext context) {
     return Scaffold(
       backgroundColor: Color.fromARGB(255, 242, 244, 244),
      body: Column(
                children: [
                    Container(
                    width: double.infinity,
                    height: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(0), bottomRight: Radius.circular(0)),
                      color: Colors.blue,
                    ),
                     child: Column(
                       children: [
                        SizedBox(height: 90),
                        Center(
                          child: Text("Contact Me!", 
                          style: 
                          TextStyle(fontSize: 25, 
                          fontWeight: FontWeight.w700,
                          color: Colors.black
                          )
                          )
                        ),
                        SizedBox(height: 20),
                        CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/images/splash.png'),
                                radius: 50,
                          ),
                       ],
                     ),
                    ),
                    SizedBox(height:50),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                color: Colors.grey,
                                size: 24.0,
                              ),
                              Text("   Jalan Seokarno Hatta", style: TextStyle(
                                fontFamily: 'Poppins Bold',
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              )),
                            ],
                          ),
                        ),
                        SizedBox(height: 30),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Row(
                            children: [
                              Icon(
                                Icons.phone,
                                color: Colors.grey,
                                size: 24.0,
                              ),
                              Text("   0874 3283 7459", style: TextStyle(
                                fontFamily: 'Poppins Bold',
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              )),
                            ],
                          ),
                        ),
                        SizedBox(height: 30),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Row(
                            children: [
                              Icon(
                                Icons.contact_phone,
                                color: Colors.grey,
                                size: 24.0,
                              ),
                              Text("   031 81267", style: TextStyle(
                                fontFamily: 'Poppins Bold',
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              )),
                            ],
                          ),
                        ),
                        SizedBox(height: 30),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Row(
                            children: [
                              Icon(
                                Icons.web_outlined,
                                color: Colors.grey,
                                size: 24.0,
                              ),
                              Text("   www.sasaflorist.com", style: TextStyle(
                                fontFamily: 'Poppins Bold',
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              )),
                            ],
                          ),
                        ),
                        SizedBox(height: 30),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Row(
                            children: [
                              Icon(
                                Icons.email,
                                color: Colors.grey,
                                size: 24.0,
                              ),
                              Text("   sasaflorist@gmail.com", style: TextStyle(
                                fontFamily: 'Poppins Bold',
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              )),
                            ],
                          ),
                        ),
                       
                            ],
                          ),  
                      ],
                          ),
          );
  }
}