import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pokemonsearchapp/features/pokemon_search/data/data_sources/pagination_api_service.dart';
import 'package:pokemonsearchapp/features/pokemon_search/data/data_sources/pokemon_details_api_service.dart';
import 'package:pokemonsearchapp/features/pokemon_search/data/repository/pagination_repository_impl.dart';
import 'package:pokemonsearchapp/features/pokemon_search/data/repository/pokemon_detail_repository_impl.dart';
import 'package:pokemonsearchapp/features/pokemon_search/domain/repository/pagination_repository.dart';
import 'package:pokemonsearchapp/features/pokemon_search/domain/repository/pokemon_details_repository.dart';
import 'package:pokemonsearchapp/features/pokemon_search/domain/usecases/get_pagination.dart';
import 'package:pokemonsearchapp/features/pokemon_search/domain/usecases/get_pokemon_details.dart';
import 'package:pokemonsearchapp/features/pokemon_search/presentation/bloc/pokemon_search_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // Dio
  sl.registerSingleton<Dio>(Dio());

  // dependencies
  sl.registerSingleton<PaginationApiService>(PaginationApiService(sl()));
  sl.registerSingleton<PaginationRepository>(PaginationRepositoryImpl(sl()));
  sl.registerSingleton<PokemonDetailsApiService>(
      PokemonDetailsApiService(sl()));
  sl.registerSingleton<PokemonDetailsRepository>(
      PokemonDetailsRepositoryImpl(sl()));

  //Usecases
  sl.registerSingleton<GetPaginationUsecase>(GetPaginationUsecase(sl()));
  sl.registerSingleton<GetPokemonDetailsUsecase>(
      GetPokemonDetailsUsecase(sl()));

  //Blocs
  sl.registerFactory<PokemonSearchBloc>(() => PokemonSearchBloc(sl(), sl()));
}
