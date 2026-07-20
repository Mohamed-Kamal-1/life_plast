import 'package:injectable/injectable.dart';

import '../../../../core/error/api_result.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/entities/category_entity.dart';
import '../../domain/entities/inventory_transaction_entity.dart';
import '../../domain/entities/product_entity.dart';
import '../../domain/entities/salesman_custody_entity.dart';
import '../../domain/repositories/inventory_repository.dart';
import '../datasources/inventory_remote_datasource.dart';
import '../models/product_model.dart';

@Injectable(as: InventoryRepository)
class InventoryRepositoryImpl implements InventoryRepository {
  final InventoryRemoteDataSource remoteDataSource;

  InventoryRepositoryImpl(this.remoteDataSource);

  @override
  Future<Result<List<CategoryEntity>>> getCategories() async {
    try {
      final categories = await remoteDataSource.getCategories();
      return Result.success(categories);
    } on ServerException catch (e) {
      return Result.failure(ServerFailure(message: e.message));
    } catch (e) {
      return Result.failure(const ServerFailure(message: 'خطأ غير متوقع'));
    }
  }

  @override
  Future<Result<void>> addCategory(String name) async {
    try {
      await remoteDataSource.addCategory(name);
      return Result.success(null);
    } on ServerException catch (e) {
      return Result.failure(ServerFailure(message: e.message));
    } catch (e) {
      return Result.failure(const ServerFailure(message: 'خطأ غير متوقع'));
    }
  }

  @override
  Future<Result<void>> deleteCategory(String id) async {
    try {
      await remoteDataSource.deleteCategory(id);
      return Result.success(null);
    } on ServerException catch (e) {
      return Result.failure(ServerFailure(message: e.message));
    } catch (e) {
      return Result.failure(const ServerFailure(message: 'خطأ غير متوقع'));
    }
  }

  @override
  Future<Result<List<ProductEntity>>> getProducts() async {
    try {
      final products = await remoteDataSource.getProducts();
      return Result.success(products);
    } on ServerException catch (e) {
      return Result.failure(ServerFailure(message: e.message));
    } catch (e) {
      return Result.failure(const ServerFailure(message: 'خطأ غير متوقع'));
    }
  }

  @override
  Future<Result<void>> addProduct(
      ProductEntity product, int initialQuantity) async {
    try {
      final model = ProductModel(
        id: product.id,
        categoryId: product.categoryId,
        name: product.name,
        purchasePrice: product.purchasePrice,
        salePrice: product.salePrice,
        surveyPrice: product.surveyPrice,
        minQty: product.minQty,
        showToSurvey: product.showToSurvey,
      );
      await remoteDataSource.addProduct(model, initialQuantity);
      return Result.success(null);
    } on ServerException catch (e) {
      return Result.failure(ServerFailure(message: e.message));
    } catch (e) {
      return Result.failure(const ServerFailure(message: 'خطأ غير متوقع'));
    }
  }

  @override
  Future<Result<void>> updateProduct(ProductEntity product) async {
    try {
      final model = ProductModel(
        id: product.id,
        categoryId: product.categoryId,
        name: product.name,
        purchasePrice: product.purchasePrice,
        salePrice: product.salePrice,
        surveyPrice: product.surveyPrice,
        minQty: product.minQty,
        showToSurvey: product.showToSurvey,
      );
      await remoteDataSource.updateProduct(model);
      return Result.success(null);
    } on ServerException catch (e) {
      return Result.failure(ServerFailure(message: e.message));
    } catch (e) {
      return Result.failure(const ServerFailure(message: 'خطأ غير متوقع'));
    }
  }

  @override
  Future<Result<void>> deleteProduct(String id) async {
    try {
      await remoteDataSource.deleteProduct(id);
      return Result.success(null);
    } on ServerException catch (e) {
      return Result.failure(ServerFailure(message: e.message));
    } catch (e) {
      return Result.failure(const ServerFailure(message: 'خطأ غير متوقع'));
    }
  }

  @override
  Future<Result<List<InventoryTransactionEntity>>> getCustodyTransactions(
      {String? salesmanId}) async {
    try {
      final data =
          await remoteDataSource.getCustodyTransactions(salesmanId: salesmanId);

      // تحويل الـ Map القادم من قاعدة البيانات إلى Entity نظيف تفهمه واجهة المستخدم
      final entities = data
          .map((json) => InventoryTransactionEntity(
                id: json['id'] as String,
                productId: json['product_id'] as String,
                productName: json['products']['name']
                    as String, // تم جلب الاسم عبر الـ Join في Supabase
                type: json['type'] as String,
                quantity: json['quantity'] as int,
                createdAt: DateTime.parse(json['created_at'] as String),
                notes: json['notes'] as String?,
              ))
          .toList();

      return Result.success(entities);
    } on ServerException catch (e) {
      return Result.failure(ServerFailure(message: e.message));
    } catch (e) {
      return Result.failure(const ServerFailure(
          message: 'خطأ غير متوقع أثناء جلب سجل حركات العهدة'));
    }
  }

  @override
  Future<Result<List<SalesmanCustodyEntity>>> getSalesmanCurrentCustody(
      String salesmanId) async {
    try {
      final data = await remoteDataSource.getSalesmanCurrentCustody(salesmanId);

      final entities = data
          .map((json) => SalesmanCustodyEntity(
                salesmanId: json['salesman_id'] as String,
                productId: json['product_id'] as String,
                productName: json['products']['name'] as String,
                currentQty: (json['current_qty'] as num).toInt(),
              ))
          .toList();

      return Result.success(entities);
    } on ServerException catch (e) {
      return Result.failure(ServerFailure(message: e.message));
    } catch (e) {
      return Result.failure(const ServerFailure(
          message: 'خطأ غير متوقع أثناء جلب عهدة المندوب الحالية'));
    }
  }
}
