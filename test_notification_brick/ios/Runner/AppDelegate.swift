import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        GeneratedPluginRegistrant.register(with: self)
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    
//    func application(
//        _ application: UIApplication,
//        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
//        
//    ) -> Bool {
//        ApplicationDelegate.shared.application(
//            application,
//            didFinishLaunchingWithOptions: launchOptions
//        )
//        
//        return true
//    }
    
}

//@UIApplicationMain
//class AppDelegate: UIResponder, UIApplicationDelegate {
//
//    @UIApplicationMain
//    @objc class AppDelegate: FlutterAppDelegate {
//      override func application(
//        _ application: UIApplication,
//        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
//      ) -> Bool {
//        GeneratedPluginRegistrant.register(with: self)
//        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
//      }
//    }
//
//    func application(
//        _ application: UIApplication,
//        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
//
//    ) -> Bool {
//        ApplicationDelegate.shared.application(
//            application,
//            didFinishLaunchingWithOptions: launchOptions
//        )
//
//        return true
//    }
//
////    func application(
////        _ app: UIApplication,
////        open url: URL,
////        options: [UIApplication.OpenURLOptionsKey : Any] = [:]
////    ) -> Bool {
////        ApplicationDelegate.shared.application(
////            app,
////            open: url,
////            sourceApplication: options[UIApplication.OpenURLOptionsKey.sourceApplication] as? String,
////            annotation: options[UIApplication.OpenURLOptionsKey.annotation]
////        )
////    }
//}

//@available(iOS 13.0, *)
//func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
//    guard let url = URLContexts.first?.url else {
//        return
//    }
//
//    ApplicationDelegate.shared.application(
//        UIApplication.shared,
//        open: url,
//        sourceApplication: nil,
//        annotation: [UIApplication.OpenURLOptionsKey.annotation]
//    )
//}
