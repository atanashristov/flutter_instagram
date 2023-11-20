import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:instagram/domain/entities/user.dart';
import 'package:instagram/domain/use_cases/use_case_base.dart';

part 'update_user_params.freezed.dart';

@freezed
class UpdateUserParams extends ParamsBase with _$UpdateUserParams {
  const factory UpdateUserParams({
    @Default(User.empty) User user,
  }) = _UpdateUserParams;
}
