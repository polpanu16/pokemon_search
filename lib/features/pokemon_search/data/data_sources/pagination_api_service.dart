import 'package:dio/dio.dart';
import 'package:pokemonsearchapp/features/pokemon_search/data/models/pagination_model.dart';
import 'package:retrofit/retrofit.dart';
part 'pagination_api_service.g.dart';

@RestApi(baseUrl: "https://pokeapi.co/api/v2")
abstract class PaginationApiService {
  factory PaginationApiService(Dio dio) = _PaginationApiService;

  @GET('/pokemon')
  Future<HttpResponse<PaginationModel>> getPagination({
    @Query("offset") String? offset,
    @Query("limit") String? limit,
  });
}
