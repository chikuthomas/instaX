//this handles all the sign in , sign out with firebase logic

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../user_repository.dart';

class FirebaseUserRepository implements UserRepository {
  //creating a constructor for the below firebase parameter
  FirebaseUserRepository({
    FirebaseAuth? firebaseAuth,
  }) : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  //we need this firebase parameter
  final FirebaseAuth _firebaseAuth;

  //this is declaring the firebase collection to be used.
  final userCollection = FirebaseFirestore.instance.collection('users');

  //Stream of [MyUser] which will emit the current user
  //when the authentication state changes
  //emits [MyUser.empty if the user is not authenticated]
  @override
  // TODO: implement user
  Stream<User?> get user {
    return _firebaseAuth.authStateChanges().map((firebaseUser) {
      final user = firebaseUser;
      return user;
    });
  }

  /*difference between a stream and a future
    Nature: Streams deal with a continuous flow of multiple
    values over time, while futures deal with a single value
    that will be provided in the future.

    Use Case: Streams are used for handling sequences of data/events
    (e.g., real-time data streams), whereas futures are used for handling
    the result of asynchronous operations (e.g., HTTP requests).
  */

  @override
  Future<MyUser> signUp(MyUser myUser, String password) async {
    try {
      UserCredential user = await _firebaseAuth.createUserWithEmailAndPassword(
          email: myUser.email, password: password);

      myUser = myUser.copyWith(id: user.user!.uid);

      return myUser;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> signIn(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> resetPassword(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> setUserData(MyUser user) async {
    try {
      await userCollection.doc(user.id).set(user.toEntity().toDocument());
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<MyUser> getMyUser(String myUserId) async {
    try {
      return userCollection.doc(myUserId).get().then((value) =>
          MyUser.fromEntity(MyUserEntity.fromDocument(value.data()!)));
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
