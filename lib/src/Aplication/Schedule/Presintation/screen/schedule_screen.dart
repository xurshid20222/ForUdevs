import 'package:flutter/material.dart' hide CalendarDatePicker;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udevs_task/src/Aplication/Schedule/Bloc/schedule_bloc.dart';
import 'package:udevs_task/src/Aplication/Schedule/Presintation/widget/planning_items.dart';
import 'package:udevs_task/src/Core/styles/colors.dart';
import 'package:udevs_task/src/Data/Model/event_model.dart';
import '../../../../Core/styles/text_style.dart';
import '../../../AddEvent/Presintation/screen/add_event_screen.dart';
import '../../../Description/Presintation/screen/description_screen.dart';
import '../widget/custom_calendar.dart';

class ScheduleScreen extends StatefulWidget {
   const ScheduleScreen({super.key});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {

  final ScheduleBloc bloc = ScheduleBloc();
  @override
  void initState() {
   bloc.add(InitialEvents());
   bloc.readFolder();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ScheduleBloc, ScheduleState>(
      bloc: bloc,
      listenWhen: (previous, current) => current is ScheduleStateActionState,
      buildWhen: (previous, current) => current is !ScheduleStateActionState,
      listener: (context, state) {
        if(state is ScheduleNavigatorForWatchState){
          Navigator.push(context, MaterialPageRoute(builder: (context) => const DescriptionScreen()));
        }else if(state is ScheduleNavigatorAddScreenState){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>  AddEventScreen(currentPath: '${bloc.mainDirectory.path}/${bloc.fullFolderPathForFile}',)));
          debugPrint('NP-------------------------------->P${bloc.mainDirectory.path}/${bloc.fullFolderPathForFile}');
        }
      },
      builder: (context, state){
        switch(state.runtimeType){
          case IsLoadingState:
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          case ScheduleGetEventsState:
            final successState = state as ScheduleGetEventsState;
            return Scaffold(
              backgroundColor: AppColors.cF8F8F8,
              appBar: AppBar(
                backgroundColor: AppColors.transparent,
                elevation: 0,
                title: Column(
                  children: [
                    Text('Sunday', style: Theme.of(context).textTheme.titleSmall),
                    Text('28 September 2021', style: Theme.of(context).textTheme.labelSmall),
                  ],
                ),
                centerTitle: true,
                actions: [
                  IconButton(
                    onPressed: (){},
                    icon: const Icon(Icons.notifications, color: AppColors.black,),
                  ),
                ],
              ),
              body: Column(
                children: [
                  //#showMyMakeCalendar
                  CalendarDatePicker(initialDate: DateTime.now(), firstDate: DateTime(1920), lastDate: DateTime(2060),
                    onDateChanged: (DateTime value) {
                       bloc.fullFolderPathForFile = value.toString().substring(0, 10);
                       bloc.createFolderIntoAppFolder(bloc.fullFolderPathForFile);
                       debugPrint('P=================================>>>>>>>>>>>>>>>>>>>>>${bloc.fullFolderPathForFile}');

                    },
                  ),

                  //#addButton
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Schedule', style: AppTextStyle.titleSmall?.copyWith(color: AppColors.c292929),),

                        //#addEventButton
                        ElevatedButton(
                            onPressed: (){
                              bloc.add(ClickedNavNextToScreenEvent(dirPath: '${bloc.mainDirectory.path}/${bloc.fullFolderPathForFile}'));

                              Future.delayed(Duration.zero).then((value){
                                debugPrint('Path=================================>>>>>>>>>>>>>>>>>>>>>${bloc.mainDirectory.path}/${bloc.fullFolderPathForFile}');
                              });
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.c009FEE,
                                elevation: 0,
                                minimumSize: const Size(102, 30),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)
                                )
                            ),
                            child: Text('+ Add Event',style: AppTextStyle.labelSmall?.copyWith(color: AppColors.white, fontWeight: FontWeight.w600),)
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 18),
                      itemCount: successState.events.length,
                      itemBuilder: (context, index){
                        EventModel makeItem = successState.events[index];
                        // dirPath = makeItem.directoryPath;
                        return  PlanningItems(openForWatch: () {
                          context.read<ScheduleBloc>().add(WatchClickedNavEvent());
                        },
                          eventName: makeItem.eventName,
                          description: makeItem.eventDescription,
                          eventDate: makeItem.eventDate,
                          eventLocation: makeItem.eventLocation ?? '',
                          color: Colors.red// makeItem.taskColors[index],
                        );
                      },
                    ),
                  )



                ],
              ),

            );

          case ScheduleErrorState:
            return const Scaffold(
              body: Text('Error'),
            );
            default:
              return const SizedBox();
        }
      }
    );
  }
}

/*
Container(
      padding: const EdgeInsetsDirectional.only(start: 16, end: 4),
      height: _subHeaderHeight,
      child: Row(
        children: <Widget>[
          Flexible(
            child: Semantics(
              label: MaterialLocalizations.of(context).selectYearSemanticsLabel,
              excludeSemantics: true,
              button: true,
              child: SizedBox(
                height: _subHeaderHeight,
                child: InkWell(
                  onTap: widget.onTitlePressed,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      children: <Widget>[
                        Flexible(
                          child: Text(
                            widget.title,
                            overflow: TextOverflow.ellipsis,
                            style: textTheme.titleSmall?.copyWith(
                              fontSize: 14,
                              color: const Color(0xFF292929),
                            ),
                          ),
                        ),
                        // RotationTransition(
                        //   turns: _controller,
                        //   child: Icon(
                        //     Icons.arrow_drop_down,
                        //     color: controlColor,
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          if (widget.mode == DatePickerMode.day)
          // Give space for the prev/next month buttons that are underneath this row
            const SizedBox(width: _monthNavButtonsWidth),
        ],
      ),
    );
* */







