import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:tektok/app/main/app_route.dart';
import 'package:tektok/app/utils/styles/theme_style.dart';
import 'package:tektok/app/utils/translation/app_translation.dart';

class AppMain extends StatelessWidget {
  const AppMain({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Tektok',
      debugShowCheckedModeBanner: false,
      getPages: AppRoute.pages,
      initialRoute: RouteName.splashPage,
      theme: theme.light(),
      // darkTheme: theme.dark(),
      translations: AppTranslation(),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: const Locale('id', 'ID'),
      fallbackLocale: const Locale('id', 'ID'),
      supportedLocales: const [Locale('id', 'ID')],
    );
  }
}
