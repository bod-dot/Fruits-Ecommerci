import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fruit_e_commerce/core/helper_function/on_generate_rout.dart';
import 'package:fruit_e_commerce/core/helper_function/shared_preferences.dart';
import 'package:fruit_e_commerce/core/servers/bloc_observ.dart';
import 'package:fruit_e_commerce/core/servers/get_it_servers.dart';
import 'package:fruit_e_commerce/core/utils/color_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'feautres/splash/presentation/spalsh_view.dart';
import 'generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Shared.init();
  setupGetIt();
  Bloc.observer = MyBlocObserver();
  runApp(const FruitsEcommerce());
}

class FruitsEcommerce extends StatelessWidget {
  const FruitsEcommerce({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(seedColor: ColorApp.primary),
        fontFamily: 'Cairo',
      ),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: const Locale('ar'),
      debugShowCheckedModeBanner: false,
      title: 'Fruits E-Commerce',
      onGenerateRoute: onGenerateRoute,
      initialRoute: SplashView.routeName,
    );
  }
}
