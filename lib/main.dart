import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test__task/generated/l10n.dart';
import 'package:flutter_test__task/models/product_model.dart';
import 'package:flutter_test__task/models/utils/theme.dart';
import 'package:flutter_test__task/view/login.dart';
import 'package:flutter_test__task/view/newUI/bottom_navigation_bar_screen.dart';
import 'package:flutter_test__task/view/newUI/cart_screen.dart';
import 'package:flutter_test__task/view/newUI/profile_screen.dart';
import 'package:provider/provider.dart';
import 'models/newmodel/button_navbar_provider.dart';
import 'models/newmodel/cart_model.dart';
import 'models/newmodel/catalog_model.dart';
import 'models/newmodel/profile_model.dart';
import 'view/newUI/catalog_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => CatalogModel()),
        Provider(create: (context) => AuthModel()),
        Provider(create: (context) => ProductModel()),
        ChangeNotifierProxyProvider<CatalogModel, CartModel>(
            create: (context) => CartModel(),
            update: (context, catalog, cart) {
              if (cart == null) throw ArgumentError.notNull('cart');
              cart.catalog = catalog;
              return cart;
            }),
        ChangeNotifierProvider<ButtonNavBarProvider>(
            create: (context) => ButtonNavBarProvider()),
        ChangeNotifierProxyProvider<AuthModel, ProfileModel>(
            create: (context) => ProfileModel(),
            update: (context, auth, profile) {
              if (profile == null) throw ArgumentError.notNull('profile');
              profile.auth = auth;
              return profile;
            }),
      ],
      child: AdaptiveTheme(
        light: kLightTheme,
        dark: kDarkTheme,
        initial: AdaptiveThemeMode.light,
        builder: (light, dark) => MaterialApp(
          theme: light,
          darkTheme: dark,
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          initialRoute: '/',
          routes: {
            '/': (context) => const LoginScreen(),
            '/group_catalog': (context) => BottomNavBarScreen(),
            '/catalog': (context) => const CatalogScreen(),
            /* '/cart': (context) => const CartScreen(),
            '/profile': (context) => const ProfileScreen(), */
          },
        ),
      ),
    );
  }
}
