import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:mmt_project/theme/make_my_trip_colors.dart';
import 'package:mmt_project/utils/extensions/sizedbox/sizedbox_extension.dart';
import 'package:coupon_uikit/coupon_uikit.dart';


class NewUserCouponWidget extends StatelessWidget {
  const NewUserCouponWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: DottedBorder(
        radius: Radius.circular(12),
        color: Colors.black,
        strokeWidth: 2,
        dashPattern: [
          20,
          5,
        ],
        child: Container(

          height: 180,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: LinearGradient(
              colors: [
                Colors.orangeAccent,
                Colors.yellow.shade300,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left:12.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8.0),
                    topRight: Radius.circular(8.0),
                  ),
                  child: Image.network(
                      'https://smaller-pictures.appspot.com/images/dreamstime_xxl_65780868_small.jpg',
                      width: 90,
                      height: 90,
                      fit:BoxFit.fill

                  ),
                ),

              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: VerticalDivider(thickness: 3,color: Colors.blue[900],),
              ),
              Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  20.verticalSpace,
                  Text('25% OFF',textAlign:TextAlign.start,style: TextStyle(fontSize:40,fontWeight: FontWeight.bold,color: Colors.blue[900]),),
                  Text('On all hotels for new users',textAlign: TextAlign.left,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                  Text('Expires at ',style: TextStyle(fontSize: 14,color: Colors.redAccent)),
                  Text('18/08/2023',style: TextStyle(fontSize: 14,color: Colors.redAccent)),
                  25.verticalSpace,
                  Row(
                    children: [
                      60.horizontalSpace,
                      Text('*terms & conditions applied',style: TextStyle(fontSize: 12,color: Colors.green[900],),),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
