import 'package:flutter/material.dart';
import 'package:sarathi/ui/utils/headings.dart';

Widget CustomProgressIndicator(BuildContext context) {
  return SizedBox(
    height: MediaQuery.of(context).size.height,
    child: Column(
      children: const [
        Spacer(),
        Center(
          child: CircularProgressIndicator()
        ),
        Spacer()
      ],
    ),
  );
}