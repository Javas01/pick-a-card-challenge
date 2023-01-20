import 'package:flutter/material.dart' hide Page;
import 'package:mystery_app/models/models.dart';

class FrontCard extends StatelessWidget {
  const FrontCard({super.key, required this.page});

  final Page page;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Container(
        width: 400,
        height: 200,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.pink),
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(page.cardImage),
          ),
        ),
      ),
    );
  }
}
