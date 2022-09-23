import 'package:capgemini/l10n/generated/l10n.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class LoginFormBloc extends FormBloc<String, String> {
  final username = TextFieldBloc();

  LoginFormBloc() {
    addFieldBlocs(fieldBlocs: [username]);
    username.addAsyncValidators(
      [_checkUsername],
    );
  }

  Future<String?> _checkUsername(String? username) async {
    if (username?.toLowerCase() != 'user') {
      return Language.current.tipUser;
    }
    return null;
  }

  @override
  void onSubmitting() async {
    try {
      await Future<void>.delayed(const Duration(milliseconds: 500));
      emitSuccess();
    } catch (e) {
      emitFailure();
    }
  }
}
