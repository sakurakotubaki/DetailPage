import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

// Userモデルを定義
@freezed
class User with _$User {
  const factory User({
    required String name,
    required String email,
    required String address,
    required int personalNumber,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
