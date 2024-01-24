import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'notifier.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = homePageNotifierProvider;
    // final provider = homePageGeneratedNotifierProvider;

    print('>>>>> Home Page Build <<<<<');

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Riverpod Test'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            const NumArea(),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: () => ref.read(provider.notifier).plus(),
                  tooltip: 'Increment',
                  child: const Icon(Icons.add),
                ),
                const SizedBox(width: 32),
                FloatingActionButton(
                  onPressed: () => ref.read(provider.notifier).minus(),
                  tooltip: 'decrement',
                  child: const Icon(Icons.remove),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

// 番号を表示している部分だけを別のWidgetに分けました。
// この場合、番号が増減したときに、再buildされるのは、この部分だけになり、
// そのほかの変更されていない部分は、再buildはされません。
// 増減させたときに、printされる文字列を確認してみてください。
class NumArea extends ConsumerWidget {
  const NumArea({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homePageNotifierProvider);
    // final state = ref.watch(homePageGeneratedNotifierProvider);

    print('>>>>> Num Area Build <<<<<');

    return Text(
      '${state.num}',
      style: Theme.of(context).textTheme.headlineMedium,
    );
  }
}
