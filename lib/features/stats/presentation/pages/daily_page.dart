import 'package:flutter/material.dart';

class DailyPage extends StatelessWidget {
  const DailyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daily Page'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('Daily Page'),
      ),
    );
  }
}
