import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/provider/theme_provider.dart';
import '../../../../shared/widgets/app_btn_widgets.dart';

class WeeklyWidgets extends StatelessWidget {
  const WeeklyWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Center(
      child: Column(
        children: [
          SwitchListTile(
            title: const Text('Enable Mode Toggle'),
            value: themeProvider.themeMode == ThemeMode.dark,
            onChanged: (value) => themeProvider.toggleTheme(),
          ),
          //call app btn widget here
          AppBtnWidgets(onClick: () {}, text: 'click me!'),
        ],
      ),
    );
  }
}
