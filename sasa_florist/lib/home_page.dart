import 'package:flutter/material.dart';
import 'package:sasa_florist/contact_page.dart';
import 'package:sasa_florist/detail.dart';
import 'package:sasa_florist/favorite_page.dart';
import 'package:sasa_florist/model/bunga.dart';
import 'package:sasa_florist/profil_page.dart';
import 'package:sasa_florist/search.dart';
import 'package:sasa_florist/service/service_bunga.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
   void onTap(int index){
      setState(() {
        currentIndex = index;
      });
   }

   List pages = [
    HomeBody(),
    FavoritePage(),
    Search(),
    ProfilPage(),
    ContactPage()
   ];
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTap,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined, color: Colors.grey),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_outline, color: Colors.grey),
              label: 'Favorite'),
          BottomNavigationBarItem(
              icon: Icon(Icons.search_outlined, color: Colors.grey),
              label: 'Search'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outlined,
                  color: Colors.grey),
              label: 'Contact'),
          BottomNavigationBarItem(
              icon: Icon(Icons.phone, color: Colors.grey),
              label: 'Profile'),
              
        ],
        
        currentIndex: currentIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        elevation: 0,
      ),
      body: pages.elementAt(currentIndex),
    );
  }
}

class HomeBody extends StatelessWidget {
  const HomeBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 240, 237, 237),
          ),
        ),
        SingleChildScrollView(        
          child: Container(
            color: Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 40),
                   Padding(
                     padding: const EdgeInsets.only(right: 80, left: 100),
                     child: Text(
                            "SASA FLORIST",
                            style: TextStyle(
                              color: Color.fromARGB(255, 10, 195, 232),
                              fontSize: 23,
                              fontFamily: 'Poppins Light',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                   ),
                    SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.only(left: 140),
                          child: Text(
                            "PRODUCT",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontFamily: 'Poppins Light',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ), 
                  SizedBox(height: 10),
                  FutureBuilder<List<Bunga>>(
                    future: Service.getBunga(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        } else {
                          //memberikan kondisi apabila terjadi erorr 
                          if (snapshot.hasError) {
                            //mengembalikan teks apabila terjadi error
                            return Text(snapshot.error.toString());
                          } else {
                              return GridView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: snapshot.data?.length,
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 10,
                                ),
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Detail(bunga: Bunga(id: int.parse("${snapshot.data?[index].id}"), title: "${snapshot.data?[index].title}", harga: "${snapshot.data?[index].harga}", imgUrl: "${snapshot.data?[index].imgUrl}", desc: "${snapshot.data?[index].desc}", isFav: snapshot.data?[index].isFav as bool))));
                                    },
                                    child: FlowerCard(img: "${snapshot.data?[index].imgUrl}", title: "${snapshot.data?[index].title}", price: "${snapshot.data?[index].harga}"));
                                },
                              );
                          }
                        }
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class FlowerCard extends StatelessWidget {
  final String img, title, price;
  const FlowerCard({
    Key? key,
    required this.img,
    required this.title,
    required this.price
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: Column(
        children: [
          Container(
            height: 90,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(img),
                fit: BoxFit.cover
              )
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      SizedBox(height: 10,),
                      Text(title, style: TextStyle(fontSize: 20),),
                      SizedBox(height: 2),
                      Text(price, style: TextStyle(fontSize: 16, color:Color.fromARGB(255, 10, 195, 232),),),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}