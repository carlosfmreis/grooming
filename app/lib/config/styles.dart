import 'package:app/config/colors.dart';
import 'package:flutter/material.dart';

class AppStyles {
  static final floatingActionButton = ButtonStyle(
    backgroundColor: WidgetStateProperty.resolveWith<Color?>((
      Set<WidgetState> states,
    ) {
      if (states.contains(WidgetState.disabled)) {
        return Colors.grey;
      }
      if (states.contains(WidgetState.pressed)) {
        return Colors.blueGrey;
      }
      return AppColors.mainColor;
    }),
  );
}
