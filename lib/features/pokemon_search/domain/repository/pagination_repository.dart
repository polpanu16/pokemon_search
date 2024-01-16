import 'package:pokemonsearchapp/core/resources/data_state.dart';
import 'package:pokemonsearchapp/features/pokemon_search/domain/entities/pagination.dart';
import 'package:pokemonsearchapp/features/pokemon_search/domain/usecases/get_pagination.dart';

abstract class PaginationRepository {
  Future<DataState<PaginationEntity>> getPagination(
      GetPaginationParams? params);
}
