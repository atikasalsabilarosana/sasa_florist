import 'package:flutter/material.dart';
import 'package:sasa_florist/model/bunga.dart';
import 'package:sasa_florist/service/service_bunga.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<Bunga> _bunga = [];
  List<Bunga> _bungaDisplay = [];

  bool isLoading = true;

  @override
  void initState() {
    Service.getBunga().then((value) {
      setState(() {
        isLoading = false;
        _bunga.addAll(value);
        _bungaDisplay = _bunga;
      });
    });
    super.initState();
  }

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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               SizedBox(height: 60),
                    Text("Search", style: TextStyle(
                      fontFamily: 'Poppins Bold',
                      fontSize: 23,
                      color: Color.fromARGB(255, 10, 195, 232),
                      fontWeight: FontWeight.w500,
                    )),
                SizedBox(height: 0),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  if (!isLoading) {
                    return index == 0 ? _searchBar() : _listItem(index - 1);
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
                itemCount: _bungaDisplay.length + 1,
              )
            ],
          ),
        ),
      ),
        ],
    ),
    );
  }

  _listItem(index) {
    return BungaCard(
        imageUrl: _bungaDisplay[index].imgUrl,
        title: _bungaDisplay[index].title,
        harga: _bungaDisplay[index].harga);
  }

  _searchBar() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25, top: 10),
      child: Container(
        child: TextFormField(
          onChanged: (text) {
            text = text.toLowerCase();
            setState(() {
              _bungaDisplay = _bunga.where((bunga) {
                var bungaTitle = bunga.title.toLowerCase();
                return bungaTitle.contains(text);
              }).toList();
            });
          },
          decoration: InputDecoration(
            filled: true,
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color.fromARGB(255, 214, 214, 214))),
            fillColor: Color.fromARGB(255, 255, 255, 255),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Color.fromARGB(255, 214, 214, 214), width: 3)),
            hintText: 'Cari bunga...',
            hintStyle: TextStyle(
                fontFamily: 'OpenSans-Light', color: Colors.grey, fontSize: 16),
          ),
        ),
      ),
    );
  }
}

class BungaCard extends StatelessWidget {
  final String imageUrl, title, harga;
  const BungaCard(
      {Key? key,
      required this.imageUrl,
      required this.title,
      required this.harga})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Material(
            borderRadius: BorderRadius.circular(8),
            elevation: 3,
            child: Container(
              height: 170,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(height: 12),
          Text(
            title,
            style: TextStyle(
              fontFamily: 'OpenSans-SemiBold',
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 2),
          Text(
            harga,
            style: TextStyle(
              fontFamily: 'OpenSans-Regular',
              fontSize: 14,
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}