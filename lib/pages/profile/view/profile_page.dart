import 'package:cloudinary_flutter/image/cld_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quouch_app/mocks/users.dart';
import 'package:quouch_app/pages/authentication/authentication.dart';
import 'package:quouch_app/theme/theme.dart';
import 'package:quouch_app/widgets/widgets.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    var profile = testProfile;
    var theme = Theme.of(context);
    final spacing = theme.extension<AppSpacing>()!;
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
            backgroundColor: Colors.white,
            toolbarHeight: 125,
            title: Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
              CircleAvatar(
                radius: 32,
                backgroundImage: NetworkImage(profile.profileImageUrl),
              ),
              DividerBlock.vertical('md'),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(profile.name, style: theme.textTheme.headlineMedium),
                DividerBlock.vertical('xs'),
                Text('Show Profile',
                    style: theme.textTheme.bodySmall!
                        .copyWith(color: theme.primaryColor)),
                DividerBlock.vertical('thin')
              ])
            ])),
        SliverList(
            delegate: SliverChildListDelegate([
          Padding(
            padding: EdgeInsets.symmetric(horizontal: spacing.lg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSectionTitle('Account settings'),
                _UserId(),
                const ProfileListTile(
                    label: 'Personal Information',
                    iconData: Icons.person_outline),
                const ProfileListTile(
                  label: 'Payments and payouts',
                  iconData: Icons.payments_outlined,
                ),
                const ProfileListTile(
                  label: 'Notifications',
                  iconData: Icons.notifications_outlined,
                ),
                _buildSectionTitle('Hosting'),
                const ProfileListTile(
                  label: 'Learn about hosting',
                  iconData: Icons.home_outlined,
                ),
                const ProfileListTile(
                    label: 'List your space',
                    iconData: Icons.add_business_outlined),
                const ProfileListTile(
                  label: 'Host an experience',
                  iconData: Icons.beach_access_outlined,
                ),
                _buildSectionTitle('Referrals & Credits'),
                const ProfileListTile(
                  label: 'Gift cards',
                  subtitle: 'Send or redeem a gift card',
                  iconData: Icons.card_giftcard_outlined,
                ),
                const ProfileListTile(
                  label: 'Refer a Host',
                  subtitle: 'Earn \$15 for every new host you refer',
                  iconData: Icons.attach_money_outlined,
                ),
                _buildSectionTitle('Tools'),
                const ProfileListTile(
                  label: 'Siri settings',
                  iconData: Icons.keyboard_voice_outlined,
                ),
                _buildSectionTitle('Support'),
                const ProfileListTile(
                  label: 'How FlutterUI works',
                  iconData: Icons.card_travel_outlined,
                ),
                const ProfileListTile(
                  label: 'Safety Center',
                  subtitle:
                      'Get the support, tools, and information you need to be safe',
                  iconData: Icons.shield,
                ),
                const ProfileListTile(
                  label: 'Contact Neighborhood Support',
                  subtitle:
                      'Let our team know about concerns related to home sharing activity in your area.',
                  iconData: Icons.question_answer_outlined,
                ),
                const ProfileListTile(
                  label: 'Get help',
                  iconData: Icons.help_outline,
                ),
                const ProfileListTile(
                  label: 'Give us feedback',
                  iconData: Icons.feedback_outlined,
                ),
                _buildSectionTitle('Legal'),
                const ProfileListTile(
                  label: 'Terms of Service',
                ),
                DividerBlock(),
                ProfileListTile(
                  label: 'Log out',
                  labelColor: Colors.teal,
                  onTap: () {
                    context
                        .read<AuthenticationBloc>()
                        .add(AuthenticationLogoutPressed());
                  },
                ),
                DividerBlock(),
                Center(
                  child: Text(
                    'VERSION 1.0.0',
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ),
                Center(
                  heightFactor: 1.5,
                  child: CldImageWidget(
                    publicId: 'v1680011936/logo',
                    height: 40,
                  ),
                ),
                DividerBlock(),
              ],
            ),
          ),
        ]))
      ],
    ));
  }

  Widget _buildSectionTitle(String label) {
    return Column(
      children: [
        const SizedBox(height: 24),
        Text(
          label,
          style: const TextStyle(fontSize: 12),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}

class ProfileListTile extends StatelessWidget {
  const ProfileListTile(
      {required this.label,
      this.labelColor = Colors.black,
      this.subtitle,
      this.iconData,
      this.onTap,
      super.key});

  final String label;
  final Color labelColor;
  final String? subtitle;
  final IconData? iconData;
  final Function? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: onTap as void Function()?,
          contentPadding: EdgeInsets.zero,
          title: Text(
            label,
            style: TextStyle(fontSize: 18, color: labelColor),
          ),
          subtitle: subtitle != null ? Text(subtitle!) : null,
          trailing: iconData != null
              ? Icon(
                  iconData,
                  color: Colors.grey[900],
                  size: 36,
                )
              : null,
        ),
        const Divider(thickness: .75),
      ],
    );
  }
}

class _UserId extends StatelessWidget {
  const _UserId();

  @override
  Widget build(BuildContext context) {
    final userId = context.select(
      (AuthenticationBloc bloc) => bloc.state.user.id,
    );

    return Text('UserID: $userId');
  }
}
