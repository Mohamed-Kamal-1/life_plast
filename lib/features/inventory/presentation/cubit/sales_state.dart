import 'package:equatable/equatable.dart';

abstract class SalesState extends Equatable {
  const SalesState();
  @override
  List<Object?> get props => [];
}

class SalesInitialState extends SalesState {}

class SalesLoadingState extends SalesState {}

class SalesSuccessState extends SalesState {}

class SalesErrorState extends SalesState {
  final String errorMessage;
  const SalesErrorState({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
