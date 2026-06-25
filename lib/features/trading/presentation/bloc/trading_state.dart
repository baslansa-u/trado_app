part of 'trading_bloc.dart';

class TradingState {}

class TradingLoadingState extends TradingState {}

class TradingLoadedState extends TradingState {
  TradingLoadedState();
}

class TradingErrorState extends TradingState {
  TradingErrorState({required this.message});
  final String message;
}