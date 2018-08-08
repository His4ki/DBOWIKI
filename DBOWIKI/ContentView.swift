//
//  ContentView.swift
//  DBOWIKI
//
//  Created by Kacper Kuźniak on 25/09/2017.
//  Copyright © 2017 Kacper Kuźniak. All rights reserved.
//

import UIKit

class ContentView: UIView {
    
    var heightForContentView: CGFloat = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func newText(_ text: String) -> UITextView {
        let textView = UITextView()
        textView.text = text
        textView.font = UIFont(name: "HelveticaNeue-Thin", size: 16)
        textView.textColor = UIColor.white
        textView.backgroundColor = UIColor.clear
        textView.isSelectable = false
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        heightForContentView += textView.contentSize.height
        return textView
    }

    func newImage(_ imageName: String) -> UIImageView {
        let imageView = UIImageView(image: UIImage(named: imageName))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 20
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFit
        heightForContentView += imageView.frame.height
        return imageView
    }
    
    func setupView(view: UIView) {
        addSubview(view)
        view.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        view.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        view.heightAnchor.constraint(equalToConstant: 200).isActive = true
        view.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
    }
    
//    func setupViews(views: UIView...) {
//            var viewsDictionary = [String: UIView]()
//            var format: String = "V:|"
//
//            for view in views {
//                addSubview(view)
//                addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-8-[v0]-8-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": view]))
//            }
//
//            for i in 0...views.count-1 {
//            format += "[v\(i)]"
//            print(format)
//            }
//
//            for ( index, view ) in views.enumerated() {
//                let key = "v\(index)"
//                viewsDictionary[key] = view
//            }
//
//            addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
//    }
}
