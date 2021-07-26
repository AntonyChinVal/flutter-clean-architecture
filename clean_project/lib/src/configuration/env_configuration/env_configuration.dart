import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;

Future<void> configureEnv() async{

  await DotEnv.load();

}