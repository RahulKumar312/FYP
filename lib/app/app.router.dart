// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i18;
import 'package:flutter/material.dart';
import 'package:servant_industry_hiring/ui/views/addpass/addpass_view.dart'
    as _i9;
import 'package:servant_industry_hiring/ui/views/addpic/addpic_view.dart'
    as _i8;
import 'package:servant_industry_hiring/ui/views/admin/admin_view.dart' as _i11;
import 'package:servant_industry_hiring/ui/views/categoryslector/categoryslector_view.dart'
    as _i7;
import 'package:servant_industry_hiring/ui/views/chat/allchat/allchat_view.dart'
    as _i16;
import 'package:servant_industry_hiring/ui/views/chat/chating/chating_view.dart'
    as _i15;
import 'package:servant_industry_hiring/ui/views/hire/hire_view.dart' as _i12;
import 'package:servant_industry_hiring/ui/views/home/home_view.dart' as _i2;
import 'package:servant_industry_hiring/ui/views/login/login_view.dart' as _i5;
import 'package:servant_industry_hiring/ui/views/login_singup/login_singup_view.dart'
    as _i4;
import 'package:servant_industry_hiring/ui/views/otp/otp_view.dart' as _i10;
import 'package:servant_industry_hiring/ui/views/plans/plans_view.dart' as _i17;
import 'package:servant_industry_hiring/ui/views/showusers/showusers_view.dart'
    as _i13;
import 'package:servant_industry_hiring/ui/views/singnup/singnup_view.dart'
    as _i6;
import 'package:servant_industry_hiring/ui/views/startup/startup_view.dart'
    as _i3;
import 'package:servant_industry_hiring/ui/views/wallet/wallet_view.dart'
    as _i14;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i19;

class Routes {
  static const homeView = '/home-view';

  static const startupView = '/startup-view';

  static const loginSingupView = '/login-singup-view';

  static const loginView = '/login-view';

  static const singnupView = '/singnup-view';

  static const categoryslectorView = '/categoryslector-view';

  static const addpicView = '/addpic-view';

  static const addpassView = '/addpass-view';

  static const otpView = '/otp-view';

  static const adminView = '/admin-view';

  static const hireView = '/hire-view';

  static const showusersView = '/showusers-view';

  static const walletView = '/wallet-view';

  static const chatingView = '/chating-view';

  static const allchatView = '/allchat-view';

  static const plansView = '/plans-view';

  static const all = <String>{
    homeView,
    startupView,
    loginSingupView,
    loginView,
    singnupView,
    categoryslectorView,
    addpicView,
    addpassView,
    otpView,
    adminView,
    hireView,
    showusersView,
    walletView,
    chatingView,
    allchatView,
    plansView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.homeView,
      page: _i2.HomeView,
    ),
    _i1.RouteDef(
      Routes.startupView,
      page: _i3.StartupView,
    ),
    _i1.RouteDef(
      Routes.loginSingupView,
      page: _i4.LoginSingupView,
    ),
    _i1.RouteDef(
      Routes.loginView,
      page: _i5.LoginView,
    ),
    _i1.RouteDef(
      Routes.singnupView,
      page: _i6.SingnupView,
    ),
    _i1.RouteDef(
      Routes.categoryslectorView,
      page: _i7.CategoryslectorView,
    ),
    _i1.RouteDef(
      Routes.addpicView,
      page: _i8.AddpicView,
    ),
    _i1.RouteDef(
      Routes.addpassView,
      page: _i9.AddpassView,
    ),
    _i1.RouteDef(
      Routes.otpView,
      page: _i10.OtpView,
    ),
    _i1.RouteDef(
      Routes.adminView,
      page: _i11.AdminView,
    ),
    _i1.RouteDef(
      Routes.hireView,
      page: _i12.HireView,
    ),
    _i1.RouteDef(
      Routes.showusersView,
      page: _i13.ShowusersView,
    ),
    _i1.RouteDef(
      Routes.walletView,
      page: _i14.WalletView,
    ),
    _i1.RouteDef(
      Routes.chatingView,
      page: _i15.ChatingView,
    ),
    _i1.RouteDef(
      Routes.allchatView,
      page: _i16.AllchatView,
    ),
    _i1.RouteDef(
      Routes.plansView,
      page: _i17.PlansView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.HomeView: (data) {
      return _i18.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.HomeView(),
        settings: data,
      );
    },
    _i3.StartupView: (data) {
      return _i18.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.StartupView(),
        settings: data,
      );
    },
    _i4.LoginSingupView: (data) {
      return _i18.MaterialPageRoute<dynamic>(
        builder: (context) => const _i4.LoginSingupView(),
        settings: data,
      );
    },
    _i5.LoginView: (data) {
      return _i18.MaterialPageRoute<dynamic>(
        builder: (context) => const _i5.LoginView(),
        settings: data,
      );
    },
    _i6.SingnupView: (data) {
      return _i18.MaterialPageRoute<dynamic>(
        builder: (context) => const _i6.SingnupView(),
        settings: data,
      );
    },
    _i7.CategoryslectorView: (data) {
      return _i18.MaterialPageRoute<dynamic>(
        builder: (context) => const _i7.CategoryslectorView(),
        settings: data,
      );
    },
    _i8.AddpicView: (data) {
      return _i18.MaterialPageRoute<dynamic>(
        builder: (context) => const _i8.AddpicView(),
        settings: data,
      );
    },
    _i9.AddpassView: (data) {
      return _i18.MaterialPageRoute<dynamic>(
        builder: (context) => const _i9.AddpassView(),
        settings: data,
      );
    },
    _i10.OtpView: (data) {
      final args = data.getArgs<OtpViewArguments>(nullOk: false);
      return _i18.MaterialPageRoute<dynamic>(
        builder: (context) => _i10.OtpView(key: args.key, id: args.id),
        settings: data,
      );
    },
    _i11.AdminView: (data) {
      return _i18.MaterialPageRoute<dynamic>(
        builder: (context) => const _i11.AdminView(),
        settings: data,
      );
    },
    _i12.HireView: (data) {
      return _i18.MaterialPageRoute<dynamic>(
        builder: (context) => const _i12.HireView(),
        settings: data,
      );
    },
    _i13.ShowusersView: (data) {
      final args = data.getArgs<ShowusersViewArguments>(nullOk: false);
      return _i18.MaterialPageRoute<dynamic>(
        builder: (context) => _i13.ShowusersView(key: args.key, cat: args.cat),
        settings: data,
      );
    },
    _i14.WalletView: (data) {
      return _i18.MaterialPageRoute<dynamic>(
        builder: (context) => const _i14.WalletView(),
        settings: data,
      );
    },
    _i15.ChatingView: (data) {
      final args = data.getArgs<ChatingViewArguments>(nullOk: false);
      return _i18.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i15.ChatingView(key: args.key, id: args.id, did: args.did),
        settings: data,
      );
    },
    _i16.AllchatView: (data) {
      return _i18.MaterialPageRoute<dynamic>(
        builder: (context) => const _i16.AllchatView(),
        settings: data,
      );
    },
    _i17.PlansView: (data) {
      return _i18.MaterialPageRoute<dynamic>(
        builder: (context) => const _i17.PlansView(),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class OtpViewArguments {
  const OtpViewArguments({
    this.key,
    required this.id,
  });

  final _i18.Key? key;

  final String id;

  @override
  String toString() {
    return '{"key": "$key", "id": "$id"}';
  }

  @override
  bool operator ==(covariant OtpViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.id == id;
  }

  @override
  int get hashCode {
    return key.hashCode ^ id.hashCode;
  }
}

class ShowusersViewArguments {
  const ShowusersViewArguments({
    this.key,
    required this.cat,
  });

  final _i18.Key? key;

  final String cat;

  @override
  String toString() {
    return '{"key": "$key", "cat": "$cat"}';
  }

  @override
  bool operator ==(covariant ShowusersViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.cat == cat;
  }

  @override
  int get hashCode {
    return key.hashCode ^ cat.hashCode;
  }
}

class ChatingViewArguments {
  const ChatingViewArguments({
    this.key,
    required this.id,
    required this.did,
  });

  final _i18.Key? key;

  final String id;

  final String did;

  @override
  String toString() {
    return '{"key": "$key", "id": "$id", "did": "$did"}';
  }

  @override
  bool operator ==(covariant ChatingViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.id == id && other.did == did;
  }

  @override
  int get hashCode {
    return key.hashCode ^ id.hashCode ^ did.hashCode;
  }
}

extension NavigatorStateExtension on _i19.NavigationService {
  Future<dynamic> navigateToHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToLoginSingupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.loginSingupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToLoginView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.loginView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSingnupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.singnupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToCategoryslectorView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.categoryslectorView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAddpicView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.addpicView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAddpassView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.addpassView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToOtpView({
    _i18.Key? key,
    required String id,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.otpView,
        arguments: OtpViewArguments(key: key, id: id),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAdminView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.adminView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToHireView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.hireView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToShowusersView({
    _i18.Key? key,
    required String cat,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.showusersView,
        arguments: ShowusersViewArguments(key: key, cat: cat),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToWalletView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.walletView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToChatingView({
    _i18.Key? key,
    required String id,
    required String did,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.chatingView,
        arguments: ChatingViewArguments(key: key, id: id, did: did),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAllchatView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.allchatView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToPlansView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.plansView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithLoginSingupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.loginSingupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithLoginView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.loginView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSingnupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.singnupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithCategoryslectorView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.categoryslectorView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAddpicView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.addpicView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAddpassView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.addpassView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithOtpView({
    _i18.Key? key,
    required String id,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.otpView,
        arguments: OtpViewArguments(key: key, id: id),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAdminView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.adminView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithHireView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.hireView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithShowusersView({
    _i18.Key? key,
    required String cat,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.showusersView,
        arguments: ShowusersViewArguments(key: key, cat: cat),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithWalletView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.walletView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithChatingView({
    _i18.Key? key,
    required String id,
    required String did,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.chatingView,
        arguments: ChatingViewArguments(key: key, id: id, did: did),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAllchatView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.allchatView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithPlansView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.plansView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
