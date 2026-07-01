import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:trado_app/core/errors/failures.dart';
import 'package:trado_app/features/market/domain/entities/stock.dart';
import 'package:trado_app/features/market/domain/repositories/market_repository.dart';

class SearchStockUsecase {
  final MarketRepository repository;

  SearchStockUsecase(this.repository);

  Future<Either<Failure, List<Stock>>> call(SearchStockParams params) =>
      repository.searchStocks(params.query);
}

class SearchStockParams extends Equatable {
  final String query;

  const SearchStockParams({required this.query});

  @override
  List<Object?> get props => [query];
}
