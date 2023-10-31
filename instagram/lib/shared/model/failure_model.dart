// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class Failure with EquatableMixin implements Exception {
  Failure({required this.code, required this.message});
  final String code;
  final String message;

  // @override
  // bool get stringify => true;

  @override
  List<Object> get props => [code, message];
}
