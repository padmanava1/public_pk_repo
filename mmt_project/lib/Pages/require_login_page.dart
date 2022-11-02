import 'package:flutter/material.dart';
import 'package:mmt_project/theme/text_styles.dart';
List<String> list = ['https://media.istockphoto.com/vectors/register-account-submit-access-login-password-username-internet-vector-id1281150061?k=20&m=1281150061&s=612x612&w=0&h=wpCvmggedXRECWK-FVL98MMllubyevIrXuUu50fdCqE='];
class RequiredLoginPage extends StatelessWidget {
  const RequiredLoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leadingWidth: 100,
        title: Text('',style:AppTextStyles.unselectedLabelStyle ,),

      ),
    body: Center(
      child: Column(
       crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('Hold On!',style: AppTextStyles.labelNameTextStyle,),
        Text("You're just a step away to add to add to cart!",style: AppTextStyles.labelDetails,),
        Image.network(list[0]),
        SizedBox(
          height: 70,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 10),
            child: ElevatedButton(onPressed: (){

            }, child: Text('Click Here To Login',style: TextStyle(fontSize: 18),),
              style: ElevatedButton.styleFrom(
                primary: Colors.lightBlue[700],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // <-- Radius
                ),


              ) ,),
          ),
        )
      ],
      ),
    ),
    );
  }
}
