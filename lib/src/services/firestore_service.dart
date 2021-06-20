
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:journalapp/src/models/entry.dart';

class FirestoreService {
  FirebaseFirestore _db = FirebaseFirestore.instance;

  //get Entries
  //1.list of all entries getting stream fs
  Stream<List<Entry>> getEntries(){
    return _db
        .collection('entries')
        .where('date',isGreaterThan: DateTime.now().add(Duration(days: -30)).toIso8601String())
        .snapshots()
        .map((snapshot) => snapshot.docs
        .map((doc) => Entry.fromJson(doc.data()))
        .toList());
  }
  //Upsert combined create + upload
  Future<void> setEntry(Entry entry){
      var option = SetOptions(merge:true);

      return _db
          .collection('entries')
          .doc(entry.entryId)
          .set(entry.toMap());
  }

  //Delete
  Future<void> removeEntry(String entryId){
    return _db
        .collection('entries')
        .doc(entryId)
        .delete();
  }
}
