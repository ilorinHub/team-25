import 'package:flutter/material.dart';
import 'package:machineglow/shared/resources/resources.dart';
import 'package:machineglow/shared/widgets/header_texts.dart';

class GlowButtonAppBar extends StatelessWidget implements PreferredSizeWidget {
  const GlowButtonAppBar({
    Key? key,
    this.title = '',
    this.hasBackHome = false,
    this.centerTile,
    this.actions,
    this.titleWidget,
  }) : super(key: key);
  final String? title;
  final bool? hasBackHome, centerTile;
  final List<Widget>? actions;
  final Widget? titleWidget;

  @override
  Widget build(BuildContext context) {
    return AppBar(
        centerTitle: centerTile ?? true,
        backgroundColor: kbackgroundColor,
        automaticallyImplyLeading: hasBackHome!,
        actions: actions,
        title: titleWidget ??
            GlowThemeHeaderText(
              title: title!,
            ));
  }

  @override
  Size get preferredSize => Size.fromHeight((buttonHeight));
}
