import 'package:dartz/dartz.dart';
import 'package:trado_app/core/errors/failures.dart';
import 'package:trado_app/features/market/domain/entities/price_point.dart';
import 'package:trado_app/features/market/domain/entities/stock.dart';

abstract interface class MarketRepository {
  Future<Either<Failure, Stock>> getStock(String symbol);
  Future<Either<Failure, List<Stock>>> getStocks(List<String> symbols);
  Future<Either<Failure, List<PricePoint>>> getStockHistory(
    String symbol,
    Timeframe timeframe,
    DateTime from,
    DateTime to,
  );
  Future<Either<Failure, List<Stock>>> searchStocks(String query);
}
