import 'package:flutter/material.dart';

class AppBarWidgets extends StatelessWidget {
  const AppBarWidgets({
    super.key,
    required this.title,
    required this.centerTitle,
    required this.actions,
    required this.leading,
    required this.body,
    required this.bottom,
  });

  final String title;
  final bool centerTitle;
  final List<Widget> actions;
  final PreferredSizeWidget? bottom;
  final Widget? leading;
  final Widget? body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        leading: leading,
        actions: actions,
        bottom: bottom,
        title: Text(title,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        centerTitle: centerTitle,
      ),
      body: body,
    );
  }
}
