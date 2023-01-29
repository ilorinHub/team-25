import 'package:flutter/material.dart';
import 'package:machineglow/core/viewmodels/view_models.dart';
import 'package:machineglow/shared/resources/resources.dart';
import 'package:provider/provider.dart';

class GlowThemeHeaderText extends StatelessWidget {
  const GlowThemeHeaderText({
    Key? key,
    required this.title,
    this.description,
    this.subtitle,
    this.richText = false,
  }) : super(key: key);
  final String title;
  final String? description;
  final String? subtitle;
  final bool? richText;

  @override
  Widget build(BuildContext context) {
    final glowthemeData = Provider.of<GlowThemeViewModel>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        VerticalSpacing((verticalPadding)),
        Text(
          title,
          style: glowthemeData.textTheme().headline1,
        ),
        VerticalSpacing((smallVerticalPadding) / 2),
        if (description != null)
          Padding(
            padding: EdgeInsets.only(
              right: (screenpadding),
            ),
            child: Text(
              description!,
              textAlign: TextAlign.start,
              style: glowthemeData.textTheme().bodyText1?.copyWith(
                    fontSize: (textFontSize * 0.9),
                  ),
            ),
          ),
        VerticalSpacing(
          (screenpadding),
        ),
      ],
    );
  }
}
