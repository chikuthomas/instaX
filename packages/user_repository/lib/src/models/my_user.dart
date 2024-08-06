//user class
import 'package:equatable/equatable.dart';
import 'package:user_repository/src/entities/entities.dart';

//Extending Equatable makes it easier to compare instances of MyUser.(isEmpty or isNotEmpty)
class MyUser extends Equatable {
  //these are class properties
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

  //this is an empty method created as an initial state of the MyUser Class Object/instance
  static const empty = MyUser(id: '', email: '', name: '', picture: '');

  /*copyWith method is often used within immutable classes to
   create a copy of an object with some properties updated.
   This allows us to modify MyUser Parameters despite having
   the final keyword.

   This method allows creating a new MyUser instance by copying
   an existing one but with some properties updated. If a property
   is not provided, it uses the current value.
   */

  MyUser copyWith({
    String? id,
    String? email,
    String? name,
    String? picture,
  }) {
    return MyUser(
        id: id ?? this.id,
        email: email ?? this.email,
        name: name ?? this.name,
        picture: picture ?? this.picture);
  }

  //Convenience Getters:
  //These are shortcuts to check if the current user is the same as the empty user or not.

  //convenience getter to determine whether the current user is empty
  bool get isEmpty => this == MyUser.empty;

  //convenience getter to determine whether the current user is not empty
  bool get isNotEmpty => this != MyUser.empty;

  /*MyUserEntity toEntity(){} method is used to convert the MyUser Object
  instance into json format to be stored in the firebase database*/

  MyUserEntity toEntity() {
    return MyUserEntity(
      id: id,
      email: email,
      name: name,
      picture: picture,
    );
  }

  /*MyUser fromEntity(){} method is used to convert json format
  data retrieved from firebase database into a MyUser Object*/

  static MyUser fromEntity(MyUserEntity entity) {
    return MyUser(
      id: entity.id,
      email: entity.email,
      name: entity.name,
      picture: entity.picture,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [id, email, name, picture];
}
