import 'package:equatable/equatable.dart';

class MyUserEntity extends Equatable {
  //these are class properties
  final String id;
  final String email;
  final String name;
  final String? picture;

  //this is the constructor for MyUser Class
  const MyUserEntity(
      {required this.id,
      required this.email,
      required this.name,
      this.picture});

  //These two methods perform the actual data conversion to json and from json

  //converting to json to store in firebase database
  Map<String, Object?> toDocument() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'picture': picture,
    };
  }

  //converting from json to object

  static MyUserEntity fromDocument(Map<String, dynamic> doc) {
    return MyUserEntity(
        id: doc['id'] as String,
        email: ['email'] as String,
        name: ['name'] as String,
        picture: ['picture'] as String);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [id, email, name, picture];

  //am using """ to be able to extend my string to multiple lines
  @override
  String toString() {
    return """"UserEntity:{
    id:$id 
    email:$email 
    name:$name 
    picture:$picture}""";
  }
}
