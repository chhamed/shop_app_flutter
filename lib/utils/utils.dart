import 'package:flutter/material.dart';

class Utils {
  static void pushScreen(BuildContext context, Widget widget) {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        isScrollControlled: true,
        enableDrag: false,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (_) => FractionallySizedBox(
              heightFactor: 0.8,
              child: widget,
            ));
  }
}
