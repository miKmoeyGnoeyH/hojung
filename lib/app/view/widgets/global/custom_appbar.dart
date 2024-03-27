import 'package:flutter/material.dart';

AppBar buildAppbar(BuildContext context, String title, {bool centertitle = false, automaticallyImplyLeading = false}) {
  return AppBar(
    surfaceTintColor: Theme.of(context).colorScheme.surface,
    centerTitle: centertitle,
    automaticallyImplyLeading: automaticallyImplyLeading,
    shape: Border(
      bottom: BorderSide(
        color: Theme.of(context).colorScheme.onBackground.withOpacity(0.5),
        width: 0.3,
      ),
    ),
    titleSpacing: 26,
    title: Text(title, style: Theme.of(context).textTheme.headlineLarge),
  );
}