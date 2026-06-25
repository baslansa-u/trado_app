import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/repositories/portfolio_repository.dart';

part 'portfolio_state.dart';
part 'portfolio_event.dart';

class PortfolioBloc extends Bloc<PortfolioEvent, PortfolioState> {
  PortfolioBloc(
    this._portfolioRepository,
  ) : super(PortfolioState()) {
    // TODO: add event handlers
  }

  final PortfolioRepository _portfolioRepository;
}