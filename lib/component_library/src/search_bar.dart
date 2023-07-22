import 'package:flutter/material.dart';
import 'package:viemo/component_library/component_library.dart';
import 'package:viemo/l10n/app_localizations.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    this.controller,
    super.key,
  });

  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final l10n = AppLocalizations.of(context);
    final border = OutlineInputBorder(
      borderSide: BorderSide(width: 3, color: theme.blue),
      borderRadius: BorderRadius.circular(30),
    );
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        suffixIcon: const Icon(Icons.search),
        border: border,
        focusedBorder: border,
        labelText: l10n.searchBarLabel,
        hintText: l10n.searchBarHint,
      ),
    );
  }
}
