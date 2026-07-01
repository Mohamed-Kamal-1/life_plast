// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/accounts/presentation/view_model/cubit/Account_Cubit.dart'
    as _i580;
import '../../features/all_data_service/data/models/account/all_accounts.dart'
    as _i822;
import '../../features/all_data_service/data/models/product_model.dart'
    as _i515;
import '../../features/inventory/presentation/view_model/cubit/inventory_cubit.dart'
    as _i232;
import '../../features/purchases/presentation/view_model/cubit/purchase_invoice_cubit/purchase_invoice_cubit.dart'
    as _i421;
import '../../features/sales/presentation/view_model/cubit/sales_cubit.dart'
    as _i228;

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
    gh.singleton<_i822.AccountService>(() => _i822.AccountService());
    gh.singleton<_i515.ProductService>(() => _i515.ProductService());
    gh.factory<_i580.AccountsCubit>(
        () => _i580.AccountsCubit(gh<_i822.AccountService>()));
    gh.factory<_i232.InventoryCubit>(
        () => _i232.InventoryCubit(gh<_i515.ProductService>()));
    gh.factory<_i421.PurchaseInvoiceCubit>(
        () => _i421.PurchaseInvoiceCubit(gh<_i515.ProductService>()));
    gh.factory<_i228.SalesInvoiceCubit>(
        () => _i228.SalesInvoiceCubit(gh<_i515.ProductService>()));
    return this;
  }
}
