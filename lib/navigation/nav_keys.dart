import 'package:flutter/material.dart';

class NavKeys {
  static final GlobalKey<NavigatorState> homeNav = GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> statsNav = GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> communityNav = GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> achievementsNav = GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> profileNav = GlobalKey<NavigatorState>();

  static final List<GlobalKey<NavigatorState>> keys = [
    homeNav,
    statsNav,
    communityNav,
    achievementsNav,
    profileNav,
  ];
}
