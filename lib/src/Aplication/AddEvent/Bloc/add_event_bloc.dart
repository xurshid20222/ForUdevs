import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:udevs_task/src/Data/Model/event_model.dart';
import 'package:udevs_task/src/Domain/post_repazitory.dart';

part 'add_event_event.dart';
part 'add_event_state.dart';

class AddEventBloc extends Bloc<AddEventEvent, AddEventState> {

  PostRepository postRepository = PostRepository();

  TextEditingController eventNameController = TextEditingController();
  TextEditingController eventDescriptionController = TextEditingController();
  TextEditingController eventLocationController = TextEditingController();
  TextEditingController eventTimeController = TextEditingController();
  // Color selectColor = const Color(0xffffffff);
  List<Color> selectColor = [Colors.red, Colors.green, Colors.yellow, Colors.blue, Colors.black, Colors.white, Colors.pink, Colors.brown, Colors.lightGreen, Colors.purple];


  AddEventBloc() : super(const AddEventInitial()) {
    on<DetailsSaveEvent>(_storeEvent);
  }


  Future<void> _storeEvent(DetailsSaveEvent event, Emitter<AddEventState> emit) async {


    String eventName = eventNameController.text.trim();
    String description = eventDescriptionController.text.trim();
    String eventDate = eventTimeController.text.trim();
    String eventLocation = eventLocationController.text.trim();

    if(eventName.isEmpty || description.isEmpty || eventDate.isEmpty) {
      emit(DetailsErrorState("$eventName, $description and $eventDate are required!!!"));
      return;
    }

    emit( const AddEventInitial());
    emit(DetailsErrorState(event.path));
    EventModel eventModel = EventModel(id: Random().nextInt(100),  eventName: eventName, directoryPath: event.path, eventDescription: description, isCompleted: true, eventDate: eventDate,);
     await postRepository.createEvent(eventModel,event.path);
      emit(const AddPageIsLoadingState(isLoading: true));
     emit(const DetailsSuccessStoreState('Success'));
  }







  // Future<void> _showSimpleDialog(BuildContext context) async {
  //   await showDialog<void>(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return SimpleDialog(
  //             clipBehavior: Clip.antiAlias,
  //             title: const Text('Select Color'),
  //             shape: RoundedRectangleBorder(
  //                 borderRadius: BorderRadius.circular(50)
  //             ),
  //             children: List.generate(colors.length, (index){
  //               return MaterialButton(
  //                 hoverElevation: 10,
  //                 onPressed: (){
  //                   Navigator.pop(context);
  //                   setState(() {
  //                     selectColor = colors[index];
  //                   });
  //                 },
  //                 child: Container(
  //                   margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
  //                   decoration: BoxDecoration(
  //                     borderRadius: BorderRadius.circular(10),
  //                     color: colors[index],
  //                   ),
  //                   height: 30,
  //                   width: double.infinity,
  //                 ),
  //               );
  //             })
  //         );
  //       });
  // }
}
