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

import '../../features/accounts/data/datasources/accounts_local_datasource.dart'
    as _i964;
import '../../features/accounts/data/repositories_implementation/accounts_repository_impl.dart'
    as _i640;
import '../../features/accounts/domain/repositories/accounts_repository.dart'
    as _i581;
import '../../features/accounts/domain/usecases/add_account_usecase.dart'
    as _i313;
import '../../features/accounts/domain/usecases/delete_account_usecase.dart'
    as _i1063;
import '../../features/accounts/domain/usecases/get_accounts_usecase.dart'
    as _i297;
import '../../features/accounts/domain/usecases/search_accounts_usecase.dart'
    as _i663;
import '../../features/accounts/presentation/view_model/cubit/Account_Cubit.dart'
    as _i580;
import '../../features/all_data_service/data/models/account/all_accounts.dart'
    as _i822;
import '../../features/all_data_service/data/models/product_model.dart'
    as _i515;
import '../../features/auth/data/data_sources/auth_remote_datasource.dart'
    as _i586;
import '../../features/auth/data/repositories/auth_repository_impl.dart'
    as _i153;
import '../../features/auth/domain/repositories/auth_repository.dart' as _i787;
import '../../features/auth/domain/usecases/check_auth_usecase.dart' as _i831;
import '../../features/auth/domain/usecases/login_usecase.dart' as _i188;
import '../../features/auth/domain/usecases/logout_usecase.dart' as _i48;
import '../../features/auth/presentation/cubit/auth_cubit.dart' as _i117;
import '../../features/inventory/data/datasources/inventory_remote_datasource.dart'
    as _i103;
import '../../features/inventory/data/repositories/inventory_repository_impl.dart'
    as _i572;
import '../../features/inventory/domain/repositories/inventory_repository.dart'
    as _i422;
import '../../features/inventory/domain/usecases/add_product_usecase.dart'
    as _i234;
import '../../features/inventory/domain/usecases/delete_product_usecase.dart'
    as _i789;
import '../../features/inventory/domain/usecases/get_products_usecase.dart'
    as _i340;
import '../../features/inventory/domain/usecases/search_products_usecase.dart'
    as _i541;
import '../../features/inventory/presentation/cubit/inventory_cubit.dart'
    as _i485;
import '../../features/inventory/presentation/view_model/cubit/inventory_cubit.dart'
    as _i232;
import '../../features/invoices/data/datasources/invoices_remote_datasource.dart'
    as _i126;
import '../../features/invoices/data/repositories/invoices_repository_impl.dart'
    as _i1008;
import '../../features/invoices/domain/repositories/invoices_repository.dart'
    as _i337;
import '../../features/invoices/domain/usecases/create_invoice_usecase.dart'
    as _i920;
import '../../features/invoices/presentation/cubit/nvoices_cubit.dart' as _i672;
import '../../features/purchases/presentation/view_model/cubit/purchase_invoice_cubit/purchase_invoice_cubit.dart'
    as _i421;
import '../../features/reports_and_dashboard/data/datasources/reports_remote_datasource.dart'
    as _i991;
import '../../features/reports_and_dashboard/data/repositories/reports_repository_impl.dart'
    as _i471;
import '../../features/reports_and_dashboard/domain/repositories/reports_repository.dart'
    as _i959;
import '../../features/reports_and_dashboard/domain/usecases/get_dashboard_stats_usecase.dart'
    as _i1015;
import '../../features/reports_and_dashboard/presentation/cubit/reports_cubit.dart'
    as _i793;
import '../../features/sales/presentation/view_model/cubit/sales_cubit.dart'
    as _i228;
import '../database/app_database.dart' as _i982;

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
    gh.singleton<_i982.AppDatabase>(() => _i982.AppDatabase());
    gh.singleton<_i822.AccountService>(() => _i822.AccountService());
    gh.singleton<_i515.ProductService>(() => _i515.ProductService());
    gh.singleton<_i126.InvoicesRemoteDataSource>(
        () => _i126.InvoicesRemoteDataSource());
    gh.singleton<_i991.ReportsRemoteDataSource>(
        () => _i991.ReportsRemoteDataSource());
    gh.lazySingleton<_i586.AuthRemoteDataSource>(
        () => _i586.AuthRemoteDataSource());
    gh.lazySingleton<_i103.InventoryRemoteDataSource>(
        () => _i103.InventoryRemoteDataSource());
    gh.singleton<_i787.AuthRepository>(
        () => _i153.AuthRepositoryImpl(gh<_i586.AuthRemoteDataSource>()));
    gh.singleton<_i422.InventoryRepository>(() =>
        _i572.InventoryRepositoryImpl(gh<_i103.InventoryRemoteDataSource>()));
    gh.factory<_i234.AddProductUseCase>(
        () => _i234.AddProductUseCase(gh<_i422.InventoryRepository>()));
    gh.factory<_i789.DeleteProductUseCase>(
        () => _i789.DeleteProductUseCase(gh<_i422.InventoryRepository>()));
    gh.factory<_i340.GetProductsUseCase>(
        () => _i340.GetProductsUseCase(gh<_i422.InventoryRepository>()));
    gh.factory<_i541.SearchProductsUseCase>(
        () => _i541.SearchProductsUseCase(gh<_i422.InventoryRepository>()));
    gh.factory<_i580.AccountCubit>(() => _i580.AccountCubit(
          gh<_i297.GetAccountsUseCase>(),
          gh<_i313.AddAccountUseCase>(),
          gh<_i1063.DeleteAccountUseCase>(),
          gh<_i663.SearchAccountsUseCase>(),
        ));
    gh.factory<_i485.InventoryCubit>(() => _i485.InventoryCubit(
          gh<_i340.GetProductsUseCase>(),
          gh<_i234.AddProductUseCase>(),
          gh<_i789.DeleteProductUseCase>(),
          gh<_i541.SearchProductsUseCase>(),
        ));
    gh.singleton<_i337.InvoicesRepository>(() =>
        _i1008.InvoicesRepositoryImpl(gh<_i126.InvoicesRemoteDataSource>()));
    gh.singleton<_i959.ReportsRepository>(
        () => _i471.ReportsRepositoryImpl(gh<_i991.ReportsRemoteDataSource>()));
    gh.factory<_i232.InventoryCubit>(
        () => _i232.InventoryCubit(gh<_i515.ProductService>()));
    gh.factory<_i421.PurchaseInvoiceCubit>(
        () => _i421.PurchaseInvoiceCubit(gh<_i515.ProductService>()));
    gh.factory<_i228.SalesInvoiceCubit>(
        () => _i228.SalesInvoiceCubit(gh<_i515.ProductService>()));
    gh.factory<_i831.CheckAuthUseCase>(
        () => _i831.CheckAuthUseCase(gh<_i787.AuthRepository>()));
    gh.factory<_i188.LoginUseCase>(
        () => _i188.LoginUseCase(gh<_i787.AuthRepository>()));
    gh.factory<_i48.LogoutUseCase>(
        () => _i48.LogoutUseCase(gh<_i787.AuthRepository>()));
    gh.factory<_i117.AuthCubit>(() => _i117.AuthCubit(
          gh<_i188.LoginUseCase>(),
          gh<_i48.LogoutUseCase>(),
          gh<_i831.CheckAuthUseCase>(),
        ));
    gh.factory<_i920.CreateInvoiceUseCase>(
        () => _i920.CreateInvoiceUseCase(gh<_i337.InvoicesRepository>()));
    gh.singleton<_i964.AccountsLocalDataSource>(
        () => _i964.AccountsLocalDataSourceImpl(gh<_i982.AppDatabase>()));
    gh.factory<_i672.InvoicesCubit>(
        () => _i672.InvoicesCubit(gh<_i920.CreateInvoiceUseCase>()));
    gh.factory<_i1015.GetDashboardStatsUseCase>(
        () => _i1015.GetDashboardStatsUseCase(gh<_i959.ReportsRepository>()));
    gh.singleton<_i581.AccountsRepository>(() =>
        _i640.AccountsRepositoryImpl(gh<_i964.AccountsLocalDataSource>()));
    gh.factory<_i793.ReportsCubit>(
        () => _i793.ReportsCubit(gh<_i1015.GetDashboardStatsUseCase>()));
    return this;
  }
}
