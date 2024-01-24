import 'package:freezed_annotation/freezed_annotation.dart';

part 'state.freezed.dart';

@freezed
class HomePageState with _$HomePageState {
  const factory HomePageState({
    @Default(0) int num,
  }) = _HomePageState;
}

/// Freezedはイミュータブルなクラスを作成するパッケージです。
/// このクラスは、変数が変更される際にインスタンスが再作成されます。
