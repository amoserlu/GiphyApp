import 'package:capgemini/domain/blocs/language/language_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class ChangeLanguageWidget extends StatelessWidget {
  const ChangeLanguageWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Image esp = Image.asset('icons/flags/png/es.png',
        package: 'country_icons', scale: 2);
    Image us = Image.asset('icons/flags/png/us.png',
        package: 'country_icons', scale: 2);
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          us,
          Switch(
            value: Localizations.localeOf(context) == const Locale('es')
                ? true
                : false,
            onChanged: (value) {
              context.read<LanguageBloc>().add(ChangeLanguage(
                  value ? const Locale("es") : const Locale("en")));
            },
          ),
          esp
        ],
      ),
    );
  }
}
