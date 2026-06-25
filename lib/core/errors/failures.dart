import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;

  const Failure(this.message);

  @override
  List<Object?> get props => [message];
}

// Network failures
class NetworkFailure extends Failure {
  final int statusCode;
  const NetworkFailure(super.message, this.statusCode);

  @override
  List<Object?> get props => [message, statusCode];
}

// Cache failures
class CacheFailure extends Failure {
  const CacheFailure(super.message);
}

// Authentication failures
class AuthenticationFailure extends Failure {
  const AuthenticationFailure(super.message);
}

// Trading failures
class TradingFailure extends Failure {
  const TradingFailure(super.message);
}

class InsufficientFundsFailure extends TradingFailure {
  final double requiredAmount;
  final double availableAmount;

  const InsufficientFundsFailure(
      {required this.requiredAmount, required this.availableAmount})
      : super('เงินจำลองของคุณไม่เพียงพอสำหรับคำสั่งซื้อนี้');

  @override
  List<Object?> get props => [message, requiredAmount, availableAmount];
}

class InsufficientSharesFailure extends TradingFailure {
  final double requiredShares;
  final double availableShares;

  const InsufficientSharesFailure(
      {required this.requiredShares, required this.availableShares})
      : super('จำนวนหุ้นในพอร์ตของคุณมีไม่พอสำหรับการสั่งขาย');

  @override
  List<Object?> get props => [message, requiredShares, availableShares];
}

class InvalidOrderPriceFailure extends TradingFailure {
  const InvalidOrderPriceFailure()
      : super('ราคาหุ้นที่ระบุไม่ถูกต้อง (ต้องมากกว่า 0)');
}

class MarketClosedFailure extends TradingFailure {
  const MarketClosedFailure()
      : super('ขณะนี้ตลาดปิดทำการ ไม่สามารถส่งคำสั่งซื้อขายแบบทันทีได้');
}
