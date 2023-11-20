import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:instagram/domain/use_cases/use_case_base.dart';

part 'login_with_email_and_password_params.freezed.dart';

@freezed
class LogInWithEmailAndPasswordParams extends ParamsBase with _$LogInWithEmailAndPasswordParams {
  const factory LogInWithEmailAndPasswordParams({
    @Default('') String email,
    @Default('') String password,
  }) = _LogInWithEmailAndPasswordParams;
}
