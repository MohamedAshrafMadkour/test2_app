import 'package:test2_app/core/cached/cached_helper.dart';
import 'package:test2_app/core/constants/keys.dart';

Future getToken() async {
  return await CachedHelper.getData(key: Keys.token);
}

Future getNationalId() async {
  return await CachedHelper.getData(key: Keys.nationalId);
}
