import UIKit

class ViewController: UIViewController {

    //  NOTES:
    //  The current approach is very simple, but x number of search phrases leads to O(x * n).
    //  A recursive PrefixTree/Tries might be faster with a larger set of words in a dictionary.
    
    @IBOutlet var searchField: UITextField!
    @IBOutlet var resultsTextView: UITextView!
    
    let dictionary = ["apple", "pie", "shoe", "second", "secondary"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupGestures()
        setupTextField()
        loadViews()
    }

    @IBAction func parse(_ sender: Any) {
        if let str = searchField.text {
            let results = dictionary.filter{str.contains($0)}
            if results.isEmpty {
                resultsTextView.text = "No results found."
            } else {
                resultsTextView.text = results.joined(separator: "\n")
            }
        } else {
           resultsTextView.text = "Error - can't parse the text."
        }
    }
    
    func loadViews() {
        searchField.returnKeyType = .done
        resultsTextView.isSelectable = false
    }
    
    func dismissKeyboard() {
        UIView.animate(withDuration: 0.2) {
            self.searchField.resignFirstResponder()
        }
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
        self.view.addGestureRecognizer(screenTap)
    }
    
    @objc func screenTapped(_ sender: UITapGestureRecognizer) {
        dismissKeyboard()
    }
}

