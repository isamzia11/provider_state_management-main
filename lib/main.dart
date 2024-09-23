import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_management/provider/auth_provider.dart';
import 'package:provider_state_management/provider/count_provider.dart';
import 'package:provider_state_management/provider/example_one_provider.dart';
import 'package:provider_state_management/provider/favorite_provider.dart';
import 'package:provider_state_management/provider/theme_changer_provider.dart';
import 'package:provider_state_management/screens/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => CountProvider(),
          ),
          ChangeNotifierProvider(
            create: (_) => ExampleOneProvider(),
          ),
          ChangeNotifierProvider(
            create: (_) => FavoriteItemProvider(),
          ),
          ChangeNotifierProvider(
            create: (_) => ThemeChanger(),
          ),
          ChangeNotifierProvider(
            create: (_) => AuthProvider(),
          ),
        ],
        child: Builder(builder: (BuildContext context) {
          final themeChanger = Provider.of<ThemeChanger>(context);
          return MaterialApp(
            title: 'Flutter Demo',
            themeMode: themeChanger.themeMode,
            theme: ThemeData(
                brightness: Brightness.light,
                appBarTheme: const AppBarTheme(color: Colors.amber)),
            darkTheme: ThemeData(
                brightness: Brightness.dark,
                appBarTheme: const AppBarTheme(color: Colors.deepOrange)),
            home: loginScreen(),
          );
        }));
  }
}
