import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("About Me!")),
        body:  new Stack(
          children: <Widget>[
            new Container(
              decoration: new BoxDecoration(
                  image: new DecorationImage(image: new AssetImage("images/sujan.png"), fit: BoxFit.cover,),
              ),
          ),

                CircleAvatar(
                  backgroundImage: AssetImage('images/sujan.png'),
                  radius: 50,
                ),

            new Center(
               child: new Text("Hey ! I'm Sujan ...!\nUniversity of Ruhuna.\nSri Lanka"),
              )
            ],
        ),

    );
  }
}
