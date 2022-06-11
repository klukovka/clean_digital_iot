// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i8;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../api/clean_digital_api_client.dart' as _i9;
import '../api/interceptors/header_api_interceptor.dart' as _i7;
import '../bloc/scan_qr_page/scan_qr_page_cubit.dart' as _i11;
import '../bloc/setup_event_page/setup_event_page_cubit.dart' as _i12;
import '../bloc/setup_iot_page/setup_iot_page_cubit.dart' as _i13;
import '../router/app_auto_router.gr.dart' as _i4;
import '../router/clean_digital_router.dart' as _i3;
import '../services/iot_service.dart' as _i10;
import '../services/logout_service.dart' as _i6;
import '../services/preferences_service.dart' as _i5;
import 'module/api_module.dart' as _i14; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $configureDependencies(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final apiModule = _$ApiModule();
  gh.singleton<_i3.CleanDigitalRouter>(
      _i3.CleanDigitalRouter(get<_i4.AppAutoRouter>()));
  await gh.factoryAsync<_i5.PreferencesService>(
      () => _i5.PreferencesService.getInstance(),
      preResolve: true);
  gh.factory<_i6.LogoutService>(() => _i6.LogoutService(
      get<_i5.PreferencesService>(), get<_i3.CleanDigitalRouter>()));
  gh.factory<_i7.HeaderApiInterceptor>(() => _i7.HeaderApiInterceptor(
      get<_i5.PreferencesService>(), get<_i6.LogoutService>()));
  gh.lazySingleton<_i8.Dio>(
      () => apiModule.dio(get<_i7.HeaderApiInterceptor>()));
  gh.lazySingleton<_i9.CleanDigitalApiClient>(
      () => apiModule.apiClient(get<_i8.Dio>()));
  gh.factory<_i10.IoTService>(() => _i10.IoTService(
      get<_i9.CleanDigitalApiClient>(), get<_i5.PreferencesService>()));
  gh.factory<_i11.ScanQrPageCubit>(
      () => _i11.ScanQrPageCubit(get<_i10.IoTService>()));
  gh.factory<_i12.SetupEventPageCubit>(() => _i12.SetupEventPageCubit(
      get<_i10.IoTService>(), get<_i5.PreferencesService>()));
  gh.factory<_i13.SetupIoTPageCubit>(
      () => _i13.SetupIoTPageCubit(get<_i10.IoTService>()));
  return get;
}

class _$ApiModule extends _i14.ApiModule {}
