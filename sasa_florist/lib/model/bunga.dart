class Bunga{
  final int id;
  final String imgUrl;
  final String harga;
  final String title;
  final String desc;
  final bool isFav; 

  Bunga(
    {
    required this.id, 
    required this.imgUrl, 
    required this.harga, 
    required this.title,
    required this.desc,
    required this.isFav});

  factory Bunga.fromJson(Map map){
    return Bunga(
      id: map['id'], 
      imgUrl: map['imgUrl'], 
      harga: map['harga'], 
      title: map['title'],
      desc: map['desc'],
      isFav: map['isFav']);
  }
}