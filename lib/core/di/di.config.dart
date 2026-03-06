// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:accounting_desktop/features/inventory/data/models/product_model.dart'
    as _i825;
import 'package:accounting_desktop/features/inventory/presentation/view_model/cubit/inventory_cubit.dart'
    as _i331;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i825.ProductService>(() => _i825.ProductService());
    gh.factory<_i331.InventoryCubit>(
        () => _i331.InventoryCubit(gh<_i825.ProductService>()));
    return this;
  }
}
