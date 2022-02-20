import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:customer_book/services/api_service.dart';
import 'package:customer_book/services/shared_prefs_service.dart';
import 'package:customer_book/views/home_view.dart';
import 'package:customer_book/views/login_view.dart';

import 'package:customer_book/views/startup_view.dart';

@StackedApp(routes: [
  MaterialRoute(page: StartUpView, initial: true),
  // MaterialRoute(page: CompanyCodeView),
  MaterialRoute(page: LoginView),
  MaterialRoute(page: HomeView),
], dependencies: [
// local services
  LazySingleton<NavigationService>(classType: NavigationService),
  LazySingleton<BottomSheetService>(classType: BottomSheetService),
  LazySingleton<SnackbarService>(classType: SnackbarService),
  LazySingleton<DialogService>(classType: DialogService),

  // custom services
  LazySingleton<ApiService>(classType: ApiService),
  LazySingleton<SharedPrefsservice>(classType: SharedPrefsservice),

])
class App {}
