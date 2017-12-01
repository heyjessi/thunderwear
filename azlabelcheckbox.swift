//taken from stackoverflowfrom
//https://stackoverflow.com/questions/29117759/how-to-create-radio-buttons-and-checkbox-in-swift-ios

//var radioButtonController = SSRadioButtonsController()
//radioButtonController.setButtonsArray([button1!,button2!,button3!])

var unchecked = true

@IBAction func tick(sender: UIButton) {
    if unchecked {
        sender.setImage(UIImage(named:"checked.png"), forControlState: .Normal)
        unchecked = false
    }
    else {
        sender.setImage( UIImage(named:"unchecked.png"), forControlState: .Normal)
        unchecked = true
    }
}
