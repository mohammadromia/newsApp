import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

import 'features/news/data/datasources/local/app_database.dart';
import 'features/news/data/datasources/remote/news_api_service.dart';
import 'features/news/data/repositories/article_repository_impl.dart';
import 'features/news/domain/repositories/article_repository.dart';
import 'features/news/domain/usecases/get_article.dart';
import 'features/news/domain/usecases/get_saved_article.dart';
import 'features/news/domain/usecases/remove_article.dart';
import 'features/news/domain/usecases/save_article.dart';
import 'features/news/presentation/bloc/local/local_article_bloc.dart';
import 'features/news/presentation/bloc/remote/remote_bloc.dart';


final sl = GetIt.instance;

Future<void> initializeDependencies() async {

  final database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  sl.registerSingleton<AppDatabase>(database);
  
  // Dio
  sl.registerSingleton<Dio>(Dio());

  // Dependencies
  sl.registerSingleton<NewsApiService>(NewsApiService(sl()));

  sl.registerSingleton<ArticleRepository>(
    ArticleRepositoryImpl(sl(),sl())
  );
  
  //UseCases
  sl.registerSingleton<GetArticleUseCase>(
    GetArticleUseCase(sl())
  );

  sl.registerSingleton<GetSavedArticleUseCase>(
    GetSavedArticleUseCase(sl())
  );

  sl.registerSingleton<SaveArticleUseCase>(
    SaveArticleUseCase(sl())
  );
  
  sl.registerSingleton<RemoveArticleUseCase>(
    RemoveArticleUseCase(sl())
  );


  //Blocs
  sl.registerFactory<RemoteArticlesBloc>(
    ()=> RemoteArticlesBloc(sl())
  );

  sl.registerFactory<LocalArticleBloc>(
    ()=> LocalArticleBloc(sl(),sl(),sl())
  );


}