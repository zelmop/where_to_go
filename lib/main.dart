import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:ui_components/ui_components.dart';
import 'package:where_to_go/app/app.locator.dart';
import 'package:where_to_go/app/app.router.dart';
import 'package:where_to_go/utils/utils.dart';

Future<void> main() async {
  await setupLocator();
  setupBottomSheetUi();
  setupDialogUi();

  await dotenv.load(fileName: "assets/.env");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Where to Go',
      theme: ThemeData(
        primarySwatch: ColorConstants.primarySwatch,
        inputDecorationTheme: ThemeConstants.inputDecorationTheme
      ),
      navigatorKey: StackedService.navigatorKey,
      onGenerateRoute: StackedRouter().onGenerateRoute
    );
  }
}