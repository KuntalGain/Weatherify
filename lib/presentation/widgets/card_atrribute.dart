import 'package:flutter/material.dart';

import '../../constants/theme.dart';

Widget cardAttribute(String attr, String value, String imageId) {
  return Row(
    children: [
      // icon & wind
      Row(
        children: [
          const SizedBox(
            width: 60,
          ),
          Image.asset(imageId),
          const SizedBox(
            width: 15,
          ),
          Text(
            attr,
            style: AppTheme.attributes,
          ),
          const Text(
            '   |   ',
            style: AppTheme.attributes,
          ),
          Text(
            value,
            style: AppTheme.attributes,
          ),
        ],
      ),
    ],
  );
}
