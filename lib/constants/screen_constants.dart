// lib/utils/screen_utils.dart

import 'package:flutter/material.dart';

bool isMobileScreen(BuildContext context, {double threshold = 600}) {
  return MediaQuery.of(context).size.width < threshold;
}
