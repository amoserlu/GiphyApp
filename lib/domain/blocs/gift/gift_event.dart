part of 'gift_bloc.dart';

abstract class GiftEvent {
  const GiftEvent();

  List<Object> get props => [];
}

class AddMoreGiftEvent extends GiftEvent {
  const AddMoreGiftEvent();

  @override
  List<Object> get props => [];
}

class LikedGiftEvent extends GiftEvent {
  final String giftId;
  final bool isLiked;
  final String url;
  const LikedGiftEvent(this.giftId, this.isLiked, this.url);

  @override
  List<Object> get props => [giftId, isLiked, url];
}
