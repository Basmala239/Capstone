import 'package:flutter/material.dart';

Future<bool> showExitDialog(BuildContext context) async {
  bool conform =false;
  await showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Row(
          children: const [
            Icon(Icons.help_outline, color: Colors.blue),
            SizedBox(width: 10),
            Text('Confirm Deleting'),
          ],
        ),
        content: const Text('Are you sure you want to delete user?'),
        actions: [
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
            ),
            onPressed: () {
              conform =true;
              Navigator.of(context).pop();
            },
            child: const Text('Delete'),
          ),
          TextButton(
            onPressed: () {
              conform =false;
              Navigator.of(context).pop();
            },
            child: const Text('Cancel'),
          ),
        ],
      );
    },
  );
  return conform;
}