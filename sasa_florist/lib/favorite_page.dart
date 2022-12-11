import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sasa_florist/detail.dart';
import 'package:sasa_florist/model/bunga.dart';
import 'package:sasa_florist/service/service_bunga.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
                    SizedBox(height: 60),
                    Text("Favorite Product", style: TextStyle(
                      fontFamily: 'Poppins Bold',
                      fontSize: 23,
                      color: Color.fromARGB(255, 10, 195, 232),
                      fontWeight: FontWeight.w500,
                    )),
                    SizedBox(height: 20),
                    FutureBuilder<List<Bunga>>(
                      future: Service.fetchRecipesBasedLike(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        } else {
                          if (snapshot.hasError) {
                            return Text(snapshot.error.toString());
                          } else {
                              return ListView.builder(
                                shrinkWrap: true,
                                itemCount: snapshot.data?.length,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Detail(bunga: Bunga(id: int.parse("${snapshot.data?[index].id}"), title: "${snapshot.data?[index].title}", harga: "${snapshot.data?[index].harga}", imgUrl: "${snapshot.data?[index].imgUrl}", desc: "${snapshot.data?[index].desc}", isFav: snapshot.data?[index].isFav as bool))));
                                    },
                                    child: FavCard(title: "${snapshot.data?[index].title}", imgUrl: "${snapshot.data?[index].imgUrl}", harga: "${snapshot.data?[index].harga}",),
                                  );
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
      ),
    );
  }
}

class FavCard extends StatelessWidget {
  final String imgUrl, title, harga; 
  const FavCard({
    Key? key,
    required this.imgUrl,
    required this.title,
    required this.harga
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Container(
              width: 100,
              height: 100,
              child: Image.network(imgUrl)
            ),
            SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(fontSize: 20),),
                SizedBox(height: 2),
                Text(harga, style: TextStyle(fontSize: 16),),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
