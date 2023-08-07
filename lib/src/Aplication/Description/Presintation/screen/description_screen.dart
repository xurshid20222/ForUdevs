
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../Core/styles/colors.dart';
import '../../../../Core/styles/text_style.dart';

class DescriptionScreen extends StatelessWidget {
  const DescriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cF8F8F8,
      appBar: AppBar(
        backgroundColor: AppColors.c009FEE,
        automaticallyImplyLeading: false,
        // leading: Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 5),
        //   child: MaterialButton(
        //     onPressed: (){
        //       Navigator.pop(context);
        //     },
        //     color: AppColors.white,
        //     shape: const CircleBorder(),
        //     child: const Icon(CupertinoIcons.back, color: AppColors.c6B7280),
        //   ),
        // ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30.0),
            bottomRight: Radius.circular(30.0),
          ),
        ),

        bottom:  PreferredSize(
          preferredSize:const  Size.fromHeight(180),
          child:  Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    //#backButton
                    InkWell(
                      borderRadius: BorderRadius.circular(40),
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Container(
                        alignment: Alignment.center,
                          height: 40,
                          width: 40,
                          decoration: const BoxDecoration(
                            color: AppColors.white,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(CupertinoIcons.back, color: AppColors.c6B7280)),
                    ),

                    //#edit
                    Row(
                      children: [
                        IconButton(onPressed: (){},
                          icon: const Icon(Icons.edit, color: AppColors.white,size: 20,),
                        ),
                        Text('Edit', style: AppTextStyle.titleSmall?.copyWith(fontWeight: FontWeight.w500, color: AppColors.white),),
                        const SizedBox(width: 15,),
                      ],
                    )

                  ],
                ),
                const SizedBox(height: 20),

                Text('Watching Football ', style: AppTextStyle.titleLarge?.copyWith(color: Colors.white),),

                const SizedBox(height: 4),
                //#description
                Text('Manchester United vs Arsenal (Premiere League)', style: AppTextStyle.labelSmall?.copyWith(color: Colors.white),),

                const SizedBox(height: 15),
                //#time and location
                Row(
                  children: [
                    const Icon(Icons.access_time, color: Colors.white,size: 20,),
                    const SizedBox(width: 5),
                    Text('17:00 - 18:30', style: AppTextStyle.bodySmall?.copyWith(color: Colors.white),
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                Row(
                  children: [
                    const Icon(CupertinoIcons.location_solid, color: Colors.white,size: 20,),
                    const SizedBox(width: 5),
                    Text('17:00 - 18:30', style: AppTextStyle.bodySmall?.copyWith(color: Colors.white,),

                )
              ],
            ),
  ]
        ),
          ),
      ),
    ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Reminder', style: AppTextStyle.titleMedium),
            Text('15 minutes befor', style: AppTextStyle.titleMedium?.copyWith(fontWeight: FontWeight.w500, color: AppColors.c7C7B7B)),

            const SizedBox(height: 22),
            Text('Description', style: AppTextStyle.titleMedium),
            Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus vel ex sit amet neque dignissim mattis non eu est. Etiam pulvinar est mi, et porta magna accumsan nec. Ut vitae urna nisl. Integer gravida sollicitudin massa, ut congue orci posuere sit amet. Aenean laoreet egestas est, ut auctor nulla suscipit non.', style: AppTextStyle.labelSmall?.copyWith(color: AppColors.c7C7B7B)),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton:  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ElevatedButton(
          onPressed: (){},
          style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 46),
              backgroundColor: AppColors.cFEE8E9,
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)
              )
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.delete, color: AppColors.cEE2B00,),
              Text('Delete Event', style: AppTextStyle.titleMedium?.copyWith(color: AppColors.c292929),),
            ],
          ),
        ),
      ),
    );
  }
}
