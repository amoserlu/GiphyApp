import 'package:capgemini/data/models/gifts.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'giphy.g.dart';

@RestApi(baseUrl: "https://api.giphy.com/v1/gifs/")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/trending")
  Future<Data> getGift(
    @Query("api_key") String apiKey,
    @Query("limit") String limit,
  );
}
