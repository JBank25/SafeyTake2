import Foundation
import Alamofire
import MapKit
import CoreLocationUI

func twillTester(){
    setenv("TWILIO_ACCOUNT_SID", "AC693c6f45bbf4878eb7e439b173a43f63", 0)
    setenv("TWILIO_AUTH_TOKEN", "d6f88957bb24afd67c837198bf4b2e45", 0)
    
    if let accountSID = ProcessInfo.processInfo.environment["TWILIO_ACCOUNT_SID"],
       let authToken = ProcessInfo.processInfo.environment["TWILIO_AUTH_TOKEN"] {
        
        let url = "https://api.twilio.com/2010-04-01/Accounts/\(accountSID)/Calls.json"
        let parameters = ["From": "+14793461171", "To": "+14699258093", "Url": "https://handler.twilio.com/twiml/EHfe8edab9c7915c76822a8e59f8baf438"]
        
        AF.request(url, method: .post, parameters: parameters)
            .authenticate(username: accountSID, password: authToken)
            .responseJSON { response in
                debugPrint(response)
            }
        
//        RunLoop.main.run()
    }
}


/*
 * Same function as above, with the url changed for messaging and location passed in
 */
func twillMessages(_coord: CLLocationCoordinate2D){
    setenv("TWILIO_ACCOUNT_SID", "AC693c6f45bbf4878eb7e439b173a43f63", 0)
    setenv("TWILIO_AUTH_TOKEN", "[add auth token]", 0)
    
    if let accountSID = ProcessInfo.processInfo.environment["TWILIO_ACCOUNT_SID"],
       let authToken = ProcessInfo.processInfo.environment["TWILIO_AUTH_TOKEN"] {

        
        print("ACCOUNTSID", accountSID)
        print("ACCOUNTTOKEN", authToken)
        
        // url ending might be inaccurate
        let url = "https://api.twilio.com/2010-04-01/Accounts/\(accountSID)/Messages.json"
        
        let lat = "\(_coord.latitude)";
        let long = "\(_coord.longitude)";
        let msg = "[Name] needs help immediately. They are at " + lat + ", " + long;
        
        let parameters = ["From": "14793461171", "To": "14699258093", "Body": msg]
         
        AF.request(url, method: .post, parameters: parameters)
            .authenticate(username: accountSID, password: authToken)
            .responseJSON { response in
                debugPrint(response)
            }
        
    }
}
