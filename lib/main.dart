import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';
import 'package:songhyun/providers/language_provider.dart';
import 'package:songhyun/utils/app_exports.dart';

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(ChangeNotifierProvider(
    create: (context) => LanguageProvider()..loadLocale(),
    child: EasyLocalization(
        supportedLocales: const [Locale('en', 'US'), Locale('ko', 'KR')],
        fallbackLocale: const Locale('en', 'US'),
        path: 'assets/translations',
        child: const MyApp()),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    ResponsiveConfig().init(context);
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: languageProvider.locale,
      // home: const PortfolioScreen(),
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
  }
}
