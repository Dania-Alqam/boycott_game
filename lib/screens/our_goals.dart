import 'package:flutter/material.dart';

class OurGoalsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Our Goals'),
      ),
      body: Center(
        child: Text('our goals...', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
