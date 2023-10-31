import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:instagram/feature/auth/data/auth_repo_base.dart';
import 'package:instagram/feature/login/cubit/login_cubit.dart';
import 'package:instagram/feature/signup/view/signup_screen.dart';
import 'package:instagram/app/l10n/l10n.dart';
import 'package:instagram/shared/widget/error_dialog.dart';
import 'package:instagram/shared/widget/primary_button.dart';
import 'package:instagram/shared/widget/tertiary_button.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  static const String routeName = '/login';

  // Use `PageRouteBuilder` with `transitionDuration = 0`
  // so that the login appears above the splash screen
  static Route<dynamic> route() => PageRouteBuilder(
        settings: const RouteSettings(name: routeName),
        transitionDuration: Duration.zero,
        pageBuilder: (context, _, __) => BlocProvider<LoginCubit>(
          create: (_) => LoginCubit(
            authRepo: context.read<AuthRepoBase>(),
          ),
          child: LoginScreen(),
        ),
      );

  // Form key needed for validations
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state.status.isError) {
              showDialog<AlertDialog>(
                context: context,
                builder: (context) => ErrorDialog(message: state.failure?.message),
              );
            }
          },
          builder: (context, state) {
            return Scaffold(
              resizeToAvoidBottomInset: false,
              body: Center(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Card(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              context.l10n.appPromptTitle,
                              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 12),
                            TextFormField(
                              decoration: InputDecoration(hintText: context.l10n.emailFieldHintText),
                              onChanged: (value) => context.read<LoginCubit>().emailChanged(value),
                              // autovalidateMode: AutovalidateMode.always,
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(),
                                FormBuilderValidators.email(),
                              ]),
                            ),
                            const SizedBox(height: 12),
                            TextFormField(
                              obscureText: true,
                              decoration: InputDecoration(hintText: context.l10n.passwordFieldHintText),
                              onChanged: (value) => context.read<LoginCubit>().passwordChanged(value),
                              // autovalidateMode: AutovalidateMode.always,
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(),
                                FormBuilderValidators.minLength(6),
                                // FormBuilderValidators.match(
                                //   r'^(?=(.*[a-z]){1,})(?=(.*[A-Z]){1,})(?=(.*[0-9]){1,})$',
                                //   errorText: context.l10n.passwordFieldValidationError,
                                // ), // https://stackoverflow.com/questions/5142103/regex-to-validate-password-strength
                              ]),
                            ),
                            const SizedBox(height: 20),
                            PrimaryButton(
                              onPressed: () => _submitForm(context, state.status.isSubmitting),
                              title: context.l10n.loginButtonText,
                            ),
                            const SizedBox(height: 12),
                            TertiaryButton(
                              onPressed: () => Navigator.of(context).pushNamed(SignupScreen.routeName),
                              title: context.l10n.toSignupButtonText,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _submitForm(BuildContext context, bool isSubmitting) {
    if ((_formKey.currentState?.validate() ?? false) && !isSubmitting) {
      context.read<LoginCubit>().logInWithCredentials();
    }
  }
}
