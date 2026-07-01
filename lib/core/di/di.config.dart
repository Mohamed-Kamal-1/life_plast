// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:accounting_desktop/core/database/app_database.dart' as _i183;
import 'package:accounting_desktop/features/accounts/data/datasources/accounts_local_datasource.dart'
    as _i177;
import 'package:accounting_desktop/features/accounts/data/repositories_implementation/accounts_repository_impl.dart'
    as _i7;
import 'package:accounting_desktop/features/accounts/domain/repositories/accounts_repository.dart'
    as _i278;
import 'package:accounting_desktop/features/accounts/domain/usecases/add_account_usecase.dart'
    as _i732;
import 'package:accounting_desktop/features/accounts/domain/usecases/delete_account_usecase.dart'
    as _i218;
import 'package:accounting_desktop/features/accounts/domain/usecases/get_accounts_usecase.dart'
    as _i931;
import 'package:accounting_desktop/features/accounts/domain/usecases/search_accounts_usecase.dart'
    as _i1066;
import 'package:accounting_desktop/features/accounts/presentation/view_model/cubit/Account_Cubit.dart'
    as _i675;
import 'package:accounting_desktop/features/all_data_service/data/models/account/all_accounts.dart'
    as _i806;
import 'package:accounting_desktop/features/all_data_service/data/models/product_model.dart'
    as _i120;
import 'package:accounting_desktop/features/auth/data/data_sources/auth_remote_datasource.dart'
    as _i796;
import 'package:accounting_desktop/features/auth/data/repositories/auth_repository_impl.dart'
    as _i507;
import 'package:accounting_desktop/features/auth/domain/repositories/auth_repository.dart'
    as _i1067;
import 'package:accounting_desktop/features/auth/domain/usecases/check_auth_usecase.dart'
    as _i662;
import 'package:accounting_desktop/features/auth/domain/usecases/login_usecase.dart'
    as _i475;
import 'package:accounting_desktop/features/auth/domain/usecases/logout_usecase.dart'
    as _i727;
import 'package:accounting_desktop/features/auth/presentation/cubit/auth_cubit.dart'
    as _i737;
import 'package:accounting_desktop/features/inventory/data/datasources/inventory_remote_datasource.dart'
    as _i409;
import 'package:accounting_desktop/features/inventory/data/repositories/inventory_repository_impl.dart'
    as _i816;
import 'package:accounting_desktop/features/inventory/domain/repositories/inventory_repository.dart'
    as _i826;
import 'package:accounting_desktop/features/inventory/domain/usecases/add_product_usecase.dart'
    as _i243;
import 'package:accounting_desktop/features/inventory/domain/usecases/delete_product_usecase.dart'
    as _i516;
import 'package:accounting_desktop/features/inventory/domain/usecases/get_products_usecase.dart'
    as _i510;
import 'package:accounting_desktop/features/inventory/domain/usecases/search_products_usecase.dart'
    as _i259;
import 'package:accounting_desktop/features/inventory/presentation/cubit/inventory_cubit.dart'
    as _i394;
import 'package:accounting_desktop/features/inventory/presentation/view_model/cubit/inventory_cubit.dart'
    as _i331;
import 'package:accounting_desktop/features/invoices/data/datasources/invoices_remote_datasource.dart'
    as _i373;
import 'package:accounting_desktop/features/invoices/data/repositories/invoices_repository_impl.dart'
    as _i913;
import 'package:accounting_desktop/features/invoices/domain/repositories/invoices_repository.dart'
    as _i215;
import 'package:accounting_desktop/features/invoices/domain/usecases/create_invoice_usecase.dart'
    as _i726;
import 'package:accounting_desktop/features/invoices/presentation/cubit/nvoices_cubit.dart'
    as _i361;
import 'package:accounting_desktop/features/purchases/presentation/view_model/cubit/purchase_invoice_cubit/purchase_invoice_cubit.dart'
    as _i104;
import 'package:accounting_desktop/features/reports_and_dashboard/data/datasources/reports_remote_datasource.dart'
    as _i319;
import 'package:accounting_desktop/features/reports_and_dashboard/data/repositories/reports_repository_impl.dart'
    as _i340;
import 'package:accounting_desktop/features/reports_and_dashboard/domain/repositories/reports_repository.dart'
    as _i467;
import 'package:accounting_desktop/features/reports_and_dashboard/domain/usecases/get_dashboard_stats_usecase.dart'
    as _i643;
import 'package:accounting_desktop/features/reports_and_dashboard/presentation/cubit/reports_cubit.dart'
    as _i999;
import 'package:accounting_desktop/features/sales/presentation/view_model/cubit/sales_cubit.dart'
    as _i951;
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
    gh.singleton<_i183.AppDatabase>(() => _i183.AppDatabase());
    gh.singleton<_i806.AccountService>(() => _i806.AccountService());
    gh.singleton<_i120.ProductService>(() => _i120.ProductService());
    gh.singleton<_i373.InvoicesRemoteDataSource>(
        () => _i373.InvoicesRemoteDataSource());
    gh.singleton<_i319.ReportsRemoteDataSource>(
        () => _i319.ReportsRemoteDataSource());
    gh.lazySingleton<_i796.AuthRemoteDataSource>(
        () => _i796.AuthRemoteDataSource());
    gh.lazySingleton<_i409.InventoryRemoteDataSource>(
        () => _i409.InventoryRemoteDataSource());
    gh.singleton<_i1067.AuthRepository>(
        () => _i507.AuthRepositoryImpl(gh<_i796.AuthRemoteDataSource>()));
    gh.singleton<_i826.InventoryRepository>(() =>
        _i816.InventoryRepositoryImpl(gh<_i409.InventoryRemoteDataSource>()));
    gh.factory<_i243.AddProductUseCase>(
        () => _i243.AddProductUseCase(gh<_i826.InventoryRepository>()));
    gh.factory<_i516.DeleteProductUseCase>(
        () => _i516.DeleteProductUseCase(gh<_i826.InventoryRepository>()));
    gh.factory<_i510.GetProductsUseCase>(
        () => _i510.GetProductsUseCase(gh<_i826.InventoryRepository>()));
    gh.factory<_i259.SearchProductsUseCase>(
        () => _i259.SearchProductsUseCase(gh<_i826.InventoryRepository>()));
    gh.factory<_i675.AccountCubit>(() => _i675.AccountCubit(
          gh<_i931.GetAccountsUseCase>(),
          gh<_i732.AddAccountUseCase>(),
          gh<_i218.DeleteAccountUseCase>(),
          gh<_i1066.SearchAccountsUseCase>(),
        ));
    gh.factory<_i394.InventoryCubit>(() => _i394.InventoryCubit(
          gh<_i510.GetProductsUseCase>(),
          gh<_i243.AddProductUseCase>(),
          gh<_i516.DeleteProductUseCase>(),
          gh<_i259.SearchProductsUseCase>(),
        ));
    gh.singleton<_i215.InvoicesRepository>(() =>
        _i913.InvoicesRepositoryImpl(gh<_i373.InvoicesRemoteDataSource>()));
    gh.singleton<_i467.ReportsRepository>(
        () => _i340.ReportsRepositoryImpl(gh<_i319.ReportsRemoteDataSource>()));
    gh.factory<_i331.InventoryCubit>(
        () => _i331.InventoryCubit(gh<_i120.ProductService>()));
    gh.factory<_i104.PurchaseInvoiceCubit>(
        () => _i104.PurchaseInvoiceCubit(gh<_i120.ProductService>()));
    gh.factory<_i951.SalesInvoiceCubit>(
        () => _i951.SalesInvoiceCubit(gh<_i120.ProductService>()));
    gh.factory<_i662.CheckAuthUseCase>(
        () => _i662.CheckAuthUseCase(gh<_i1067.AuthRepository>()));
    gh.factory<_i475.LoginUseCase>(
        () => _i475.LoginUseCase(gh<_i1067.AuthRepository>()));
    gh.factory<_i727.LogoutUseCase>(
        () => _i727.LogoutUseCase(gh<_i1067.AuthRepository>()));
    gh.factory<_i737.AuthCubit>(() => _i737.AuthCubit(
          gh<_i475.LoginUseCase>(),
          gh<_i727.LogoutUseCase>(),
          gh<_i662.CheckAuthUseCase>(),
        ));
    gh.factory<_i726.CreateInvoiceUseCase>(
        () => _i726.CreateInvoiceUseCase(gh<_i215.InvoicesRepository>()));
    gh.singleton<_i177.AccountsLocalDataSource>(
        () => _i177.AccountsLocalDataSourceImpl(gh<_i183.AppDatabase>()));
    gh.factory<_i361.InvoicesCubit>(
        () => _i361.InvoicesCubit(gh<_i726.CreateInvoiceUseCase>()));
    gh.factory<_i643.GetDashboardStatsUseCase>(
        () => _i643.GetDashboardStatsUseCase(gh<_i467.ReportsRepository>()));
    gh.singleton<_i278.AccountsRepository>(
        () => _i7.AccountsRepositoryImpl(gh<_i177.AccountsLocalDataSource>()));
    gh.factory<_i999.ReportsCubit>(
        () => _i999.ReportsCubit(gh<_i643.GetDashboardStatsUseCase>()));
    return this;
  }
}
