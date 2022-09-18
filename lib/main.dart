import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/provider/scan_list_provider.dart';
import 'package:qr_reader/provider/ui_provider.dart';
import 'package:qr_reader/pages/pages.dart';

void main() => runApp(const AppState());

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create:(context) => UIProvider()),
        ChangeNotifierProvider(create:(context) => ScanListProvider()),
      ],
      child:const MyApp()
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'home',
      routes: {
        'home':(_) => const HomePage(),
        'map':(_) => const MapPage()
      },
      theme: ThemeData(
        primarySwatch: Colors.purple,
        appBarTheme: const AppBarTheme(
          centerTitle: true
        )
      )
    );
  }
}