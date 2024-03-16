import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:pokemood/models/region.dart';
import 'package:pokemood/repositories/region_repository.dart';

part 'region_event.dart';

part 'region_state.dart';

class RegionBloc extends Bloc<HomeEvent, RegionState> {
  RegionBloc() : super(RegionInitial()) {
    on<LoadRegionEvent>((event, emit) async {
      try {
        emit(RegionLoading());

        final regions =
            await GetIt.instance.get<RegionRepository>().loadRegions();

        emit(RegionLoaded(regions));
      } catch (_) {
        emit(RegionError());
      }
    });
  }
}
