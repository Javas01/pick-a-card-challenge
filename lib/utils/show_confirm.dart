import 'package:flutter/material.dart';
import 'package:mystery_app/models/models.dart';

Future<Option?> showConfirm(
  BuildContext context,
  Option option,
) {
  Future<Option?> result = showDialog<Option>(
    context: context,
    barrierDismissible: false,
    builder: (context) => AlertDialog(
      title: Text('You picked ${option.name}!'),
      actions: [
        TextButton(
          child: const Text('Eh, pick again'),
          onPressed: () {
            option.controller.toggleCard();
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: const Text('Yay! Sounds fun'),
          onPressed: () {
            Navigator.of(context).pop(option);
          },
        )
      ],
      actionsAlignment: MainAxisAlignment.spaceEvenly,
    ),
  );
  return result;
}
