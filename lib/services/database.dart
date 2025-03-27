import 'package:cafe_curator/model/brew.dart';
import 'package:cafe_curator/model/user_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({required this.uid});
  
  // collection reference
  final CollectionReference brewCollection = FirebaseFirestore.instance.collection('brews');

  Future updateUserData(String name, String sugars, int strength) async {
    return await brewCollection.doc(uid).set({
      'name': name,
      'sugars': sugars,
      'strength': strength,
    });
  }

  // brew list from query snapshot
  List<Brew> _brewListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc){
      return Brew(
        name: doc.get('name') ?? '',
        strength: doc.get('strength') ?? '0',
        sugars: doc.get('sugars') ?? 0,
      );
    }).toList();
  }

  // get brews stream
  Stream<List<Brew>> get brews {
    return brewCollection.snapshots().map(_brewListFromSnapshot);
  }

  // user data from snapshot
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid, 
      name: snapshot.get('name'), 
      sugars: snapshot.get('sugars'), 
      strength: snapshot.get('strength')
    );
  }
 
  // get user doc stream
  Stream<UserData> get userData {
    return brewCollection.doc(uid).snapshots().map(_userDataFromSnapshot);
  }

}