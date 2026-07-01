import 'package:equatable/equatable.dart';

class Stock extends Equatable {
  final String symbol;
  final String name;
  final double currentPrice;
  final double change;
  final double changePercent;
  final bool isMarketOpen;
  final int volume;

  const Stock({
    required this.symbol,
    required this.name,
    required this.currentPrice,
    required this.change,
    required this.changePercent,
    required this.isMarketOpen,
    required this.volume,
  });

  @override
  List<Object?> get props => [
        symbol,
        name,
        currentPrice,
        change,
        changePercent,
        isMarketOpen,
        volume,
      ];
}
