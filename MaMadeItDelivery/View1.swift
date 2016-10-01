import UIKit
import Parse

var signUpstate = true

class View1: UIViewController {
    
    
    @IBOutlet var mainImageView: UIImageView!
   
    @IBAction func toLogin(_ sender: AnyObject) {

        
        if signUpstate == true {
            
            
            signUpstate = false
            self.performSegue(withIdentifier: "signuplogin", sender: self)
            
        } else {
            
            self.performSegue(withIdentifier: "signuplogin", sender: self)
        }
        
        
    }


    @IBAction func toSignUp(_ sender: AnyObject) {
        
        if signUpstate == true {
            
            
            self.performSegue(withIdentifier: "signuplogin", sender: self)
            
        } else {
            
            signUpstate = true
            self.performSegue(withIdentifier: "signuplogin", sender: self)
            
        }
        
        
        
        
    }
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    
        

        
        if PFUser.current()?.username != nil {
            
            self.performSegue(withIdentifier: "skipLogin", sender: self)
            
                    }
        
        mainImageView.animationImages = [UIImage(named: "empanadas.jpg")!, UIImage(named: "indianfv.jpg")!, UIImage(named: "bruschetta.jpg")!, UIImage(named: "chickenOrange.jpg")!]
        mainImageView.animationDuration = 15
       // UIImageView.animateWithDuration(8.0, delay: NSTimeInterval(3.0), options:  [.Repeat, .Autoreverse, .CurveEaseOut], animations: {
          //  self.mainImageView.alpha = 1.0 }, completion: nil)
        
        mainImageView.startAnimating(self.mainImageView.alpha = 1.0)
        

        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
