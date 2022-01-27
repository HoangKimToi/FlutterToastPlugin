import Flutter
import UIKit

public class SwiftFlutterToastPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_toast", binaryMessenger: registrar.messenger())
    let instance = SwiftFlutterToastPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
      
      if (call.method.elementsEqual("showToast")) {
          let arguments = call.arguments as? NSDictionary
          let msg = arguments?["msg"] as? String
          
          showAlertButtonTapped(msg: msg)
      }
      
    result("iOS " + UIDevice.current.systemVersion)
  }
    
    private func showAlertButtonTapped(msg messgae: String?) {
        
        guard let msg = messgae else { return }
        // create the alert
        let alert = UIAlertController(title: "My Title", message: msg, preferredStyle: UIAlertController.Style.alert)

        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

        // show the alert
        let viewController: UIViewController =
                    (UIApplication.shared.delegate?.window??.rootViewController)!
        
        viewController.present(alert, animated: true, completion: nil)
        
    }
}
