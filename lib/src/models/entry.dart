import 'package:flutter/material.dart';

class Entry {
  final String entryId;
  final String date;
  final String entry;

  //constructor ...
  Entry({this.date, this.entry, @required this.entryId});

  //define obj
  //1.json from firestore to convert dart form
  factory Entry.fromJson(Map<String, dynamic> json){
    return Entry(
      date: json['date'],
      entry: json['entry'],
      entryId: json['entryId']
    );
  }

  //mapping to firestore
  Map<String, dynamic> toMap() {
    return {
      'date': date,
      'entry': entry,
      'entryId': entryId
    };
  }

}