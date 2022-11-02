import 'package:flutter/material.dart';
import 'package:mmt_project/Pages/coupon_carousel.dart';
import 'package:mmt_project/theme/text_styles.dart';

class MyBookingPage extends StatelessWidget {
  const MyBookingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0,backgroundColor: Colors.transparent,title: Text('My Bookings', style: AppTextStyles.unselectedLabelStyle,),),
      body:SingleChildScrollView(
        child: Column(
          children: [
            NewUserCouponWidget()
          ],
        ),
      )
    );
  }
}
