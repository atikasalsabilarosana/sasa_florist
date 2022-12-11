import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sasa_florist/signin_page.dart';

class ProfilPage extends StatefulWidget {
  const ProfilPage({super.key});

  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  @override
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
                        CircleAvatar(
                            backgroundImage:
                                NetworkImage('https://assets.kompasiana.com/items/album/2021/03/24/blank-profile-picture-973460-1280-605aadc08ede4874e1153a12.png?t=o&v=770'),
                                radius: 50,
                          ),
                        SizedBox(height: 10),
                        Center(child: Text("Welcome Salsa", 
                        style: 
                        TextStyle(fontSize: 16, 
                        fontWeight: FontWeight.w500
                        )
                        )
                        ),
                       ],
                     ),
                    ),
                    SizedBox(height:50),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Nama", style: TextStyle(
                            fontFamily: 'Poppins Bold',
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          )),
                          SizedBox(height: 30),
                          Text("Email", style: TextStyle(
                            fontFamily: 'Poppins Bold',
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          )),
                          SizedBox(height: 30),
                          Text("Addres", style: TextStyle(
                            fontFamily: 'Poppins Bold',
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          )),
                          SizedBox(height: 150),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>SignIn()));
                            },
                            child: const Text("Log Out",
                                style: TextStyle(
                                  fontFamily: 'Roboto-Bold',
                                  fontSize: 24,
                                )),
                            style: ElevatedButton.styleFrom(
                                primary: Color.fromARGB(255, 10, 195, 232),
                                minimumSize: const Size.fromHeight(55),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                )),
                          ),  
                              ],
                            ),
                          ),  
                      ],
                          ),
          );
                    }
                  }
          
        
      
      
      
    
  
