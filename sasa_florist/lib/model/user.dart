class User{
  final int id;
  final String nama, imgUrl, email, password, address;

  User({
    required this.id,
    required this.nama, required this.imgUrl, required this.email, required this.password, required this.address
  });

  factory User.fromJSON(Map map){
    return User(
      id: map['id'],
      nama: map['nama'],
      imgUrl: map['imgUrl'],
      email: map['email'],
      password: map['password'],
      address: map['address']
    );
  }
}