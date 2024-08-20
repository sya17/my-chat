import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:tektok/app/utils/common/logger_util.dart';

class RealtimeDB {
  FirebaseDatabase database = FirebaseDatabase.instance;
  init() {
    // FirebaseApp secondaryApp = Firebase.app('SecondaryApp');
    // FirebaseDatabase database = FirebaseDatabase.instanceFor(app: secondaryApp);
  }
  void createRecord() {
    DatabaseReference databaseReference =
        FirebaseDatabase.instance.reference().child('users');

    databaseReference.push().set({
      'name': 'John Doe',
      'email': 'johndoe@example.com',
      'age': 30,
    });
  }

  void readData() {
    DatabaseReference databaseReference =
        FirebaseDatabase.instance.reference().child('users');

    databaseReference.onValue.listen((event) {
      DataSnapshot dataSnapshot = event.snapshot;
      Map<dynamic, dynamic> values =
          dataSnapshot.value as Map<dynamic, dynamic>;
      values.forEach((key, values) {
        print('Key: $key');
        print('Name: ${values['name']}');
        print('Email: ${values['email']}');
        print('Age: ${values['age']}');
      });
    });
  }

  void updateData() {
    DatabaseReference databaseReference =
        FirebaseDatabase.instance.reference().child('users');

    String recordKey = '-Mfa7Gfrd2Er6q9k7Jbv'; // Replace with your record key

    databaseReference.child(recordKey).update({
      'name': 'Jane Doe',
      'age': 25,
    });
  }

  void deleteData() {
    DatabaseReference databaseReference =
        FirebaseDatabase.instance.reference().child('users');

    String recordKey = '-Mfa7Gfrd2Er6q9k7Jbv'; // Replace with your record key

    databaseReference.child(recordKey).remove();
  }

  // void searchByName(String name) {
  //   DatabaseReference databaseReference =
  //       FirebaseDatabase.instance.reference().child('users');

  //   databaseReference
  //       .orderByChild('name')
  //       .equalTo(name)
  //       .onValue
  //       .listen((event) {
  //     DataSnapshot dataSnapshot = event.snapshot;
  //     Map<dynamic, dynamic> values = dataSnapshot.value;
  //     values.forEach((key, values) {
  //       print('Key: $key');
  //       print('Name: ${values['name']}');
  //       print('Email: ${values['email']}');
  //       print('Age: ${values['age']}');
  //     });
  //   });
  // }

  // void fetchPaginatedData(int pageSize, String lastRecordKey) {
  //   DatabaseReference databaseReference =
  //       FirebaseDatabase.instance.reference().child('users');

  //   Query query = databaseReference.orderByKey().limitToFirst(pageSize);

  //   if (lastRecordKey != null) {
  //     query = query.startAt(lastRecordKey);
  //   }

  //   query.onValue.listen((event) {
  //     DataSnapshot dataSnapshot = event.snapshot;
  //     Map<dynamic, dynamic> values = dataSnapshot.value;
  //     values.forEach((key, values) {
  //       print('Key: $key');
  //       print('Name: ${values['name']}');
  //       print('Email: ${values['email']}');
  //       print('Age: ${values['age']}');
  //     });
  //   });
  // }

  // void incrementAgeTransaction(String recordKey) {
  //   DatabaseReference databaseReference =
  //       FirebaseDatabase.instance.reference().child('users/$recordKey/age');

  //   databaseReference.runTransaction((MutableData mutableData) async {
  //     if (mutableData.value != null) {
  //       mutableData.value += 1;
  //     }
  //     return mutableData;
  //   });
  // }

  // void filterAndSortData() {
  //   DatabaseReference databaseReference =
  //       FirebaseDatabase.instance.reference().child('users');

  //   databaseReference
  //       .orderByChild('age')
  //       .startAt(25)
  //       .endAt(40)
  //       .onValue
  //       .listen((event) {
  //     DataSnapshot dataSnapshot = event.snapshot;
  //     Map<dynamic, dynamic> values = dataSnapshot.value;
  //     values.forEach((key, values) {
  //       print('Key: $key');
  //       print('Name: ${values['name']}');
  //       print('Email: ${values['email']}');
  //       print('Age: ${values['age']}');
  //     });
  //   });
  // }

  // void setUserOnlineStatus(String userId, bool isOnline) {
  //   DatabaseReference databaseReference =
  //       FirebaseDatabase.instance.reference().child('presence/$userId');

  //   databaseReference.set({
  //     'online': isOnline,
  //     'lastOnline': isOnline ? ServerValue.timestamp : null,
  //   });
  // }
  // void performBatchWrite() {
  //   DatabaseReference databaseReference = FirebaseDatabase.instance.reference();

  //   WriteBatch batch = databaseReference.batch();

  //   batch.update(
  //       databaseReference.child('users/user1'), {'name': 'Updated Name'});
  //   batch.delete(databaseReference.child('users/user2'));
  //   batch.set(databaseReference.child('users/user3'), {'name': 'New User'});

  //   batch.commit().then((_) {
  //     print('Batch write completed successfully.');
  //   }).catchError((error) {
  //     print('Batch write failed: $error');
  //   });
  // }

  getMssg() async {
    DatabaseReference ref = database.ref("sya");
    logger.safeLog('URL : ${database.databaseURL}');

    final snapshot = await ref.child('sya').get();
    if (snapshot.exists) {
      print(snapshot.value);
    } else {
      print('No data available.');
    }
  }
}

RealtimeDB realtimeDB = RealtimeDB();
