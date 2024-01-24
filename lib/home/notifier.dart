import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'state.dart';

/// こちらがriverpod_generatorを使わずに書いた場合になります。

// StateNotifierをProviderに持たせる、AutoDisposeにすることで参照がなくなるとインスタンスが破棄されメモリの節約になります。
final homePageNotifierProvider =
    AutoDisposeStateNotifierProvider<HomePageNotifier, HomePageState>((ref) {
  return HomePageNotifier();
});

// StateNotifierは、Stateが変更される（新たなインスタンスを作成）ことを検知して画面の再描画が起こすことができます。
class HomePageNotifier extends StateNotifier<HomePageState> {
  HomePageNotifier() : super(const HomePageState());

  // StateNotifierはclassなので、Stateを操作するクラスメソッドを書くことができる。
  void plus() async {
    state = state.copyWith(num: state.num + 1);
    // copyWithは、stateの持っている変数の値を変更したインスタンスを作成することができます。
    // そのインスタンスをStateNotifierのもつstateに代入することで、インスタンスが変更される=>再描画が起こるとなります。
  }

  void minus() async {
    if ((state.num - 1) < 0) return;
    state = state.copyWith(num: state.num - 1);
  }
}
