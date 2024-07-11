// ignore_for_file: file_names

import 'package:flutter/material.dart';

class IconContainer extends StatelessWidget {
  final String url;
  const IconContainer({super.key, required this.url})
      : assert(url != '');

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.0,
      width: 200,
      child: CircleAvatar(
        radius: 100.0,
        backgroundColor: Colors.transparent,
        backgroundImage: AssetImage(url),
      ),
    );
  }
}

