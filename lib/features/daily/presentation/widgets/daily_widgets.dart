import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../../../core/provider/theme_provider.dart';

class DailyWidgets extends StatelessWidget {
  const DailyWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    final _ = Provider.of<ThemeProvider>(context);
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'No data available',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push('/create-transaction'),
        child: Icon(Icons.add),
      ),
    );
  }
}
