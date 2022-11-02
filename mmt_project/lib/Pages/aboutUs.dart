import 'package:flutter/material.dart';
import 'package:mmt_project/theme/text_styles.dart';
import 'package:mmt_project/utils/extensions/sizedbox/sizedbox_extension.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 15.0,left: 30,right: 20,bottom: 20),
          child: Column(
            children: [
              40.verticalSpace,
              Text('About Us',style: AppTextStyles.labelNameTextStyle,),
              30.verticalSpace,
              Text('Travelsy is one-stop solution for all your travel needs. Travelsy provides us time-saving value added services along with'
                  '24/7 accessibility and technical support. You are just a few clicks away from booking your choice hotel. You can book hotel all over India from '
                  'anywhere just by using our app.'),
              10.verticalSpace,
              Text('Our goal is to create one-stop solution regarding travel booking.We aim to provide the best possible user experience across their travel journey'
                  'which includes effective planning, resources, superior booking experience and 24/7 live customer support.')
            ],
          ),
        ),
      )
    );
  }
}
