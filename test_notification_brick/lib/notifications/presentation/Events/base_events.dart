
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:facebook_app_events/facebook_app_events.dart';

class BaseEvent{

  final firebaseAnalytics = FirebaseAnalytics.instance;

  final facebookAppEvents = FacebookAppEvents();


  //firebase events
  void firebaseShowEvent(String eventName,Map<String,String> eventParams) async{ // to log event triggered
    await firebaseAnalytics.logEvent(name: eventName,parameters: eventParams);
  }

  void firebasesetScreen(String screenName) async{  //to show the current screen of app
    await firebaseAnalytics.setCurrentScreen(screenName: screenName);
  }

  // some firebase e-commerce methods
  void firebaseLogAddPaymentInfo({
    String? coupon,
    String? currency,
    String? paymentType,
    double? value,
    List<AnalyticsEventItem>? items,
    AnalyticsCallOptions? callOptions,
  }) async{
    await firebaseAnalytics.logAddPaymentInfo(
        coupon: coupon,
        currency: currency,
        paymentType: paymentType,
        value: value,
        items: items,
        callOptions: callOptions
    );
  }

  void firebaseLogAddShippingInfo(
      {
        String? coupon,
        String? currency,
        double? value,
        String? shippingTier,
        List<AnalyticsEventItem>? items,
        AnalyticsCallOptions? callOptions,
      }
      ) async{
    await firebaseAnalytics.logAddShippingInfo(
        coupon: coupon,
        currency: currency,
        value: value,
        shippingTier: shippingTier,
        items: items,
        callOptions: callOptions
    );
  }



  //facebook events
  void facebookShowEvent(String eventName,Map<String,String> eventParams) async{
    await facebookAppEvents.logEvent(name: eventName,parameters: eventParams);
  }

  void facebookSetUserData({
    String? email,
    String? firstName,
    String? lastName,
    String? phone,
    String? dateOfBirth,
    String? gender,
    String? city,
    String? state,
    String? zip,
    String? country,
  }) async{
    await facebookAppEvents.setUserData(
      email: email,
      firstName: firstName,
      lastName: lastName,
      phone: phone,
      dateOfBirth: dateOfBirth,
      gender: gender,
      city: city,
      state: state,
      zip: zip,
      country: country,
    );
  }
  //e-commerce methods
  void facebookLogPurchase(double amount, String currency, Map<String, dynamic> params) async{
    await facebookAppEvents.logPurchase(amount: amount, currency: currency, parameters: params);
  }

  void facebookSetAdvertiser(bool enabled) async{
    await facebookAppEvents.setAdvertiserTracking(enabled: enabled);
  }

  void facebookLogAddToCart(String id, String type, String currency, double price) async{
    await facebookAppEvents.logAddToCart(id: id, type: type, currency: currency, price: price);
  }


}

