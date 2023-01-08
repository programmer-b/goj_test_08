import 'package:http/http.dart';

extension OkayHttpCallp on Response {
  bool get ok => statusCode ~/ 2 == 100;
}

extension StringExt on String {
  _aa(wrd) => substring(indexOf(wrd) + 4);
  get _a => _aa('vd="');
  get _b => _aa('tk="');
  get id => _a.substring(0, _a.indexOf('"'));
  get tk => _b.substring(0, _b.indexOf('"'));
  String get grdurl => 'https://www.wootly.ch/grabd?t=$tk&id=$id';
}
