import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../core/services/services_locator.dart';
import '../core/utils/routes_manager.dart';
import '../core/utils/theme_manager.dart';
import '../moka/presentation/controller/moka_bloc.dart';

class MyApp extends StatefulWidget {
  const MyApp._internal();

  static const MyApp _instance = MyApp._internal();

  factory MyApp() => _instance;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return sl<MokaBloc>()
          ..add(GetElectronicsProductEvent())
          ..add(GetSupermarketProductEvent())
          ..add(GetMenProductEvent())
          ..add(GetWomenProductEvent())
          ..add(GetWatchesProductEvent())
          ..add(CreateDataBaseEvent());
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: getApplicationTheme(),
        initialRoute: Routes.splashRoute,
        onGenerateRoute: RouteGenerator.getRoute,
      ),
    );
  }
}
