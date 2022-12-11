import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sasa_florist/model/bunga.dart';

class Detail extends StatefulWidget {
  final Bunga bunga;
  const Detail({super.key, required this.bunga});

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  bool isFav = false;

  @override
  void initState() {
    isFav = widget.bunga.isFav;
    super.initState();
  }

  void addFav(String title, harga, imgUrl, desc, isFav) async {
    try {
      var response = await Dio().put(
          'http://192.168.40.1:3000/bunga/' + widget.bunga.id.toString(),
          data: {
            "title": title,
            "harga": harga,
            "imgUrl": imgUrl,
            "desc": desc,
            "isFav": isFav
          });
      if (response.data.length > 0) {
        print("Saved successfully");
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
      appBar: AppBar(
        // backgroundColor: Colors.amber,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.keyboard_arrow_left),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 400,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(widget.bunga.imgUrl),
                  fit: BoxFit.cover
                )
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   SizedBox(height: 20),
                    Text(widget.bunga.title,
                    style: 
                          TextStyle(fontSize: 20, 
                          fontWeight: FontWeight.w500,
                          color: Colors.black
                          )),
                    SizedBox(height: 10),
                    Text(widget.bunga.harga,
                    style: 
                          TextStyle(fontSize: 15, 
                          color: Colors.blue
                          )),
                    SizedBox(height: 10),
                    Text(widget.bunga.desc,
                    style: 
                          TextStyle(fontSize: 15, 
                          color: Colors.black
                          )),
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            isFav = !isFav;
            addFav(
                widget.bunga.title,
                widget.bunga.harga,
                widget.bunga.imgUrl,
                widget.bunga.desc,
                isFav);
          });
        },
        child: Icon(Icons.favorite,
            color: isFav == false ? Colors.grey : Colors.red),
        elevation: 2,
        backgroundColor: Colors.white,
    ),
    );
  }
}