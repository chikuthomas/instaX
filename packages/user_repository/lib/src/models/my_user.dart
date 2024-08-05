//for exporting models

import 'package:equatable/equatable.dart';

class MyUser extends Equatable {
  final String id;
  final String email;
  final String name;
  final String? picture;

  //this is the constructor for MyUser Class
  const MyUser(
      {required this.id,
      required this.email,
      required this.name,
      this.picture});

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
