import 'package:Test_task/data/models/gif_info.dart';
import 'package:dio/dio.dart';

class GiphyApiRepo {
  static const String ROOT_URL = "https://api.giphy.com/v1/gifs/trending";
  static const String API_KEY = "kXv4cqeofwtxrffFNZRfYi9mcJuvhiKm";

  Future<List<GifInfo>> getGifs(int offset, [int limit = 25]) async {
    try {
      Dio dio = Dio();
      Response response = await dio.get(ROOT_URL, queryParameters: {
        'api_key': API_KEY,
        "offset": offset.toString(),
        "limit": limit.toString()
      });
      return parseGifs(response.data['data']);
    } catch (e, _) {
      print("$e \n $_");
    }
  }
}

List<GifInfo> parseGifs(List<dynamic> responseBody) {
  return responseBody.map<GifInfo>((json) => GifInfo.fromJson(json)).toList();
}
