import 'package:pokemonsearchapp/core/resources/data_state.dart';
import 'package:pokemonsearchapp/core/usecases/usecase.dart';
import 'package:pokemonsearchapp/features/pokemon_search/domain/entities/pagination.dart';
import 'package:pokemonsearchapp/features/pokemon_search/domain/repository/pagination_repository.dart';

class GetPaginationUsecase
    implements UseCase<DataState<PaginationEntity>, GetPaginationParams> {
  final PaginationRepository _pokemonRepository;
  GetPaginationUsecase(this._pokemonRepository);

  @override
  Future<DataState<PaginationEntity>> call({GetPaginationParams? params}) {
    return _pokemonRepository.getPagination(params);
  }
}

class GetPaginationParams {
  final String offset;
  final String limit;

  GetPaginationParams({required this.offset, required this.limit});
}
