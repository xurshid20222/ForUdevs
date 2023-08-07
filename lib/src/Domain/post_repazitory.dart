import 'dart:io';

import 'package:flutter/rendering.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:udevs_task/src/Data/DataProvider/folder_data.dart';
import 'package:udevs_task/src/Data/Model/event_model.dart';

class PostRepository {


  // static final instance = PostRepository._();




  Future<List<EventModel>> getAllEvents(String dirPath) async {
    List<EventModel> list = await FileService.getAllEvent(dirPath);

    return list;
  }

  // void _getAllTodos() async {
  //   isLoading = true;
  //   setState(() {});
  //
  //   List<ToDo> items = await FileService.getAllToDo(widget.path!);
  //   for(ToDo item in items) {
  //     if(item.isCompleted) {
  //       completedTodos.add(item);
  //     } else {
  //       unCompletedTodos.add(item);
  //     }
  //   }
  //
  //   isLoading = false;
  //   setState(() {});
  // }


  Future<void> createEvent(EventModel eventModel, String currentPath) async {
    String directoryPath = currentPath;
    EventModel event = EventModel(id: eventModel.id, eventName: eventModel.eventName, directoryPath: directoryPath, eventDescription: eventModel.eventDescription,  isCompleted: eventModel.isCompleted, eventDate: eventModel.eventDate);
    await FileService.createEvent(event);
    // Map<String, dynamic> json = {
    //   "title": title,
    //   "body": body,
    //   "userId": userId,
    // };



  }



  // Future<bool> deletePost(String id) async {
  //   String? response = await networkProvider.DELETE(ApiConstants.baseUrl, ApiConstants.apiOnePost + id);
  //   return response != null;
  // }
  //
  // Future<bool> createPost(String title, String body, int userId) async {
  //   Map<String, dynamic> json = {
  //     "title": title,
  //     "body": body,
  //     "userId": userId,
  //   };
  //
  //   String? response = await networkProvider.POST(ApiConstants.baseUrl, ApiConstants.apiPost, json);
  //   return response != null;
  // }
}