import 'dart:developer';

import 'package:capgemini/data/api/giphy.dart';
import 'package:capgemini/data/models/gifts.dart';
import 'package:capgemini/services/sqlite_services.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'gift_event.dart';
part 'gift_state.dart';

class GiftBloc extends Bloc<GiftEvent, GiftState> {
  GiftBloc() : super(const GiftInitial()) {
    on<AddMoreGiftEvent>((event, emit) async {
      try {
        final dio = Dio();
        final client = RestClient(dio);

        int length = 20 + (state.props[1] as int);
        //In this part, when I read in the requirements that it has to load 20 by 20, but also progressively
        //while scrolling, I made it load the links 20 at a time, and the gift load while scrolling.
        //although it is not useful at all, it is to show that I can do both ways

        Data datos = await client.getGift(
            "ItxSJlx7NJaDmK3ioBPuP9jSU9iwmFsY", length.toString());

        //here we add to the memory only the new gifts, and we check in the new gifts if they are marked with like
        List<SqlGift> likedGifts = [];
        try{
        likedGifts = await SqliteService().getLikedGifts();
        }catch(e){
          log("Error, plataform not supported with sqlite");
        }
        List<Gift> gifts = (state.props[0] as List).isNotEmpty
            ? state.props[0] as List<Gift>
            : [];
        for (var i = state.props[1] as int; i < datos.data!.length; i++) {
          if (likedGifts.isNotEmpty) {
            for (var j = 0; j < likedGifts.length; j++) {
              if (datos.data![i].id == likedGifts[j].giftId) {
                datos.data![i].liked = true;
              }
            }
          }
          gifts.add(datos.data![i]);
        }

        emit(GiftLoaded(gifts, length));
      } catch (e) {
        emit(GiftError());
      }
    });

    //here we add or remove the gifts liked to the database, and update the list of gifts in memory
    on<LikedGiftEvent>((event, emit) async {
      try {
        List<Gift> gifts = state.props[0] as List<Gift>;
        for (var i = 0; i < gifts.length; i++) {
          if (gifts[i].id == event.giftId) {
            if (event.isLiked) {
              await SqliteService().deleteLikedGift(gifts[i].id!);
              gifts[i].liked = false;
            } else {
              await SqliteService().insertLikedGift(SqlGift(
                  url: gifts[i].images!.fixed_height_downsampled!.url!,
                  giftId: gifts[i].id!));
              gifts[i].liked = true;
            }
          }
        }
        emit(GiftLoaded(gifts, state.props[1] as int));
      } catch (e) {
        emit(GiftError());
      }
    });
  }
}
