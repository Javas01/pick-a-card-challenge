import 'package:flutter/material.dart' hide Page;
import 'package:mystery_app/models/models.dart';

class BackCard extends StatelessWidget {
  const BackCard({super.key, required this.option});

  final String option;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      elevation: 10,
      shadowColor: Colors.pink,
      child: SizedBox(
        width: 400,
        height: 200,
        child: Center(
          child: Text(
            option,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
        ),
      ),
    );
  }
}
