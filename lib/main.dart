import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';
import 'package:songhyun/l10n/l10n.dart';
import 'package:songhyun/providers/language_provider.dart';
import 'package:songhyun/utils/app_exports.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  final languageProvider = LanguageProvider();
  await languageProvider.loadLocale();
  runApp(ChangeNotifierProvider(
    create: (context) => LanguageProvider()..loadLocale(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ResponsiveConfig().init(context);
    return Consumer<LanguageProvider>(
      builder: (context, languageProvider, child) {
        return MaterialApp(
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate
          ],
          supportedLocales: L10n.supportedLocales,
          locale: languageProvider.locale,
          home: ResponsiveLayout(
            mobileBody: MobileScaffold(
              scaffoldKey: scaffoldKey,
            ),
            webBody: WebBody(
              scaffoldKey: scaffoldKey,
            ),
          ),
          theme: MyAppTheme.themeDataLight,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
