//
//  ViewController.swift
//  LoginUI
//
//  Created by Rohan Lokesh Sharma on 23/08/17.
//  Copyright © 2017 webarch. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var upar_height:CGFloat!
   
    var upar:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false;
        view.backgroundColor = UIColor(red: 27/255, green: 27/255, blue: 27/255, alpha: 1.0)
        return view;
    }()
    var neeche:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false;
        view.backgroundColor = .white
        return view;
    }()
    
    var logoImage:UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false;
        view.contentMode = .scaleAspectFill
        view.image = #imageLiteral(resourceName: "fb")
        return view;
    }()
    var field:UITextField = {
        let view = UITextField()
        view.translatesAutoresizingMaskIntoConstraints = false;
        view.layer.borderWidth = 2.0
        view.layer.borderColor = UIColor.black.cgColor
        return view;
    }()
    var overlay:UIImageView = {
        let view = UIImageView()
        view.image = #imageLiteral(resourceName: "webarch")
        view.translatesAutoresizingMaskIntoConstraints = false;
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    override func viewDidLoad() {
        upar_height = view.frame.width / Reusable.height_ratio
        view.backgroundColor = .white;
        setupUI()
        setupFields()
        checkKeyboard()
        
        super.viewDidLoad()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }

}

extension ViewController {
    func setupUI(){
        view.addSubview(upar);
        view.addSubview(neeche)
        upar.addSubview(overlay)
        upar.addSubview(logoImage)
        NSLayoutConstraint.activate([
            upar.leftAnchor.constraint(equalTo: view.leftAnchor),
            upar.rightAnchor.constraint(equalTo: view.rightAnchor),
            upar.topAnchor.constraint(equalTo: view.topAnchor),
            upar.heightAnchor.constraint(equalToConstant: upar_height),
            ])
        NSLayoutConstraint.activate([
            neeche.leftAnchor.constraint(equalTo: view.leftAnchor),
            neeche.rightAnchor.constraint(equalTo: view.rightAnchor),
            neeche.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            neeche.heightAnchor.constraint(equalToConstant: (view.frame.height - upar_height))
            ])
  
        NSLayoutConstraint.activate([
            logoImage.centerXAnchor.constraint(equalTo: upar.centerXAnchor),
            logoImage.centerYAnchor.constraint(equalTo: upar.centerYAnchor,constant:8),
            logoImage.heightAnchor.constraint(equalToConstant: 75),
            logoImage.widthAnchor.constraint(equalToConstant: 75)
            ])
        
    }
    func setupFields(){
        neeche.addSubview(field)
        
        NSLayoutConstraint.activate([
            field.leftAnchor.constraint(equalTo: neeche.leftAnchor,constant:30),
            field.rightAnchor.constraint(equalTo: neeche.rightAnchor,constant:-30),
            field.heightAnchor.constraint(equalToConstant: 50),
            field.topAnchor.constraint(equalTo: neeche.topAnchor,constant:30)
            
            ])
        NSLayoutConstraint.activate([
            overlay.leftAnchor.constraint(equalTo: upar.leftAnchor),
            overlay.rightAnchor.constraint(equalTo: upar.rightAnchor),
            overlay.topAnchor.constraint(equalTo: upar.topAnchor),
            overlay.bottomAnchor.constraint(equalTo: upar.bottomAnchor)
            ])
        
    }
}

extension ViewController{
    
    func checkKeyboard(){
        NotificationCenter.default.addObserver(self, selector: #selector(didShow), name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(didHide), name: .UIKeyboardWillHide, object: nil)
        
    }
    
    @objc func didShow(not:Notification){
        UIView.animate(withDuration: 0.5) {
            self.neeche.transform = CGAffineTransform(translationX: 0, y: -(self.upar_height / 2))
            self.logoImage.transform = CGAffineTransform(translationX: 0, y:  -(self.upar_height / 2)).concatenating(CGAffineTransform(scaleX: 0.5, y: 0.5))
            self.overlay.alpha = 0.0
        }
    }
    @objc func didHide(not:Notification){
        UIView.animate(withDuration: 0.5) {
            self.neeche.transform = CGAffineTransform.identity
            self.logoImage.transform = CGAffineTransform.identity
            self.overlay.alpha = 1.0
        }
    }
    
}
