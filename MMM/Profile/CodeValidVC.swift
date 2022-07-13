//
//  CodeValidVC.swift
//  MMM
//
//  Created by Sergei Kovalev on 18.04.2022.
//

import UIKit
import FirebaseAuth
class CodeValidVC: UIViewController {

    var verificationID: String!
    
    @IBOutlet weak var codeTextView: UITextView!
    
    
    @IBOutlet weak var checkCodeButton: UIButton!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupConfig()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    
    @IBAction func checkCodeTapped(_ sender: UIButton) {
        guard let code = codeTextView.text else {return}
        
        let credetional = PhoneAuthProvider.provider().credential(withVerificationID: verificationID, verificationCode: code)
        
        
        Auth.auth().signIn(with: credetional) {
           (_, error) in
            if error != nil {
                let ac = UIAlertController(title: error?.localizedDescription, message: nil, preferredStyle: .alert)
                let cancel = UIAlertAction(title: "Отмена", style: .cancel)
                ac.addAction(cancel)
                self.present(ac, animated: true)
            } else {
                self.performSegue(withIdentifier: "unwindToMenu", sender: self)
            }
        }
        
    }
    
    
    
    
    @IBAction func buttontapped(_ sender: Any) {
        
        
        phone = ""
        
    }
    
    
    private func setupConfig() {
        checkCodeButton.alpha = 0.5
        checkCodeButton.isEnabled = false
        
        
        codeTextView.delegate = self
    }

    
    

}


extension CodeValidVC: UITextViewDelegate {
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        
        let currentCharacterCount = textView.text?.count ?? 0
        if range.length + range.location > currentCharacterCount {
            return false
        }
        let newLength = currentCharacterCount + text.count - range.length
        return newLength <= 6
        
    }
    
    func textViewDidChange(_ textView: UITextView) {
        if textView.text?.count == 6 {
            checkCodeButton.alpha = 1
            checkCodeButton.isEnabled = true
        } else {
            checkCodeButton.alpha = 0.5
            checkCodeButton.isEnabled = false
        }
        
    }
    
    
}
