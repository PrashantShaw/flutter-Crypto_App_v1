import 'package:crypto_app_01/resources/providers/theme_provider.dart';
import 'package:crypto_app_01/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

Drawer rootDrawer(BuildContext context) {
  final CAppThemeProvider cAppThemeProvider = context.read<CAppThemeProvider>();

  return Drawer(
    width: MediaQuery.sizeOf(context).width * 0.85,
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        Container(
          decoration: const BoxDecoration(color: Colors.amber),
          height: 160,
          padding: EdgeInsets.only(top: 16),
          child: Center(
            child: Text(
              'Crypto App',
              style: textStyle(24, Colors.black, FontWeight.w600),
            ),
          ),
        ),
        const SizedBox(height: 24),
        ListTile(
          leading: Icon(Icons.person_outline_rounded),
          title: Text('My Profile'),
          onTap: () {},
          trailing: Icon(
            Icons.arrow_forward_ios,
            size: 14,
          ),
        ),
        ListTile(
          leading: Icon(Icons.wallet_travel_outlined),
          title: Text('Wallet'),
          onTap: () {},
          trailing: Icon(
            Icons.arrow_forward_ios,
            size: 14,
          ),
        ),
        ListTile(
          leading: Icon(Icons.login_outlined),
          title: Text('Logout'),
          onTap: () {},
          trailing: Icon(
            Icons.arrow_forward_ios,
            size: 14,
          ),
        ),
        ListTile(
          leading: Icon(Icons.color_lens),
          title: Text('Dark Theme'),
          onTap: () {},
          trailing: Switch(
              value: context.watch<CAppThemeProvider>().isDark,
              onChanged: (val) {
                cAppThemeProvider.toggleCAppTheme();
              }),
        ),
      ],
    ),
  );
}
