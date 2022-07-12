import 'package:flutter/material.dart';

class SelectRoomAndGuests extends StatelessWidget {
  final String selectRoomVar;
  final String selectPersonCountVar;
  const SelectRoomAndGuests({Key? key, required this.selectRoomVar, required this.selectPersonCountVar}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 6),
        child: Container(
          // margin: const EdgeInsets.all(15.0),
          // padding: const EdgeInsets.all(3.0),
          height: 60,
          width: double.infinity,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade400)
          ),
          child: Row(
            children:  [
              Padding(
                padding: EdgeInsets.all(6.0),
                child: Icon(Icons.person,color: Colors.grey,),
              ),
              RichText(text: TextSpan(text: "ROOMS & GUESTS \n",style: TextStyle(color: Colors.grey,fontSize: 12,fontWeight: FontWeight.w500),
                  children: [TextSpan(
                      text:"${selectRoomVar}, ",style: TextStyle(fontWeight: FontWeight.w700,color: Colors.black,fontSize: 16),
                      children: [TextSpan(
                          text: "${selectPersonCountVar}",style: TextStyle(fontWeight: FontWeight.w700,color: Colors.black,fontSize: 16),
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
