import 'package:easacc/core/services/theme_service.dart';
import 'package:easacc/features/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: <SingleChildWidget>[ChangeNotifierProvider<ThemeService>(create: (_) => ThemeService())],
      child: Consumer<ThemeService>(
        builder: (BuildContext context, ThemeService themeService, Widget? child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'EASACC Task Demo App',
            theme: ThemeData(useMaterial3: true, colorScheme: themeService.lightScheme, fontFamily: 'Poppins'),
            darkTheme: ThemeData(useMaterial3: true, colorScheme: themeService.darkScheme, fontFamily: 'Poppins'),
            themeMode: themeService.themeMode,
            home: LoginPage(),
          );
        },
      ),
    );
  }
}
