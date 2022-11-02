import Foundation
import Alamofire


func twillTester(){
    setenv("TWILIO_ACCOUNT_SID", "AC693c6f45bbf4878eb7e439b173a43f63", 0)
    setenv("TWILIO_AUTH_TOKEN", "d174427083e0a3a523da18b0457c1d26", 0)
    
    if let accountSID = ProcessInfo.processInfo.environment["TWILIO_ACCOUNT_SID"],
       let authToken = ProcessInfo.processInfo.environment["TWILIO_AUTH_TOKEN"] {
        
        let url = "https://api.twilio.com/2022-11-01/Accounts/\(accountSID)/Calls"
        let parameters = ["From": "+14793461171", "To": "+14699258093", "Url": "YOUR_TWIML_URL"]
        
        AF.request(url, method: .post, parameters: parameters)
            .authenticate(username: accountSID, password: authToken)
            .responseJSON { response in
                debugPrint(response)
            }
        
        RunLoop.main.run()
    }
}
