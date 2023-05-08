import 'package:flutter/material.dart';
import 'package:sarathi/ui/utils/headings.dart';

Widget someOtherPackageSubscribed(BuildContext context) {
  return SizedBox(
    height: MediaQuery.of(context).size.height,
    child: Column(
      children: [
        const Spacer(),
        Center(
          child: Text(
            "Some other package subscribed",
            textAlign: TextAlign.center,
            style: heading2,
          ),
        ),
        const Spacer()
      ],
    ),
  );
}
