//this is an abstract class to be used in our ui for the firebase repository

import 'package:firebase_auth/firebase_auth.dart';
import 'package:user_repository/user_repository.dart';

abstract class UserRepository {
  Stream<User?> get user;

  Future<void> signIn(String email, String password);
  Future<void> signOut();
  Future<MyUser> signUp(MyUser myUser, String password);
  Future<void> resetPassword(String email);

  //set User Data
  Future<void> setUserData(MyUser user);

  //Get User Data
  Future<MyUser> getMyUser(String myUserId);
}
