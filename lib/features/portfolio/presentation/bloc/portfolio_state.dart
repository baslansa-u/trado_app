part of 'portfolio_bloc.dart';

class PortfolioState {}

class PortfolioLoadingState extends PortfolioState {}

class PortfolioLoadedState extends PortfolioState {
  PortfolioLoadedState();
}

class PortfolioErrorState extends PortfolioState {
  PortfolioErrorState({required this.message});
  final String message;
}