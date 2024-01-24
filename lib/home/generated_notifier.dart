import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'state.dart';

/// 自動生成されるファイルの名前を決めます。規則があるので、それぞれのパッケージのドキュメントを確認してください。
part 'generated_notifier.g.dart';

/// riverpod_generatorで書いた場合
/// notifier.dartのものと同じものです。短縮版だと思ってください。

@riverpod
class HomePageGeneratedNotifier extends _$HomePageGeneratedNotifier {
  // このクラスのインスタンスが作成されたときに実行されるメソッド
  @override
  HomePageState build() {
    return const HomePageState();
  }

  void plus() async {
    state = state.copyWith(num: state.num + 1);
  }

  void minus() async {
    if ((state.num - 1) < 0) return;
    state = state.copyWith(num: state.num - 1);
  }
}
