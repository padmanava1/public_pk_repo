import 'package:flutter/material.dart';
import 'package:mmt_project/Widgets/checkInDetailsWidget.dart';
import 'package:mmt_project/Widgets/checkOutDetailsWidget.dart';
import 'package:mmt_project/Widgets/rooms&guests.dart';

import 'package:mmt_project/Widgets/selectCityContainer.dart';

class SearchHotelspage extends StatelessWidget {
  const SearchHotelspage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          //backgroundColor: Colors.blue[50],
          appBar: AppBar(

            titleSpacing: 0,
            //centerTitle: false,
            elevation: 0,
            backgroundColor: Colors.transparent,
            leading: GestureDetector(onTap:(){

            },
                child: const Icon(Icons.arrow_back,color: Colors.grey,)),

            title: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('Hotels & Homestays         ',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),),
                Text('India or International     ',style: TextStyle(color: Colors.grey,fontSize: 15),)
              ],
            ),
            actions: [
              GestureDetector(
                onTap: (){},
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.favorite_border,color: Colors.blue,),
                      Text('Wishlist',style: TextStyle(color: Colors.blue),)

                    ],
                  ),
                ),
              ),
            ],
          ),

          body: SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade400)
              ),
              child: Column(
                children: [
                  SelectCityContainer(selectCountryVar: 'India', selectCityVar: 'Ahmedabad',),
                  Row(children: [
                    Expanded(
                      flex: 2,
                      child: CheckInDetails(),
                  ),
                    Expanded(
                      flex: 2,
                      child: CheckOutDetailsWidget(),
                    )
                ],
              ),
                  SelectRoomAndGuests(selectPersonCountVar: '2 Adults', selectRoomVar: '1 Room',),
                  SizedBox(
                    height: 60,
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 10),
                      child: ElevatedButton(onPressed: (){}, child: Text('SEARCH HOTELS',style: TextStyle(fontSize: 18),),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.lightBlue[700],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10), // <-- Radius
                          ),


                        ) ,),
                    ),
                  )
                ]
          ),
            ),
        )
    ));
  }
}
