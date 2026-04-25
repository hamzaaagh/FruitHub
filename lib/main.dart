import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fruit_app/Core/Services/custom_bloc_observer.dart';
import 'package:fruit_app/Core/Services/service_locator.dart';
import 'package:fruit_app/Core/Services/shared_prefrs_singelton.dart';
import 'package:fruit_app/Core/utils/app_router.dart';
import 'package:fruit_app/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  setupServiceLoacator();
  Bloc.observer = CustomBlocObserver();
  await SharedPrefrsSingelton.init();
  runApp(const FruitHUP());
}

class FruitHUP extends StatelessWidget {
  const FruitHUP({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      builder: (context, child) {
        return GestureDetector(
          onTap: () {
            // This removes focus and hides the cursor/keyboard globally
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: child,
        );
      },
      locale: const Locale('ar'),
      supportedLocales: const [Locale('ar')],
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      theme: ThemeData(
        fontFamily: 'Cairo',
        scaffoldBackgroundColor: Colors.white,
      ),
      routerConfig: appRouter,
      title: "FruitHUP",
      debugShowCheckedModeBanner: false,
    );
  }
}
