part of 'gift_bloc.dart';

abstract class GiftState {
  const GiftState();

  List<Object> get props => [];
}

class GiftInitial extends GiftState {
  final int length = 0;

  const GiftInitial();

  @override
  List<Object> get props => [[], length];
}

class GiftError extends GiftState {}

class GiftLoaded extends GiftState {
  final List<Gift> gifts;
  final int length;
  const GiftLoaded(this.gifts, this.length);

  @override
  List<Object> get props => [gifts, length];
}
