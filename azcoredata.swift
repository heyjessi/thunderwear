# saves user's imported photos in app using core data

let documentsDirectory = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true).first as! String
// self.fileName is whatever the filename that you need to append to base directory here.
let path = documentsDirectory.stringByAppendingPathComponent(self.fileName)
let success = data.writeToFile(path, atomically: true)
if !success { // handle error }

// allows external storage

let image = UIImage(named: "YourImage")
let imageData = NSData(data: UIImageJPEGRepresentation(image, 1.0))
managedObject?.setValue(imageData, forKey: "YourKey")
