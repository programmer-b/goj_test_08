import 'dart:developer';

import 'package:goj_test_08/extensions.dart';
import 'package:goj_test_08/strings.dart';
import 'package:http/http.dart' as http;

Future<String?> getGrbdurl(String url) async {
  var body = 'qdf=1';
  var headers = {
    'Content-Type': 'application/x-www-form-urlencoded',
    'Cookie': grdcookie
  };

  var response = await http.post(Uri.parse(url), body: body, headers: headers);

  if (response.ok) {
    // Successful POST request
    var data = response.body;
    log(data.grdurl);
    return data;
  } else {
    // POST request failed
    log('Request failed with status: ${response.statusCode}');
  }
  return null;
}

Future<String?> getMasterurl(String url, String grdurl) async {
  var headers = {
    'Cookie': grdcookie,
  };
  var response = await http.get(Uri.parse(url), headers: headers);
  log('RESPONSE ${response.body}');

  if (response.ok) {
    return response.body;
  } else {
    log('request failed with status code: ${response.statusCode}');
  }
  return null;
}
