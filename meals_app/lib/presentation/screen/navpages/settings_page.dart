import 'package:flutter/material.dart';
import 'package:meals_app/components/app_theme_color.dart';
import 'package:meals_app/state/theme_provider.dart';
import 'package:meals_app/widgets/app_text.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppThemeState providerTheme = Provider.of<AppThemeState>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const AppText.normal(
          text: "Settings",
          color: kBackgroundColor,
        ),
      ),
      body: Column(
        children: [
          ListTile(
            title: AppText.card(
              text: "Change Theme Color",
              color: providerTheme.selecteState == true ? Colors.grey.shade700 : Colors.white,
            ),
            trailing: IconButton(
              onPressed: () {
                providerTheme.toggleStatus();
              },
              icon: Icon(
                Icons.change_circle_sharp,
                size: 30,
                color: providerTheme.selecteState == true ? Colors.grey.shade700 : Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
