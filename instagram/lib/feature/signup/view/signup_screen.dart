import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:instagram/feature/auth/data/auth_repo_base.dart';
import 'package:instagram/feature/signup/cubit/signup_cubit.dart';
import 'package:instagram/app/l10n/l10n.dart';
import 'package:instagram/shared/widget/error_dialog.dart';
import 'package:instagram/shared/widget/primary_button.dart';
import 'package:instagram/shared/widget/tertiary_button.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  static const String routeName = '/signup';

  static Route<dynamic> route() => MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (context) => BlocProvider<SignupCubit>(
          create: (_) => SignupCubit(
            authRepo: context.read<AuthRepoBase>(),
          ),
          child: SignupScreen(),
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
        child: BlocConsumer<SignupCubit, SignupState>(
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
                              decoration: InputDecoration(hintText: context.l10n.usernameFieldHintText),
                              onChanged: (value) => context.read<SignupCubit>().usernameChanged(value),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(),
                                FormBuilderValidators.minLength(6),
                              ]),
                            ),
                            const SizedBox(height: 12),
                            TextFormField(
                              decoration: InputDecoration(hintText: context.l10n.emailFieldHintText),
                              onChanged: (value) => context.read<SignupCubit>().emailChanged(value),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(),
                                FormBuilderValidators.email(),
                              ]),
                            ),
                            const SizedBox(height: 12),
                            TextFormField(
                              obscureText: true,
                              decoration: InputDecoration(hintText: context.l10n.passwordFieldHintText),
                              onChanged: (value) => context.read<SignupCubit>().passwordChanged(value),
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
                              title: context.l10n.signupButtonText,
                            ),
                            const SizedBox(height: 12),
                            TertiaryButton(
                              onPressed: () => Navigator.of(context).pop(),
                              title: context.l10n.toLoginButtonText,
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
      context.read<SignupCubit>().signUpWithCredentials();
    }
  }
}