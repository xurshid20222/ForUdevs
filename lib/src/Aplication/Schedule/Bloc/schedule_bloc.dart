import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:udevs_task/src/Data/Model/event_model.dart';

import '../../../Domain/post_repazitory.dart';
part 'schedule_event.dart';
part 'schedule_state.dart';

class ScheduleBloc extends Bloc<ScheduleEvent, ScheduleState> {


  late List<FileSystemEntity> listDirectory;
  late Directory mainDirectory;
  late String fullFolderPathForFile;
  PostRepository postRepository = PostRepository();


  ScheduleBloc() : super( const ScheduleInitialState()) {
    on<InitialEvents>(initialEvents);
    on<WatchClickedNavEvent>(watchClickedNavEvent);
    on<ClickedNavNextToScreenEvent>(clickedNavNextToScreenEvent);
    // on<GetEventsEvent>(getEventsEvent);
  }

  Future<void> initialEvents(InitialEvents event, Emitter<ScheduleState> emit)async{
    Future.delayed(const Duration(seconds: 3));
    emit(const IsLoadingState(isLoading: true));
    emit(const ScheduleInitialState());
  }

  // Future<void> getEventsEvent(GetEventsEvent event, Emitter<ScheduleState> emit)async{
  //   List<EventModel> eventsList = await postRepository.getAllEvents(event.dirPath);
  //   emit(const IsLoadingState(isLoading: true));
  //   emit( ScheduleGetEventsState(events: eventsList, dirPath: event.dirPath));
  // }

  Future<void> watchClickedNavEvent(WatchClickedNavEvent event, Emitter<ScheduleState> emit)async{
     emit(const ScheduleNavigatorForWatchState());
  }

  Future<void> clickedNavNextToScreenEvent(ClickedNavNextToScreenEvent event, Emitter<ScheduleState> emit)async{
    emit(ScheduleNavigatorAddScreenState(dirPath: event.dirPath));
    debugPrint('111111111111111111111111111111111111111${event.dirPath}');
  }


  //#create Folder for Device memory
  Future<void> readFolder() async {
    if(Platform.isIOS) {
      mainDirectory = await getApplicationDocumentsDirectory();
      listDirectory = mainDirectory.listSync();

      FileSystemEntity? trash;
      for (var element in listDirectory) {
        if(element.path.contains("/.Trash")) {
          trash = element;
        }
      }
      listDirectory.remove(trash);
    } else {
      String pathAndroid = "storage/emulated/0/EventApp";
      if(await Permission.manageExternalStorage.request().isGranted && await Permission.storage.request().isGranted) {
        mainDirectory = Directory(pathAndroid);
        bool isExist = await mainDirectory.exists();
        if(!isExist) {
          mainDirectory.create();
          mainDirectory = Directory(pathAndroid);
        }
        listDirectory = mainDirectory.listSync();
      }
    }
  }

  void createFolderIntoAppFolder(String backgroundFolderName) async {
    String folderName = backgroundFolderName;



    String fullPath = "${mainDirectory.path}/$folderName";
    Directory directory = Directory(fullPath);
    bool isExist = await directory.exists();
    if(isExist) {

    } else {
      await directory.create();

      readFolder();
      // Navigator.pop(context);
    }
  }





}
