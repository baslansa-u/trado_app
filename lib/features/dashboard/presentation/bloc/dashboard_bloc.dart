import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/repositories/dashboard_repository.dart';

part 'dashboard_state.dart';
part 'dashboard_event.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc(
    this._dashboardRepository,
  ) : super(DashboardState()) {
    // TODO: add event handlers
  }

  final DashboardRepository _dashboardRepository;
}