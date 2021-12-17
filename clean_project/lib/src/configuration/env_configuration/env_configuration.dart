import 'package:flutter_dotenv/flutter_dotenv.dart';

Future configureEnv() async {
  await dotenv.load(fileName: ".env");
}
