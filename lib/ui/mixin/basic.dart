import 'package:auto_route/auto_route.dart';
import 'package:dream11_clone/styles/color.dart';
import 'package:flutter/material.dart';

mixin BasicPage<Page extends BasePage> on BaseState<Page> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      backgroundColor: AppColors.white,
      key: _scaffoldKey,
      drawerEnableOpenDragGesture: false,
      drawerEdgeDragWidth: 0,
      endDrawerEnableOpenDragGesture: false,
      appBar: isAppBarDisabled() ? null : getAppBar(context),
      body: body(context),
      floatingActionButton: getFloatingActionButton(),
      bottomNavigationBar: isFooterDisabled() ? null : bottomNavigationBar(context),
    );
  }

  PreferredSizeWidget getAppBar(BuildContext context) {
    return AppBar(
      shadowColor: AppColors.lightGrey,
      elevation: 1,
      backgroundColor: AppColors.black,
      title: const CircleAvatar(child: Icon(Icons.person)),
      flexibleSpace: getAppBarFlexibleSpace(),
      actions: getActions(context),
    );
  }

  Widget? getFloatingActionButton() {
    return null;
  }

  Widget? getAppBarFlexibleSpace() {
    return null;
  }

  Widget getPageTitle(context) {
    return const SizedBox();
  }

  Widget getPageFooter() {
    return const SizedBox.shrink();
  }

  Widget showLoader() {
    return const Center(
      child: CircularProgressIndicator(
          // color: ColorPalette.golden(context),
          ),
    );
  }

  List<Widget>? getActions(BuildContext context) {
    return [];
  }

  Widget body(BuildContext context);

  Widget bottomNavigationBar(BuildContext context) {
    return const SizedBox.shrink();
  }
}

abstract class BasePage extends StatefulWidget {
  const BasePage({super.key});
}

abstract class BaseState<Page extends BasePage> extends State<Page>
    with AutoRouteAware, AutomaticKeepAliveClientMixin<Page> {
  bool isAppBarDisabled() => false;
  bool isEndDrawerDisabled() => false;
  bool isFooterDisabled() => false;
  Color scaffoldBackgroundColor() => AppColors.white;

  AutoRouteObserver? _observer;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _observer = RouterScope.of(context).firstObserverOfType<AutoRouteObserver>();

    if (_observer != null) {
      _observer?.subscribe(this, context.routeData);
    }
  }

  @override
  void dispose() {
    super.dispose();
    _observer?.unsubscribe(this);
  }

  @override
  bool get wantKeepAlive => true;

  // only override if this is a tab page
  @override
  void didInitTabRoute(TabPageRoute? previousRoute) {}

  // only override if this is a tab page
  @override
  void didChangeTabRoute(TabPageRoute previousRoute) {}

  @override
  void didPopNext() {
    //print('${screenName()}: BasePage didPopNext');
    super.didPush();
  }

  @override
  void didPushNext() {
    //print('${screenName()}: BasePage didPushNext');
    super.didPush();
  }

  @override
  void didPush() {
    //print('${screenName()}: BasePage didPush');
    super.didPush();
  }

  @override
  void didPop() {
    //print('${screenName()}: BasePage didPop');
    super.didPop();
  }
}
