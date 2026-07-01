import 'package:equatable/equatable.dart';

enum Timeframe {
  oneMinute,
  fiveMinutes,
  fifteenMinutes,
  oneHour,
  oneDay,
  oneWeek,
  oneMonth,
}

class PricePoint extends Equatable {
  final String symbol;
  final Timeframe timeframe;
  final DateTime timestamp;
  final double open;
  final double high;
  final double low;
  final double close;
  final int volume;

  const PricePoint({
    required this.symbol,
    required this.timeframe,
    required this.timestamp,
    required this.open,
    required this.high,
    required this.low,
    required this.close,
    required this.volume,
  });

  @override
  List<Object?> get props => [
        symbol,
        timeframe,
        timestamp,
        open,
        high,
        low,
        close,
        volume,
      ];
}
