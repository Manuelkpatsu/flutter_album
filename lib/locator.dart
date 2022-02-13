import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_album/repository/album_repository.dart';
import 'package:get_it/get_it.dart';

import 'screen/album/album_flow_coordinator.dart';
import 'screen/album/list/album_list_domain_model.dart';
import 'screen/album/list/album_list_notifier.dart';
import 'screen/album/list/album_tile_event_handler.dart';

final GetIt get = GetIt.instance;

void setupLocator() {
  get.registerFactory(() {
    final options = BaseOptions(baseUrl: 'https://itunes.apple.com');
    return Dio(options);
  });
  get.registerFactory(() => AlbumRepository(get<Dio>()));

  /// AlbumListScreen
  get.registerSingleton<AlbumListDomainModel>(
    AlbumListDomainModel(get<AlbumRepository>()),
  );
  get.registerFactoryParam<MyAlbumFlowCoordinator, BuildContext, void>(
        (context, _) => MyAlbumFlowCoordinator(context),
  );
  get.registerFactory(() => AlbumListNotifier(get<AlbumListDomainModel>()));
  get.registerFactoryParam<AlbumTileEventHandler, BuildContext, void>(
        (context, _) => AlbumTileEventHandler(
      get<AlbumListDomainModel>(),
      get<MyAlbumFlowCoordinator>(param1: context),
    ),
  );
}