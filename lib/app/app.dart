import 'package:servant_industry_hiring/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:servant_industry_hiring/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:servant_industry_hiring/ui/views/home/home_view.dart';
import 'package:servant_industry_hiring/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:servant_industry_hiring/services/sharedpref_service.dart';
import 'package:servant_industry_hiring/services/fire_service.dart';
import 'package:servant_industry_hiring/ui/views/login_singup/login_singup_view.dart';
import 'package:servant_industry_hiring/ui/views/login/login_view.dart';
import 'package:servant_industry_hiring/ui/views/singnup/singnup_view.dart';
import 'package:servant_industry_hiring/ui/views/categoryslector/categoryslector_view.dart';
import 'package:servant_industry_hiring/ui/views/addpic/addpic_view.dart';
import 'package:servant_industry_hiring/ui/views/addpass/addpass_view.dart';
import 'package:servant_industry_hiring/ui/views/otp/otp_view.dart';
import 'package:servant_industry_hiring/ui/views/admin/admin_view.dart';
import 'package:servant_industry_hiring/ui/views/hire/hire_view.dart';
import 'package:servant_industry_hiring/ui/views/showusers/showusers_view.dart';
import 'package:servant_industry_hiring/ui/views/wallet/wallet_view.dart';
import 'package:servant_industry_hiring/ui/views/chat/chating/chating_view.dart';
import 'package:servant_industry_hiring/ui/views/chat/allchat/allchat_view.dart';
import 'package:servant_industry_hiring/ui/views/plans/plans_view.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: LoginSingupView),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: SingnupView),
    MaterialRoute(page: CategoryslectorView),
    MaterialRoute(page: AddpicView),
    MaterialRoute(page: AddpassView),
    MaterialRoute(page: OtpView),
    MaterialRoute(page: AdminView),
    MaterialRoute(page: HireView),
    MaterialRoute(page: ShowusersView),
    MaterialRoute(page: WalletView),
    MaterialRoute(page: ChatingView),
    MaterialRoute(page: AllchatView),
    MaterialRoute(page: PlansView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: SharedprefService),
    LazySingleton(classType: FireService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
