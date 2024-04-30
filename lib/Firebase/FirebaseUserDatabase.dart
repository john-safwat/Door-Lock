

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doorlock/Models/Users/UserDTO.dart';

FirebaseUserDatabase injectFirebaseUserDatabase(){
  return FirebaseUserDatabase.getInstance();
}

class FirebaseUserDatabase {

  // singleton pattern
  FirebaseUserDatabase._();
  static FirebaseUserDatabase? _instance ;

  static FirebaseUserDatabase getInstance(){
    return _instance??=FirebaseUserDatabase._();
  }

  // function to get collection references of users collection in the app
  CollectionReference<MyUser> getCollectionReference(){
    return FirebaseFirestore.instance.collection("Users").withConverter(
        fromFirestore: (snapshot, options) => MyUser.fromFireStore(snapshot.data()!),
        toFirestore: (value, options) => value.toFireStore(),
    );
  }
  // function to upload user data to user data to database
  Future<void> createUser({required MyUser user}) async {
    await getCollectionReference().doc(user.uid).set(user);
  }

  // function to update user data to user database in firebase fireStore
  Future<void> updateUserData({required MyUser user}) async {
    await getCollectionReference().doc(user.uid).update(user.toFireStore());
  }

  // function to check if user Exist in database
  Future<bool> userExist({required String uid})async{
    var doc  = await getCollectionReference().doc(uid).get();
    return doc.exists;
  }

  Future<MyUser?> getUserData({required String uid})async {
    var doc = await getCollectionReference().doc(uid).get();
    return doc.data();
  }
  
  // function to get user data using email address 
  Future<MyUser?> getUserDataByEmail({required String email})async{
    var doc = await getCollectionReference().where("email", isEqualTo: email).get();
    var users = doc.docs.map((e) => e.data()).toList();
    return users.isEmpty? null : users.first;
  }

  // function to delete user data
  Future<void> deleteUserData({required String uid})async{
    await getCollectionReference().doc(uid).delete();
  }

}