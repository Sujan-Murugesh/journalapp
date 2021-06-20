import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:journalapp/src/models/entry.dart';
import 'package:journalapp/src/provider/entry_provider.dart';
import 'package:journalapp/src/screens/entry.dart';
import 'package:provider/provider.dart';
import 'package:journalapp/src/screens/about.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final entryProvider = Provider.of<EntryProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Day of My Journey') ,
          actions: [
            IconButton(icon: Icon(Icons.assignment_ind),
              onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => AboutScreen()));
              },
            )
          ]
      ),
      body: StreamBuilder<List<Entry>>(
        stream: entryProvider.entries,
        builder: (context, snapshot) {
            if(!snapshot.hasData){
              return CircularProgressIndicator();
            }
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context,index){
                  return ListTile(
                    trailing: Icon(
                      Icons.edit,
                      color: Theme.of(context).accentColor,
                    ),
                    title: Text(
                      formatDate(DateTime.parse(snapshot.data[index].date),
                          [MM, ' ', d, ', ', yyyy]),
                    ),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                          EntryScreen(entry: snapshot.data[index])));
                    },
                  );
                });

        }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => EntryScreen()));
        },
      ),
    );
  }


}
