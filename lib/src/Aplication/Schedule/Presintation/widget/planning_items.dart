
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../Core/styles/text_style.dart';

class PlanningItems extends StatelessWidget {
  final VoidCallback openForWatch;
  final String eventName;
  final String description;
  final String eventDate;
  final String eventLocation;
  final Color color;
  const PlanningItems({super.key, required this.openForWatch, required this.eventName, required this.description, required this.eventDate, required this.eventLocation, required this.color});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: openForWatch,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 7),
        height: 110,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(10),
        ),
        child:  Column(
          children: [
            Container(
              height: 12,
                decoration:  BoxDecoration(
                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                  color: color,
                )

            ),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(eventName, style: AppTextStyle.titleSmall?.copyWith(color: Colors.white),),

                  const SizedBox(height: 4),
                  //#description
                  Text(description, style: AppTextStyle.labelSmall?.copyWith(color: Colors.white),),

                   const SizedBox(height: 15),
                  //#time and location
                  Row(
                    children: [
                      const Icon(Icons.access_time, color: Colors.white,size: 20,),
                      const SizedBox(width: 5),
                      Text(eventDate, style: AppTextStyle.bodySmall?.copyWith(color: Colors.white),
                      ),
                      const SizedBox(width: 12),
                      const Icon(CupertinoIcons.location_solid, color: Colors.white,size: 20,),
                      const SizedBox(width: 5),
                      Text(eventLocation, style: AppTextStyle.bodySmall?.copyWith(color: Colors.white,),

                      ),
                    ],
                  )
                ],
              ),
            ),


          ],
        )


      ),
    );
  }
}
