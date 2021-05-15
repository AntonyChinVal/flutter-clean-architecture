import 'package:clean_project/src/injection_container/injection_container.dart';
import 'package:clean_project/src/presentation/configuration/App.dart';
import 'package:clean_project/src/presentation/configuration/FirebaseInitApp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;

void main() async{
  await DotEnv.load();
  configureInjection();
  WidgetsFlutterBinding.ensureInitialized();
  
  bool isWithFirabase = DotEnv.env["FIREBASE"] == "true";
  if(isWithFirabase){
    runApp(FirebaseInitApp());
  }else{
    runApp(MyApp());
  }
  
}