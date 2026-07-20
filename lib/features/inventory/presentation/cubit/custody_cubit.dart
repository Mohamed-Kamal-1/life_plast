import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/inventory_transaction_entity.dart';
import '../../domain/entities/salesman_custody_entity.dart';
import '../../domain/repositories/inventory_repository.dart';

// --- States ---
abstract class CustodyState extends Equatable {
  const CustodyState();
  @override
  List<Object?> get props => [];
}

class CustodyInitial extends CustodyState {}

class CustodyLoading extends CustodyState {}

class CustodyLoaded extends CustodyState {
  final List<InventoryTransactionEntity> transactions;
  final List<SalesmanCustodyEntity> currentCustody;

  const CustodyLoaded(
      {required this.transactions, required this.currentCustody});

  @override
  List<Object?> get props => [transactions, currentCustody];
}

class CustodyError extends CustodyState {
  final String message;
  const CustodyError(this.message);

  @override
  List<Object?> get props => [message];
}

// --- Cubit ---
@injectable
class CustodyCubit extends Cubit<CustodyState> {
  final InventoryRepository _repository;

  CustodyCubit(this._repository) : super(CustodyInitial());

  Future<void> loadSalesmanCustody(String salesmanId) async {
    emit(CustodyLoading());

    final txResult =
        await _repository.getCustodyTransactions(salesmanId: salesmanId);
    final custodyResult =
        await _repository.getSalesmanCurrentCustody(salesmanId);

    txResult.fold(
      onFailure: (failure) => emit(CustodyError(failure.message)),
      onSuccess: (transactions) {
        custodyResult.fold(
          onFailure: (failure) => emit(CustodyError(failure.message)),
          onSuccess: (currentCustody) {
            emit(CustodyLoaded(
              transactions: transactions,
              currentCustody: currentCustody,
            ));
          },
        );
      },
    );
  }
}
