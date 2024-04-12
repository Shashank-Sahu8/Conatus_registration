import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:g_recaptcha_v3/g_recaptcha_v3.dart';
import 'package:webapp/Page_1/Event_Details_1.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    bool ready =
        await GRecaptchaV3.ready("6LfHXrgpAAAAAIyxKAmFAwfhD3281SIqU6prrPfQ", showBadge: false);
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const start()
    );
  }
}


class start extends StatelessWidget {
  const start({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: page1(),
    );
  }
}
