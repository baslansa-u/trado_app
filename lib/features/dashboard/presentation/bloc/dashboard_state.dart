part of 'dashboard_bloc.dart';

class DashboardState {}

class DashboardLoadingState extends DashboardState {}

class DashboardLoadedState extends DashboardState {
  DashboardLoadedState();
}

class DashboardErrorState extends DashboardState {
  DashboardErrorState({required this.message});
  final String message;
}