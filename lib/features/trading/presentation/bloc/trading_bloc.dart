import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/repositories/trading_repository.dart';

part 'trading_state.dart';
part 'trading_event.dart';

class TradingBloc extends Bloc<TradingEvent, TradingState> {
  TradingBloc(
    this._tradingRepository,
  ) : super(TradingState()) {
    // TODO: add event handlers
  }

  final TradingRepository _tradingRepository;
}