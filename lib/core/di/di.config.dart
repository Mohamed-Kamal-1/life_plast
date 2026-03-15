// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:accounting_desktop/features/accounts/presentation/view_model/cubit/Account_Cubit.dart'
    as _i675;
import 'package:accounting_desktop/features/all_data_service/data/models/account/all_accounts.dart'
    as _i57;
import 'package:accounting_desktop/features/all_data_service/data/models/product_model.dart'
    as _i120;
import 'package:accounting_desktop/features/inventory/presentation/view_model/cubit/inventory_cubit.dart'
    as _i331;
import 'package:accounting_desktop/features/purchases/presentation/view_model/cubit/purchase_invoice_cubit/purchase_invoice_cubit.dart'
    as _i104;
import 'package:accounting_desktop/features/sales/presentation/view_model/cubit/sales_cubit.dart'
    as _i844;
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
    gh.singleton<_i57.AccountService>(() => _i57.AccountService());
    gh.singleton<_i120.ProductService>(() => _i120.ProductService());
    gh.factory<_i675.AccountsCubit>(
        () => _i675.AccountsCubit(gh<_i57.AccountService>()));
    gh.factory<_i331.InventoryCubit>(
        () => _i331.InventoryCubit(gh<_i120.ProductService>()));
    gh.factory<_i104.PurchaseInvoiceCubit>(
        () => _i104.PurchaseInvoiceCubit(gh<_i120.ProductService>()));
    gh.factory<_i844.SalesInvoiceCubit>(
        () => _i844.SalesInvoiceCubit(gh<_i120.ProductService>()));
    return this;
  }
}
