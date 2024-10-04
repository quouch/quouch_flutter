import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quouch_app/pages/pages.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const HomePage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit(),
      child: const HomeView(),
    );
  }
// @override
// Widget build(BuildContext context) {
//   return const Scaffold(
//     body: Center(
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [_UserId(), _LogoutButton()],
//       ),
//     ),
//   );
// }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedTab = context.select((HomeCubit cubit) => cubit.state.tab);

    return Scaffold(
      body: IndexedStack(
        index: selectedTab.index,
        children: const [
          ExplorePage(),
          SavedPage(),
          TripPage(),
          InboxPage(),
          ProfilePage()
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _HomeTabButton(
              groupValue: selectedTab,
              value: HomeTab.explore,
              icon: const Icon(Icons.search),
            ),
            _HomeTabButton(
              groupValue: selectedTab,
              value: HomeTab.saved,
              icon: const Icon(Icons.favorite),
            ),
            _HomeTabButton(
              groupValue: selectedTab,
              value: HomeTab.trips,
              icon: const Icon(Icons.all_inclusive),
            ),
            _HomeTabButton(
              groupValue: selectedTab,
              value: HomeTab.inbox,
              icon: const Icon(Icons.chat_bubble),
            ),
            _HomeTabButton(
              groupValue: selectedTab,
              value: HomeTab.profile,
              icon: const Icon(Icons.account_circle),
            ),
          ],
        ),
      ),
    );
  }
}

class _HomeTabButton extends StatelessWidget {
  const _HomeTabButton({
    required this.groupValue,
    required this.value,
    required this.icon,
  });

  final HomeTab groupValue;
  final HomeTab value;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => context.read<HomeCubit>().setTab(value),
      iconSize: 32,
      color:
          groupValue != value ? null : Theme.of(context).colorScheme.secondary,
      icon: icon,
    );
  }
}
