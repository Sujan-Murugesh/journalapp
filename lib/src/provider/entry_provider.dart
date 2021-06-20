import 'package:flutter/cupertino.dart';
import 'package:journalapp/src/services/firestore_service.dart';
import 'package:uuid/uuid.dart';
import 'package:journalapp/src/models/entry.dart';

class EntryProvider with ChangeNotifier {
  final firestoreService = FirestoreService();
  //temp variable to store date

  DateTime _date;
  String _entry;
  String _entryId;
  var uuid = Uuid();

  //gettrer
  DateTime get date => _date;
  String get entry => _entry;
  Stream<List<Entry>> get entries => firestoreService.getEntries();

  //setters
  set changeDate(DateTime date){
    _date = date;
    notifyListeners();
  }

  set changeEntry(String entry){
    _entry = entry;
    notifyListeners();
  }

  //functions
  loadAll(Entry entry){
    //pass the entries we getting from entry screen.
    if (entry != null){
      _date = DateTime.parse(entry.date);
      _entry = entry.entry;
      _entryId = entry.entryId;
    }else{
      _date = DateTime.now();
      _entry = null;
      _entryId = null;
    }
  }

  //save function
  saveEntry(){
    if(_entryId == null){
      //add
      var newEntry = Entry(date: _date.toIso8601String(), entry: _entry, entryId: uuid.v1());
      firestoreService.setEntry(newEntry);

    }else{
      //edit
      var updatedEntry = Entry(date: _date.toIso8601String(), entry: _entry, entryId: _entryId);
      firestoreService.setEntry(updatedEntry);
    }
  }

  //delete
  removeEntry(String entryId){
    firestoreService.removeEntry(entryId);
  }
}