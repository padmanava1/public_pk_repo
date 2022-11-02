import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mmt_project/Pages/coupon_carousel.dart';
import 'package:mmt_project/Widgets/review_card_widget.dart';
import 'package:mmt_project/theme/make_my_trip_colors.dart';
import 'package:mmt_project/theme/text_styles.dart';
import 'package:mmt_project/utils/extensions/sizedbox/sizedbox_extension.dart';

import '../Widgets/review_page_ui.dart';

class ReviewPage extends StatelessWidget {
   ReviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          titleSpacing: 50,
          backgroundColor: Colors.transparent,
          leadingWidth: 100,
          leading:Icon(Icons.arrow_back_ios,color: MakeMyTripColors.accentColor,),
          title: Text('REVIEWS',style:AppTextStyles.unselectedLabelStyle ,),
          actions: [ GestureDetector(
            onTap: (){

            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.more_horiz,color: MakeMyTripColors.accentColor,),
            ),
          ),],
        ),
          body: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(

                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                        side: BorderSide(color: MakeMyTripColors.color50gray)
                      ),

                      child: SizedBox(
                        height: 18,
                        width: 40,
                        child: Row(
                          children: [
                            Icon(Icons.star,size: 14,color: MakeMyTripColors.accentColor,),
                            Text('4.9'),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Text('34 Reviews',style: TextStyle(color: MakeMyTripColors.color50gray),)
                ],
              ),

              Expanded(
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return ReviewCardWidget(
                      date: '25 Sept 2018',
                      name: 'Andre Nickerson',
                      description: 'A wonderful experience to stay! Much recommended! TheA sea view from the big french window, that is what everyone longs for. Price is also affordable considering the facilities.',
                      ratingValue: 4.0,);
                  }
                ),
              ),
              NewUserCouponWidget(),
            ],
          ),

          floatingActionButton: FloatingActionButton(onPressed: (){
           Navigator.of(context).push(MaterialPageRoute(builder: (context) => ReviewPageUi()));
          },backgroundColor: MakeMyTripColors.accentColor,child: Icon(Icons.add)),
    ));
  }
}
