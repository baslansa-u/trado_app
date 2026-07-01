import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:trado_app/core/errors/failures.dart';
import 'package:trado_app/features/market/domain/entities/price_point.dart';
import 'package:trado_app/features/market/domain/repositories/market_repository.dart';

class GetStockHistoryUsecase {
  final MarketRepository repository;

  GetStockHistoryUsecase(this.repository);

  Future<Either<Failure, List<PricePoint>>> call(
          GetStockHistoryParams params) =>
      repository.getStockHistory(
        params.symbol,
        params.timeframe,
        params.from,
        params.to,
      );
}

class GetStockHistoryParams extends Equatable {
  final String symbol;
  final Timeframe timeframe;
  final DateTime from;
  final DateTime to;

  const GetStockHistoryParams({
    required this.symbol,
    required this.timeframe,
    required this.from,
    required this.to,
  });

  @override
  List<Object?> get props => [
        symbol,
        timeframe,
        from,
        to,
      ];
}
