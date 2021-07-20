import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:internship_project_1/authentication/blocks.dart';
import 'package:internship_project_1/screens/cart_screen/bloc/cart_bloc.dart';
import 'package:internship_project_1/screens/delivery_slot/delivery_slot.dart';
import 'package:internship_project_1/screens/discover_screen/discover_screen.dart';
import 'package:internship_project_1/screens/favorite_screen/bloc/favorite_bloc.dart';
import 'package:internship_project_1/screens/home_screen.dart';
import 'package:internship_project_1/screens/login_screen/login_screen.dart';
import 'package:internship_project_1/screens/onboarding_screen/onboarding_screen.dart';
import 'package:internship_project_1/screens/producers_screen/producers_screen.dart';
import 'package:internship_project_1/screens/products/products_screen.dart';
import 'package:internship_project_1/screens/profile_details/profile_details_screen.dart';
import 'package:internship_project_1/screens/recipes/recipes_screen.dart';
import 'package:internship_project_1/screens/reset_password/reset_password_screen.dart';
import 'package:internship_project_1/screens/you_might_like/you_might_like_screen.dart';
import 'package:internship_project_1/shared/colors.dart';
import 'package:provider/provider.dart';

import 'generated/l10n.dart';
import 'screens/reset_password/new_password_screen.dart';
import 'screens/reset_password/reset_password_screen.dart';
import 'screens/reset_password/verification_code_screen.dart';

void main() async {
  await DotEnv.load(fileName: ".env");
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = SimpleBlocObserver();
  final UserRepository userRepository = UserRepository();

  runApp(MultiProvider(
    providers: [
      BlocProvider(
        create: (context) => AuthenticationBloc(
          userRepository: userRepository,
        )..add(AuthenticationStarted()),
      ),
      BlocProvider(
        create: (context) => FavoriteBloc(),
      ),
      BlocProvider(
        create: (context) => CartBloc(),
      ),
    ],
    child: App(),
  ));
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'OpenSans',
        primaryColor: backgroundColor,
        scaffoldBackgroundColor: backgroundColor,
        appBarTheme: AppBarTheme(
          elevation: 0,
          textTheme: ThemeData.dark().textTheme.copyWith(
                  headline6: TextStyle(
                fontSize: 20,
                fontFamily: 'OpenSans',
                color: basicBlack,
                fontWeight: FontWeight.bold,
              )),
        ),
      ),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      initialRoute: HomeScreen.id,
      routes: {
        DiscoverScreen.id: (context) => DiscoverScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        HomeScreen.id: (context) => HomeScreen(),
        ResetPasswordScreen.id: (context) => ResetPasswordScreen(),
        VerificationCodeScreen.id: (context) => VerificationCodeScreen(),
        NewPasswordScreen.id: (context) => NewPasswordScreen(),
        RecipesScreen.id: (context) => RecipesScreen(),
        ProductsScreen.id: (context) => ProductsScreen(),
        ProducersScreen.id: (context) => ProducersScreen(),
        YouMightLikeScreen.id: (context) => YouMightLikeScreen(),
        DeliverySlot.id: (context) => DeliverySlot(),
        ProfileDetailsScreen.id: (context) => ProfileDetailsScreen(),
        OnboardingScreen.id: (context) => OnboardingScreen()
      },
    );
  }
}
