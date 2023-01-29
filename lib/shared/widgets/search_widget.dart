import 'package:flutter/material.dart';
import 'package:machineglow/core/viewmodels/view_models.dart';
import 'package:machineglow/shared/resources/resources.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    Key? key,
    required this.glowthemeData,
  }) : super(key: key);
  final GlowThemeViewModel glowthemeData;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: (horizontalPadding),
        top: (smallVerticalPadding) * 0.1,
        bottom: (smallVerticalPadding) * 0.1,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          (buttonBorderRadius),
        ),
        color: kprimaryColorLight,
      ),
      child: Row(
        children: [
          Icon(
            Icons.search,
            color: kprimaryColor,
            size: (screenpadding),
          ),
          Expanded(
              child: TextField(
            decoration: InputDecoration(
              hintText: 'Search Asset',
              hintStyle: glowthemeData.textTheme().bodyText2,
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
            ),
          )),
        ],
      ),
    );
  }
}
