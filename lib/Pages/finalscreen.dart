import 'package:flutter/material.dart';

class screen2 extends StatelessWidget {
  int col_id;
  String col_name;
  int col_year;
  int col_sem;

   screen2({
    required this.col_id,
    required this.col_name,
    required this.col_year,
    required this.col_sem,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("${col_id},${col_name},${col_year},${col_sem}"

        ),
      ),
    );
  }
}