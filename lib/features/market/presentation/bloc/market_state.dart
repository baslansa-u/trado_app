part of 'market_bloc.dart';

class MarketState {}

class MarketLoadingState extends MarketState {}

class MarketLoadedState extends MarketState {
  MarketLoadedState();
}

class MarketErrorState extends MarketState {
  MarketErrorState({required this.message});
  final String message;
}