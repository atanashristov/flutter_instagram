import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:instagram/domain/use_cases/use_case_base.dart';

part 'signup_with_email_and_password_params.freezed.dart';

@freezed
class SignUpWithEmailAndPasswordParams extends ParamsBase with _$SignUpWithEmailAndPasswordParams {
  const factory SignUpWithEmailAndPasswordParams({
    @Default('') String username,
    @Default('') String email,
    @Default('') String password,
  }) = _SignUpWithEmailAndPasswordParams;
}
