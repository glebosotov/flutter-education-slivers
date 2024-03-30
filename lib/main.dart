import 'package:flutter/material.dart';

import 'app_bar.dart';
import 'gpt_items/gpt_items.dart';

void main() {
  runApp(const _App());
}

class _App extends StatelessWidget {
  const _App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SliverPage(),
    );
  }
}

class SliverPage extends StatelessWidget {
  const SliverPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              delegate: SliverSearchAppBar(),
              pinned: true,
            ),
            SliverList.builder(
              itemBuilder: (context, _) => const RandomDataListItem(),
              itemCount: 40,
            ),
            SliverToBoxAdapter(
              child: LimitedBox(
                maxHeight: 60,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, _) => const FlutterLogoTilesWidget(),
                ),
              ),
            ),
            SliverGrid.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
              ),
              itemBuilder: (context, _) => const AnimatedBackgroundWidget(),
              itemCount: 10,
            ),
          ],
        ),
      ),
    );
  }
}
