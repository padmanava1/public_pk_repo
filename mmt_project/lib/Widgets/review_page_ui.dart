import 'package:flutter/material.dart';
import 'package:mmt_project/theme/make_my_trip_colors.dart';
import 'package:mmt_project/theme/text_styles.dart';
import 'package:mmt_project/utils/extensions/sizedbox/sizedbox_extension.dart';

class ReviewPageUi extends StatelessWidget {
   ReviewPageUi({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    int _val = 2;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Center(
          child: Text('Write a review',style: AppTextStyles.unselectedLabelStyle ,),
        ),
        leading: GestureDetector(onTap: (){
          Navigator.of(context).pop();
        },
            child: Icon(Icons.close,color: MakeMyTripColors.accentColor,size: 25)),
        actions: [
            GestureDetector(
              onTap: (){},
              child: Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Center(child: Text('Publish',style: AppTextStyles.infoContentStyle2,
              ),
            ),
              )
            )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      20.verticalSpace,
                        Row(
                          children: [
                            Icon(Icons.add_circle,color: MakeMyTripColors.color50gray,),
                            10.horizontalSpace,
                            Text('Review',style: AppTextStyles.infoContentStyle)
                          ],
                        ),
                       10.verticalSpace,
                        Padding(
                          padding: const EdgeInsets.only(left: 40,right: 8),
                          child: TextFormField(
                            maxLength: 200,
                            maxLines: 4,
                            keyboardType: TextInputType.multiline,
                            decoration:const InputDecoration(
                                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                                hintStyle: TextStyle(fontWeight: FontWeight.bold)
                            ),
                          ),
                        )
                    ],
                  ),
                ),

            20.verticalSpace,

            Column(
                  children: [
                       Padding(
                         padding: const EdgeInsets.symmetric(horizontal: 8),
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Text('Cleanliness',style: TextStyle(color: Colors.black54,fontSize: 16),),
                             Text('1.0',style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),),

                           ],
                         ),
                       ),
                    Slider(
                        value: _val.toDouble(),
                         min: 1.0,
                         max: 10.0,
                        divisions: 10,
                        thumbColor: Colors.white,
                        activeColor: Colors.blue,
                        inactiveColor: Colors.grey[400],
                        onChanged: (double? value){
                        }),
                   15.verticalSpace,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Comfort',style: TextStyle(color: Colors.black54,fontSize: 16),),
                          Text('1.0',style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),)
                        ],
                      ),
                    ),
                    Slider(
                        value: _val.toDouble(),
                        min: 1.0,
                        max: 10.0,
                        divisions: 10,
                        thumbColor: Colors.white,
                        activeColor: Colors.blue,
                        inactiveColor: Colors.grey[400],
                        onChanged: (double? value){

                        }),
                    15.verticalSpace,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Location',style: TextStyle(color: Colors.black54,fontSize: 16),),
                          Text('1.0',style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),)
                        ],
                      ),
                    ),
                    Slider(
                        value: _val.toDouble(),
                        min: 1.0,
                        max: 10.0,
                        divisions: 10,
                        thumbColor: Colors.white,
                        activeColor: Colors.blue,
                        inactiveColor: Colors.grey[400],
                        onChanged: (double? value){

                        }),
                    15.verticalSpace,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Facilities',style: TextStyle(color: Colors.black54,fontSize: 16),),
                          Text('1.0',style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),)
                        ],
                      ),
                    ),
                    Slider(
                        value: _val.toDouble(),
                        min: 1.0,
                        max: 10.0,
                        divisions: 10,
                        thumbColor: Colors.white,
                        activeColor: Colors.blue,
                        inactiveColor: Colors.grey[400],
                        onChanged: (double? value){

                        }),
                  ],
                )
          ],
        ),
      ),

    );
  }
}
