import 'package:flutter/material.dart' hide Page;
import 'package:mystery_app/models/models.dart';
import 'dart:io';

class SummaryPage extends StatelessWidget {
  const SummaryPage({super.key, required this.pages});

  final List<Page> pages;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Birthday Summary'),
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        padding: const EdgeInsets.all(25),
        children: pages
            .skip(1)
            .map(
              (page) => Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Text(
                      '${page.title} - ${page.selectedOption}',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: Image.file(
                        File(page.imagePath),
                      ),
                    ),
                  ],
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
