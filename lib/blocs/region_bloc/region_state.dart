part of 'region_bloc.dart';

@immutable
abstract class RegionState {}

class RegionInitial extends RegionState {}

class RegionLoaded extends RegionState {

  final List <Region> regions;


  RegionLoaded(this.regions);
}

class RegionLoading extends RegionState{}


class RegionError extends RegionState {}