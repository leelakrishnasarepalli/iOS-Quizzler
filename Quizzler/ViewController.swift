
import UIKit

class ViewController: UIViewController {
    
    //Place your instance variables here
    
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    var myScore : Int = 0
    var questionNum = 0
    
    let allquestions = QuestionBank()
    override func viewDidLoad() {
        super.viewDidLoad()
        questionLabel.text = allquestions.list[questionNum].questionText
        scoreLabel.text = "Score:" + String(myScore)
        progressLabel.text = String(questionNum + 1) + "/13"
    }

    func startOver(){
        questionNum = 0
        myScore = 0
        questionLabel.text = allquestions.list[questionNum].questionText
        scoreLabel.text = "Score:" + String(myScore)
        progressLabel.text = String(1) + "/13"
        progressBar.frame.size.width = CGFloat(1) * (view.frame.size.width / 13)
    }
    @IBAction func answerPressed(_ sender: AnyObject) {
        if ((sender.tag == 1 && allquestions.list[questionNum].answer == true) || (sender.tag == 2 && allquestions.list[questionNum].answer == false)){
            myScore = myScore + 1
            ProgressHUD.showSuccess("Correct")
        }else{
            ProgressHUD.showError("Wrong!")
        }
        scoreLabel.text = "Score:" + String(myScore)
        questionNum = questionNum + 1
        progressBar.frame.size.width = CGFloat(questionNum) * (view.frame.size.width / 13)
        progressLabel.text = String(questionNum) + "/13"
        if questionNum <= 12 {
        questionLabel.text = allquestions.list[questionNum].questionText
        }else{
            let alert = UIAlertController(title: "Awesome", message: "Do you want to start over!!", preferredStyle: .alert)
            
            let restartAction = UIAlertAction(title: "Restart", style: .default, handler: { (UIAlertAction) in
                self.startOver()
            })
            alert.addAction(restartAction)
          present(alert, animated: true, completion: nil)
            
        }
    }
    
}
