import 'dart:io';

import 'package:dio/dio.dart';
import 'package:pokemonsearchapp/core/resources/data_state.dart';
import 'package:pokemonsearchapp/features/pokemon_search/data/data_sources/pagination_api_service.dart';
import 'package:pokemonsearchapp/features/pokemon_search/domain/entities/pagination.dart';
import 'package:pokemonsearchapp/features/pokemon_search/domain/repository/pagination_repository.dart';
import 'package:pokemonsearchapp/features/pokemon_search/domain/usecases/get_pagination.dart';

class PaginationRepositoryImpl extends PaginationRepository {
  final PaginationApiService _paginationApiService;
  PaginationRepositoryImpl(this._paginationApiService);

  @override
  Future<DataState<PaginationEntity>> getPagination(
      GetPaginationParams? params) async {
    try {
      final httpResponse = await _paginationApiService.getPagination(
          offset: params!.offset, limit: params.limit);

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(data: httpResponse.data, error: null);
      } else {
        return DataFailed(
            data: null,
            error: DioException(
                requestOptions: httpResponse.response.requestOptions,
                message: httpResponse.response.statusMessage));
      }
    } on DioException catch (e) {
      return DataFailed(error: e);
    }
  }
}
