import 'package:flutter/material.dart';
import 'package:quouch_app/theme/spacing.dart';
import 'package:quouch_app/widgets/divider_block.dart';
import 'package:quouch_app/widgets/screen_header_text.dart';
import 'package:quouch_app/widgets/simple_text_tabs.dart';

class InboxPage extends StatefulWidget {
  const InboxPage({
    super.key,
  });

  @override
  State<InboxPage> createState() => _InboxPageState();
}

class _InboxPageState extends State<InboxPage> {
  late int activeTabIndex;

  @override
  void initState() {
    super.initState();
    activeTabIndex = 0;
  }

  setActiveTabIndex(int index) {
    setState(() {
      activeTabIndex = index;
    });
  }

  Widget _buildMessagesTab(ThemeData theme) {
    return Expanded(
      child: ListView(
        children: [
          Text('You have no unread messages',
              style: theme.textTheme.headlineSmall),
          Divider(),
          Text(
              "When you contact a host or send a reservation request, you'll see your messages here",
              style: theme.textTheme.labelMedium),
        ],
      ),
    );
  }

  List<Widget> _buildNotificationsTab(ThemeData theme) {
    return [
      Expanded(
        child: Align(
          alignment: Alignment(0, -.15),
          child: Text(
            "You're all caught up",
            style: theme.textTheme.headlineSmall,
          ),
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final spacing = theme.extension<AppSpacing>()!;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: spacing.lg,
            vertical: spacing.xl,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ScreenHeaderText(
                titleText: 'Inbox',
              ),
              DividerBlock(),
              SimpleTextTabs(
                labels: const ['Messages', 'Notifications'],
                onTabChange: setActiveTabIndex,
              ),
              DividerBlock(),
              [
                _buildMessagesTab(theme),
                ..._buildNotificationsTab(theme)
              ][activeTabIndex]
            ],
          ),
        ),
      ),
    );
  }
}
