import 'package:stacked/stacked.dart';
import 'package:customer_book/app/app.locator.dart';
import 'package:customer_book/services/shared_prefs_service.dart';

class HomeViewModel extends BaseViewModel {
  final _prefsService = locator<SharedPrefsservice>();

  int index = -1;

  void openContainer(int i) {
    if (index == i) {
      index = -1;
    } else {
      index = i;
    }
    notifyListeners();
  }

  void reload() {
    _prefsService.reloadData();
  }
}
