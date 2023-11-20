import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:instagram/domain/use_cases/use_case_base.dart';

part 'get_user_params.freezed.dart';

@freezed
class GetUserParams extends ParamsBase with _$GetUserParams {
  const factory GetUserParams({
    @Default('') String userId,
  }) = _GetUserParams;
}
