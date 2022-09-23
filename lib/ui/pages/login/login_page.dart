import 'package:capgemini/domain/blocs/loginForm/login_form_bloc.dart';
import 'package:capgemini/l10n/generated/l10n.dart';
import 'package:capgemini/ui/pages/gifts/gifts_page.dart';
import 'package:capgemini/ui/widgets/change_language.dart';
import 'package:capgemini/ui/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class LoginPageForm extends StatelessWidget {
  const LoginPageForm({Key? key}) : super(key: key);

  static const String route = '/login';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginFormBloc(),
      child: Builder(
        builder: (context) {
          final formBloc = context.read<LoginFormBloc>();

          return LoginFormBlocView(formBloc: formBloc);
        },
      ),
    );
  }
}

class LoginFormBlocView extends StatefulWidget {
  const LoginFormBlocView({
    Key? key,
    required this.formBloc,
  }) : super(key: key);

  final LoginFormBloc formBloc;

  @override
  State<LoginFormBlocView> createState() => _LoginFormBlocViewState();
}

class _LoginFormBlocViewState extends State<LoginFormBlocView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: FormBlocListener<LoginFormBloc, String, String>(
          onSubmitting: (context, state) {
            LoadingDialog.show(context);
          },
          onSubmissionFailed: (context, state) {
            LoadingDialog.hide(context);
          },
          onSuccess: (context, state) {
            LoadingDialog.hide(context);

            Navigator.of(context).pushReplacementNamed(GiftsPage.route);
          },
          onFailure: (context, state) {
            LoadingDialog.hide(context);

            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.failureResponse!)));
          },
          child: LoginFormBody(formBloc: widget.formBloc),
        ),
      ),
    );
  }
}

class LoginFormBody extends StatelessWidget {
  const LoginFormBody({
    Key? key,
    required this.formBloc,
  }) : super(key: key);

  final LoginFormBloc formBloc;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          constraints: const BoxConstraints(maxWidth: 500),
          child: ListView(
            padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
            shrinkWrap: true,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Column(
                  children: <Widget>[
                    TextFieldBlocBuilder(
                      textFieldBloc: formBloc.username,
                      decoration: InputDecoration(
                        labelText: Language.of(context).username,
                        prefixIcon: const Icon(Icons.person),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: formBloc.submit,
                        child: Text(Language.of(context).login),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                        child: Text(Language.of(context).userWarning),
                      ),
                    ),
                  ],
                ),
              ),
              Image.asset("assets/logo/animatedLogo.gif", height: 300),
            ],
          ),
        ),
      ),
      const Positioned(
          child: Align(
              alignment: Alignment.topRight, child: ChangeLanguageWidget()))
    ]);
  }
}
