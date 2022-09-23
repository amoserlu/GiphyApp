import 'package:capgemini/domain/blocs/gift/gift_bloc.dart';
import 'package:capgemini/domain/blocs/language/language_bloc.dart';
import 'package:capgemini/domain/blocs/theme/theme.dart';
import 'package:capgemini/l10n/generated/l10n.dart';
import 'package:capgemini/ui/pages/gifts/gifts_page.dart';
import 'package:capgemini/ui/pages/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  return runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<LanguageBloc>(create: (context) => LanguageBloc()),
      BlocProvider<GiftBloc>(create: (context) => GiftBloc()),
      BlocProvider<ThemeCubit>(create: (context) => ThemeCubit()),
    ], child: const MyApp());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageBloc, LanguageState>(builder: (context, state) {
      return BlocBuilder<ThemeCubit, ThemeData>(builder: (_, theme) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: const [
            Language.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: Language.delegate.supportedLocales,
          title: "Giphy",
          initialRoute: LoginPageForm.route,
          theme: theme,
          locale: state is LanguageLoaded ? state.language : null,
          routes: {
            LoginPageForm.route: (context) => const LoginPageForm(),
            GiftsPage.route: (context) => const GiftsPage(),
          },
        );
      });
    });
  }
}
