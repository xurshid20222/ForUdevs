import 'dart:convert';
import 'dart:io';
import 'package:udevs_task/src/Data/Model/event_model.dart';

class FileService {
  static Future<void> createEvent(EventModel event) async {
    String pathDirectory = event.directoryPath;
    String fileName = event.eventName;
    fileName += ".todo_event";
    File file = File("$pathDirectory/$fileName");
    String data = jsonEncode(event.toJson());
    await file.writeAsString(data);
  }

  static Future<void> deleteEvent(EventModel event) async {
    String pathDirectory = event.directoryPath;
    String fileName = event.eventName;
    fileName += ".todo_event";
    File file = File("$pathDirectory/$fileName");
    await file.delete();
  }

  static Future<List<EventModel>> getAllEvent(String directoryPath) async {
    Directory directory = Directory(directoryPath);
    List<FileSystemEntity> items = directory.listSync();
    List<EventModel> events = [];

    for (var element in items) {
      if(!element.path.contains(".todo_event")) {
        continue;
      }
      EventModel event = await readEvent(element.path);
      events.add(event);
    }

    return events;
  }

  static Future<void> updateEvent(String oldName, EventModel event) async {
    String pathDirectory = event.directoryPath;
    String fileName = oldName;
    fileName += ".todo_event";
    File file = File("$pathDirectory/$fileName");

    fileName = event.eventName;
    fileName += ".todo_event";
    file = await file.rename("$pathDirectory/$fileName");

    String data = jsonEncode(event.toJson());
    await file.writeAsString(data);
  }

  static Future<EventModel> readEvent(String path) async {
    File file = File(path);
    String data = await file.readAsString();
    EventModel eventModel = EventModel.fromJson(jsonDecode(data));
    return eventModel;
  }

  static Future<bool> existEvent(EventModel event) async {
    String pathDirectory = event.directoryPath;
    String fileName = event.eventName;
    fileName += ".todo_event";
    File file = File("$pathDirectory/$fileName");
    return await file.exists();
  }
}