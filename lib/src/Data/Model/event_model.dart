import 'package:flutter/material.dart';

class EventModel {
  int id;
  String eventName;
  String eventDescription;
  String? eventLocation;
  // List<Color> taskColors;
  bool isCompleted;
  String eventDate;
  String directoryPath;

  EventModel({
    required this.id,
    required this.eventName,
    required this.directoryPath,
    required this.eventDescription,
    this.eventLocation,
    // required this.taskColors,
    required this.isCompleted,
    required this.eventDate,
  });

  EventModel.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        eventName = json["eventName"],
        eventDescription = json["eventDescription"],
        eventLocation = json["eventLocation"],
        // taskColors = json["taskColors"],
        isCompleted = json["isCompleted"],
        eventDate = json["craetedDate"],
        directoryPath = json["directoryPath"];

  Map<String, dynamic> toJson() => {
    'id': id,
    'eventName': eventName,
    'eventDescription': eventDescription,
    'eventLocation': eventLocation,
    // 'taskColors': taskColors,
    'isCompleted': isCompleted,
    'craetedDate': eventDate,
    'directoryPath': directoryPath,
  };


  @override
  bool operator ==(Object other) {
    return other is EventModel &&
        other.eventName == eventName &&
        other.id == id &&
        other.eventDescription == eventDescription &&
        other.eventLocation == eventLocation &&
        // other.taskColors == taskColors &&
        other.isCompleted == isCompleted &&
        other.directoryPath == directoryPath &&
        other.eventDate == eventDate;
  }

  @override
  int get hashCode => Object.hash(eventName, eventDescription, eventLocation,
      isCompleted, eventDate);

// compare to
}