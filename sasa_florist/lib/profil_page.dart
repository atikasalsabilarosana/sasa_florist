import 'package:flutter/material.dart';
import 'package:sasa_florist/model/user.dart';
import 'package:sasa_florist/signin_page.dart';

class ProfilPage extends StatefulWidget {
  final User user;
  const ProfilPage({super.key, required this.user});

  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  TextEditingController controllerImgUrl = TextEditingController();
  TextEditingController controllerNama = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerAddress = TextEditingController();
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
                                NetworkImage(widget.user.imgUrl),
                                radius: 50,
                          ),
                        SizedBox(height: 10),
                        Padding(padding: EdgeInsets.only(left: 160),
                        child: 
                        Row(
                          children: [
                            Text("Welcome ", 
                            style: 
                            TextStyle(fontSize: 16, 
                            fontWeight: FontWeight.w500
                            )
                            ),
                        Text(widget.user.nama, style: TextStyle(
                            fontFamily: 'Poppins Bold',
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          )),
                          ],
                          ),
                          ),
                       ],
                       
                     ),
                    ),
                    SizedBox(height:50),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                                Icons.person,
                                color: Colors.grey,
                                size: 24.0,
                              ),
                           Text("   Nama :  ", style: TextStyle(
                                fontFamily: 'Poppins Bold',
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              )),
                          Text(widget.user.nama, style: TextStyle(
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
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                    Icons.email,
                                    color: Colors.grey,
                                    size: 24.0,
                                  ),
                              Text("   Email :  ", style: TextStyle(
                                    fontFamily: 'Poppins Bold',
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                  )),
                              Text(widget.user.email, style: TextStyle(
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
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                    Icons.home_filled,
                                    color: Colors.grey,
                                    size: 24.0,
                                  ),
                              Text("   Address :  ", style: TextStyle(
                                    fontFamily: 'Poppins Bold',
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                  )),
                              Text(widget.user.address, style: TextStyle(
                                fontFamily: 'Poppins Bold',
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              )),
                              ],
                              ),
                              ),
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
                          )  ;
                    }
                  }
          
        
      
      
      
    
  
