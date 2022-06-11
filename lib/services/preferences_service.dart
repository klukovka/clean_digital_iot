import 'package:injectable/injectable.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:shared_preferences/shared_preferences.dart';

@injectable
@preResolve
class PreferencesService {
  static const _accessTokenKey = '_accessTokenKey';
  static const _washingMachineKey = '_washingMachineKey';
  static const _laundryKey = '_laundryKey';

  final SharedPreferences _preferences;

  PreferencesService._(this._preferences);

  @factoryMethod
  static Future<PreferencesService> getInstance() async {
    final preferences = await SharedPreferences.getInstance();
    return PreferencesService._(preferences);
  }

  /// Auth

  bool get hasToken => getAccessToken().isNotEmpty;

  bool get isTokenExpired {
    final token = getAccessToken();

    if (token.isEmpty) return true;

    return Jwt.isExpired(token);
  }

  bool get isLoggedIn => hasToken && !isTokenExpired;

  String getAccessToken() => _preferences.getString(_accessTokenKey) ?? '';

  Future<void> setAccessToken(String accessToken) async {
    await _preferences.setString(_accessTokenKey, accessToken);
  }

  String getWashingMachine() =>
      _preferences.getString(_washingMachineKey) ?? '';

  Future<void> setWashingMachine(String id) async {
    await _preferences.setString(_washingMachineKey, id);
  }

  String getLaundry() => _preferences.getString(_laundryKey) ?? '';

  Future<void> setLaundry(String id) async {
    await _preferences.setString(_laundryKey, id);
  }

  Future<void> logout() async {
    await _preferences.remove(_accessTokenKey);
    await _preferences.remove(_washingMachineKey);
    await _preferences.remove(_laundryKey);
  }
}
