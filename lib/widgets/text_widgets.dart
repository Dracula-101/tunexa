import 'package:flutter/widgets.dart';
import 'package:tunexa/decorations/decoration.dart';
import 'package:tunexa/decorations/styles.dart';

Padding headerTitle(String title) {
  return Padding(
    padding: EdgeInsets.only(
      top: 1.5 * kPadding,
      left: kPadding / 2,
      bottom: kPadding / 2,
    ),
    child: Text(
      title,
      style: header,
    ),
  );
}
