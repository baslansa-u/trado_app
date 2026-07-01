import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:trado_app/core/errors/failures.dart';
import 'package:trado_app/features/market/domain/entities/stock.dart';
import 'package:trado_app/features/market/domain/repositories/market_repository.dart';

class GetStocksUsecase {
  final MarketRepository repository;

  GetStocksUsecase(this.repository);

  Future<Either<Failure, List<Stock>>> call(GetStocksParams params) =>
      repository.getStocks(params.symbols);
}

class GetStocksParams extends Equatable {
  final List<String> symbols;

  const GetStocksParams({required this.symbols});

  @override
  List<Object?> get props => [symbols];
}
