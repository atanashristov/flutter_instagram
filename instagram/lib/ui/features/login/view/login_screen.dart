import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import 'package:instagram/app/l10n/l10n.dart';
import 'package:instagram/domain/repositories/auth_repository.dart';
import 'package:instagram/domain/use_cases/login_with_email_and_password/login_with_email_and_password.dart';
import 'package:instagram/ui/constants/constants.dart';
import 'package:instagram/ui/features/login/cubit/login_cubit.dart';
import 'package:instagram/ui/features/signup/view/signup_screen.dart';
import 'package:instagram/ui/widgets/buttons/buttons.dart';
import 'package:instagram/ui/widgets/dialogs/dialogs.dart';

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
            logInWithEmailAndPassword: LogInWithEmailAndPassword(
              authRepository: context.read<AuthRepository>(),
            ),
          ),
          child: LoginScreen(),
        ),
      );

  // Form key needed for validations
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state.status.isError) {
              ErrorDialog.showFailure(context, failure: state.failure);
            }
          },
          builder: (context, state) {
            return Scaffold(
              resizeToAvoidBottomInset: false,
              body: Center(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: SingleChildScrollView(
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
                              kGapVM,
                              TextFormField(
                                decoration: InputDecoration(hintText: context.l10n.emailFieldHintText),
                                onChanged: (value) => context.read<LoginCubit>().emailChanged(value),
                                // autovalidateMode: AutovalidateMode.always,
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(),
                                  FormBuilderValidators.email(),
                                ]),
                              ),
                              kGapVM,
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
                              kGapVXL,
                              PrimaryButton(
                                context.l10n.loginButtonText,
                                onPressed: () => _submitForm(context, state.status.isSubmitting),
                              ),
                              kGapVM,
                              TertiaryButton(
                                context.l10n.toSignupButtonText,
                                onPressed: () => Navigator.of(context).pushNamed(SignupScreen.routeName),
                              ),
                            ],
                          ),
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
