func printMessagesForUser() -> Void {
    let json = ["user":"larry"]
    do {
        let jsonData = try NSJSONSerialization.dataWithJSONObject(json, options: .PrettyPrinted)
        
        let url = NSURL(string: "http://127.0.0.1:5000/api/get_messages")!
        let request = NSMutableURLRequest(URL: url)
        request.HTTPMethod = "POST"
        
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.HTTPBody = jsonData
        
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request){ data, response, error in
            if error != nil{
                print("Error -> \(error)")
                return
            }
            do {
                let result = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments) as? [String:AnyObject]
                print("Result -> \(result)")
                
            } catch {
                print("Error -> \(error)")
            }
        }
        
        task.resume()
    } catch {
        print(error)
    }
}
