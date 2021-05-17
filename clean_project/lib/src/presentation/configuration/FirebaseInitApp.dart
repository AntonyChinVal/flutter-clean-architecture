import 'package:clean_project/src/presentation/configuration/App.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FirebaseInitApp extends StatefulWidget {
  
  @override
  _FirebaseInitAppState createState() => _FirebaseInitAppState();

}

class _FirebaseInitAppState extends State<FirebaseInitApp> {

  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {

        if (snapshot.hasError) {
          return SomethingWentWrong();
        }

        if (snapshot.connectionState == ConnectionState.done) {
          return MyApp();
        }

        return Loading();
      },
    );
  }
}

class SomethingWentWrong extends StatelessWidget{
  
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: Text("Something went wrong with firebase"),
    );
  }

}

class Loading extends StatelessWidget{
  
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: Text("Loading Firebase"),
    );
  }

}
