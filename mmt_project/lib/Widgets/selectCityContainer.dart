import 'package:flutter/material.dart';
 class SelectCityContainer extends StatelessWidget {
   final String selectCityVar;
   final String selectCountryVar;
   const SelectCityContainer({Key? key, required this.selectCityVar, required this.selectCountryVar}) : super(key: key);

   @override
   Widget build(BuildContext context) {
     return GestureDetector(
       onTap: (){},
       child: Padding(
         padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 6),
         child: Container(
           //margin: const EdgeInsets.all(15.0),
            //padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 25),
           height: 60,
           width: double.infinity,
           decoration: BoxDecoration(
               border: Border.all(color: Colors.grey.shade400)
           ),
           child: Row(
             children:  [
               Padding(
                 padding: EdgeInsets.all(6.0),
                 child: Icon(Icons.location_on_outlined,color: Colors.grey,),
               ),
               RichText(text: TextSpan(text: "CITY/AREA/LANDMARK/PROPERTY NAME \n",style: TextStyle(color: Colors.grey,fontSize: 12,fontWeight: FontWeight.w500),
                   children: [TextSpan(
                       text:"${selectCityVar}\n",style: TextStyle(fontWeight: FontWeight.w700,color: Colors.black,fontSize: 16),
                       children: [TextSpan(
                           text: "${selectCountryVar}",style: TextStyle(color: Colors.black,fontSize: 12,fontWeight: FontWeight.normal)
                       )]
                   )]
               )
               )

             ],
           ),
         ),
       ),
     );
   }
 }
