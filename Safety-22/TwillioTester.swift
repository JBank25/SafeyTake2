import Foundation
import Alamofire


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
