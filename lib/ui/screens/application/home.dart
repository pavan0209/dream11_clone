import 'package:auto_route/auto_route.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:dream11_clone/ui/mixin/index.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HomePage extends BasePage {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends BaseState<HomePage> with BasicPage {
  @override
  Widget body(BuildContext context) {
    final router = AutoRouter.of(context);
    final translate = AppLocalizations.of(context)!;
    return Center(
      child: Text('Hello'),
    );
  }
}
