import UIKit

class ViewController: UIViewController {

    @IBOutlet var searchField: UITextField!
    @IBOutlet var resultsTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadViews()
        loadWords()
    }

    @IBAction func parse(_ sender: Any) {
        
    }
    
    func loadViews() {
        searchField.returnKeyType = .done
    }
    
    func loadWords() {
        
    }
}

extension ViewController: UITextFieldDelegate {
    func setupTextField() {
        searchField.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.dismissKeyboard()
        return false
    }
}

extension ViewController: UIGestureRecognizerDelegate {
    func setupGestures() {
        let screenTap = UITapGestureRecognizer(target: self, action: #selector(screenTapped(_:)))
        screenTap.cancelsTouchesInView = false
        view.addGestureRecognizer(screenTap)
    }
    
    @objc func screenTapped(_ sender: UITapGestureRecognizer) {
        dismissKeyboard()
    }
    
    func dismissKeyboard() {
        UIView.animate(withDuration: 0.2) {
            self.searchField.resignFirstResponder()
        }
    }
}

