
import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';

import '../constants/constants.dart';

Future<dynamic> bottomSheetDialog(Widget child) async {
  return await showModalBottomSheet(
    context: Constants.globalContext(),
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(32)
    ),
    builder: (bottomSheetContext) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(32),
        child: Container(
          constraints: BoxConstraints(
            minHeight: 30.h,
            maxHeight: 80.h,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32),
          ),
          child: Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(bottomSheetContext).viewInsets.bottom,
            ),
            child: child,
          ),
        ),
      );
    },
  );
}
