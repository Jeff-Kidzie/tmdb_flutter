import 'package:flutter/material.dart';

class DetailMovie extends StatelessWidget {
  const DetailMovie({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text('Detail Movie Screen'),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Go Back'),
        ),
      ],
    );
  }
}
