import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mmt_project/theme/make_my_trip_colors.dart';
import 'package:mmt_project/theme/text_styles.dart';
import 'package:mmt_project/utils/extensions/sizedbox/sizedbox_extension.dart';
class NewReview extends StatelessWidget {
  const NewReview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 40,),
      Card(
        color: MakeMyTripColors.color10gray,
        elevation: 20,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: const BorderSide(color: MakeMyTripColors.color50gray)),
        child: Container(
          width: double.infinity,
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:
                [
                  16.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 4,
                        child: CircleAvatar(
                          radius: 24,
                          backgroundColor: MakeMyTripColors.color50gray,
                          child: CircleAvatar(
                            radius: 22,
                            backgroundImage: NetworkImage("https://firebasestorage.googleapis.com/v0/b/travelproject22-6b9d4.appspot.com/o/userImage%2Fscaled_image_picker986844966247555206.jpg?alt=media&token=e41669f4-9fbb-4bb4-867f-95a6594e4233"),
                            backgroundColor: MakeMyTripColors.color30gray,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 9,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Name Surname",
                              style: AppTextStyles.infoContentStyle
                                  .copyWith(fontSize: 18),
                            ),
                            2.verticalSpace,
                            RatingBar.builder(
                              ignoreGestures: true,
                              itemSize: 16,
                              initialRating: 0,
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemBuilder: (context, _) => const Icon(
                                Icons.star,
                                color: MakeMyTripColors.accentColor,
                              ),
                              onRatingUpdate: (rating) {},
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Expanded(
                        flex: 5,
                        child: Text(
                          "11/25/2022",
                          style: AppTextStyles.labelDetails.copyWith(fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                  12.verticalSpace,
                  Padding(
                    padding: const EdgeInsets.all( 8.0),
                    child: Text(
                      "description nkswxkmaomx kaO;KLAJMAQOMAOMKLMZKLMKLAdsf sdgvdsf dsfds f dfsfsdpiubprubjopgjopnreugovprgoeinrfopewfiuioebgyioeryfioewydbiufeywdohozifyerogiyeiorfioeryoeygiowyfioeryfiuetgybioerufioerzuymoxjaom xkaxkm aknxkal kanxkamM AXMKAMO KMXKLZMKXMS MSK ,k mkd",
                      textAlign: TextAlign.justify,
                      style: AppTextStyles.labelDescriptionStyle
                          .copyWith(fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      )

      ],
      ),
    );


  }
}
