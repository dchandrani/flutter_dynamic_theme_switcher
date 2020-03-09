import 'package:flutter/material.dart';
import 'package:flutter_dynamic_theme_switcher/provider/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: ThemeChangeNotifier(),
      child: Consumer<ThemeChangeNotifier>(
        builder: (_, notifier, child) => MaterialApp(
          title: 'Dynamic Theme Switcher',
          theme: notifier.isDarkTheme ? darkTheme : lightTheme,
          home: HomeScreen(),
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dynamic Theme Switcher'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        alignment: Alignment.center,
        child: Consumer<ThemeChangeNotifier>(
          builder: (_, notifier, child) => SwitchListTile(
            title: Text('Dark Mode'),
            value: notifier.isDarkTheme,
            onChanged: (value) {
              notifier.toggleTheme();
            },
          ),
        ),
      ),
    );
  }
}
