import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:trado_app/core/errors/failures.dart';
import 'package:trado_app/features/market/domain/entities/stock.dart';
import 'package:trado_app/features/market/domain/repositories/market_repository.dart';

class GetStockUsecase {
  final MarketRepository repository;

  GetStockUsecase(this.repository);

  Future<Either<Failure, Stock>> call(GetStockParams params) =>
      repository.getStock(params.symbol);
}

class GetStockParams extends Equatable {
  final String symbol;

  const GetStockParams({required this.symbol});

  @override
  List<Object?> get props => [symbol];
}
