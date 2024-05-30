import 'package:mymoney/firebase_options.dart';
import 'package:mymoney/routes.dart';
import 'package:mymoney/theme.dart';
import 'package:flutter/material.dart';

import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await MobileAds.instance.initialize();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'My Money',
        darkTheme: const MaterialTheme(TextTheme()).dark(),
        theme: const MaterialTheme(TextTheme()).light(),
        themeMode: ThemeMode.light,
        initialRoute: '/',
        routes: routes(context),
      );
    });
  }
}
