import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/repositories/market_repository.dart';

part 'market_state.dart';
part 'market_event.dart';

class MarketBloc extends Bloc<MarketEvent, MarketState> {
  MarketBloc(
    this._marketRepository,
  ) : super(MarketState()) {
    // TODO: add event handlers
  }

  final MarketRepository _marketRepository;
}