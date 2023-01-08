import 'package:flutter/material.dart';
import 'package:goj_test_08/data/reqs.dart';
import 'package:goj_test_08/extensions.dart';

class AppState extends ChangeNotifier {
  String _ifUrl = '';
  String get ifUrl => _ifUrl;

  bool _loading = false;
  bool get loading => _loading;

  load() {
    _loading = !_loading;
    notifyListeners();
  }

  stUrl(url) {
    {
      _ifUrl = url;
      notifyListeners();
    }
  }

  String? _grdUrl;
  String? get grdUrl => _grdUrl;

  Future grdurl() async {
    load();
    _grdUrl = await getGrbdurl(ifUrl);
    load();
  }

  String? _masterUrl;
  String? get masterUrl => _masterUrl;

  Future getMstUrl() async {
    load();
    _masterUrl = await getMasterurl(_grdUrl!.grdurl, _ifUrl);
    load();
  }
}
