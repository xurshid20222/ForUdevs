import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../Core/styles/colors.dart';
import '../../../../Core/styles/text_style.dart';
import '../../Bloc/add_event_bloc.dart';

class AddEventScreen extends StatefulWidget {

  final String currentPath;
  const AddEventScreen({super.key, required this.currentPath});

  @override
  State<AddEventScreen> createState() => _AddEventScreenState();
}

class _AddEventScreenState extends State<AddEventScreen> {

  @override
  Widget build(BuildContext context) {

    debugPrint('DetailPage=================================>${widget.currentPath}');
    return BlocProvider(
      create: (context) => AddEventBloc(),
      child: Builder(
          builder: (context) {
            var bloc = context.read<AddEventBloc>();
            return BlocListener<AddEventBloc, AddEventState>(

              listener: (context, state) {
                if(state is DetailsSuccessStoreState) {
                  // Utils.fireSnackBar(state.successMessage, context);
                  Navigator.pop(context, "refresh");
                }

                if(state is DetailsErrorState) {
                  // Utils.fireSnackBar(state.errorMessage, context);
                }
              },
              child: Scaffold(
                backgroundColor: AppColors.cF8F8F8,
                resizeToAvoidBottomInset: false,
                appBar: AppBar(
                  backgroundColor: AppColors.transparent,
                  elevation: 0,
                  leading: IconButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    icon: const Icon(CupertinoIcons.arrow_left, color: AppColors.c6B7280),
                  ),
                ),
                body: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 19),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16),
                      //#EventName
                      Text('Event name', style: AppTextStyle.titleSmall?.copyWith(fontWeight: FontWeight.w400),),
                      const SizedBox(height: 5),
                      Container(
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColors.cF3F4F6,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child:  TextField(
                          controller: bloc.eventNameController,
                          decoration: const InputDecoration(
                              border: InputBorder.none
                          ),
                        ),
                      ),

                      const SizedBox(height: 16),
                      //#EventDescription
                      Text('Event description', style: AppTextStyle.titleSmall?.copyWith(fontWeight: FontWeight.w400),),
                      const SizedBox(height: 5),
                      Container(
                        height: 134,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColors.cF3F4F6,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child:  TextField(
                          controller: bloc.eventDescriptionController,
                          decoration: const InputDecoration(
                              border: InputBorder.none
                          ),
                        ),
                      ),


                      const SizedBox(height: 16),
                      //#EventLocation
                      Text('Event location', style: AppTextStyle.titleSmall?.copyWith(fontWeight: FontWeight.w400),),
                      const SizedBox(height: 5),
                      Container(
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColors.cF3F4F6,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child:  TextField(
                          controller: bloc.eventLocationController,
                          decoration:const InputDecoration(
                              border: InputBorder.none,
                              suffixIcon: Icon(CupertinoIcons.location_solid, color: AppColors.c009FEE,)
                          ),
                        ),
                      ),

                      const SizedBox(height: 16),
                      //#selectItemColor
                      Text('Priority color', style: AppTextStyle.titleSmall?.copyWith(fontWeight: FontWeight.w400),),
                      const SizedBox(height: 5),
                      Container(
                        alignment: Alignment.center,
                        // padding: EdgeInsets.only(left: 5),
                        height: 40,
                        width: 90,
                        decoration: BoxDecoration(
                          color: AppColors.cF3F4F6,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Center(
                              child: Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(2),
                                ),
                              ),
                            ),

                            IconButton(
                                padding: EdgeInsets.zero,
                                onPressed: (){
                                  // _showSimpleDialog();
                                },
                                icon: const Icon(Icons.keyboard_arrow_down_outlined, size: 30,))
                          ],
                        ),
                      ),


                      const SizedBox(height: 16),
                      //#EventTime
                      Text('Event time', style: AppTextStyle.titleSmall?.copyWith(fontWeight: FontWeight.w400),),
                      const SizedBox(height: 5),
                      Container(
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColors.cF3F4F6,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child:  TextField(
                          controller: bloc.eventTimeController,
                          decoration: const InputDecoration(
                              border: InputBorder.none
                          ),
                        ),
                      ),



                    ],
                  ),
                ),
                floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
                floatingActionButton:  Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ElevatedButton(
                    onPressed: (){
                      bloc.add(DetailsSaveEvent(path: widget.currentPath));
                    },
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 46),
                        backgroundColor: AppColors.c009FEE,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)
                        )
                    ),
                    child: Text('Add', style: AppTextStyle.titleMedium?.copyWith(color: AppColors.white),),
                  ),
                ),
              ),
            );
          }
      ),
    );
  }
}


