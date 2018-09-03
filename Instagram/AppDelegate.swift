import UIKit
import Parse

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?


  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    let configuration = ParseClientConfiguration {
      $0.applicationId = "qjGrSbpjrBynl8StLaFJRxdb8HthHcRCOeE2F2LD"
      $0.clientKey = "zzPHtr7w7JKAwgy9RYvZDm6bMzMRDuVU9YPJ3ckO"
      $0.server = "https://parseapi.back4app.com/"
    }
    Parse.initialize(with: configuration)
    saveInstallationObject()

    return true
  }
  func saveInstallationObject(){
    if let installation = PFInstallation.current(){
      installation.saveInBackground {
        (success: Bool, error: Error?) in
        if (success) {
          print("You have successfully connected your app to Back4App!")
        } else {
          if let myError = error{
            print(myError.localizedDescription)
          }else{
            print("Uknown error")
          }
        }
      }
    }
  }
}

