//
//  ContentScrollView.swift
//  Scrol
//
//  Created by Kacper Kuźniak on 08/08/2018.
//  Copyright © 2018 Kacper Kuźniak. All rights reserved.
//

import UIKit

class ContentScrollView: UIScrollView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
         addContent()
    }
    
    func newText(_ text: String) -> UITextView {
        let textView = UITextView()
        textView.text = text
        textView.font = UIFont(name: "HelveticaNeue-Thin", size: 16)
        textView.textAlignment = .center
        textView.textColor = UIColor.white
        textView.backgroundColor = UIColor.clear
        textView.isSelectable = false
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.sizeToFit()
        return textView
    }
    
    func newImage(_ imageName: String) -> UIImageView {
        let imageView = UIImageView(image: UIImage(named: imageName))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFit
        return imageView
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupContent(views: UIView...) {
        var index = 0
        var bottomAnchorFromLastOne = NSLayoutYAxisAnchor()
        var sizeForContent: CGFloat = 0.0
        
        for view in views {
            self.addSubview(view)
            
            sizeForContent = sizeForContent + view.frame.size.height + 43
            self.contentSize.height = sizeForContent
            
            view.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
            view.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
            if ( index == 0 ) {
                view.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
                bottomAnchorFromLastOne = view.bottomAnchor
            } else {
                view.topAnchor.constraint(equalTo: bottomAnchorFromLastOne, constant: 10).isActive = true
                bottomAnchorFromLastOne = view.bottomAnchor
            }
            index = index + 1
        }
    }
    
    func addContent() {
        let step0 = newText("Map where you can farm Korin item for quest :")
        let img0 = newImage("korinitem")
        let step1 = newText("Step 1: Once you reach level 30, find and destroy the crate pictured below that you'll found at various locations in the Korin Forest zone. If a create isn't at one of the locations it's because someone probably destroyed it recently. You'll either need to wait until the crate re-spawns, change to a different channel, or try and find one at a different location.")
        let step1_1 = newText("You can do this step, the next one, and a few others before you reach level 30, but you'll have to wait until level 30 to complete the quest line. If, when you begin to focus on becoming an adult, you notice that some of the quests aren't there, it's probably because you've done them already at an earlier level.")
        let img1 = newImage("step1")
        let step2 = newText("Step 2: After destroying the crate, loot the following item, right click on it, and accept the quest.")
        let img2 = newImage("step2")
        let step3 = newText("Step 3: The quest will take you to this NPC. Turn in the quest and accept the follow up. Don't worry about completing the follow up quest just yet and don't worry about no 'X' showing up on your map for this quest.")
        let img3 = newImage("step3")
        let step4 = newText("Step 4: Just across from the NPC in step 3 (not standing right next to him) there should be another NPC quest giver with only one quest. Accept his quest.")
        let img4 = newImage("step4")
        let step5 = newText("Step 5: The quest you get from step 4 should take you to the girl pictured below. Turn in the quest and accept the follow up which should have you kill 10 enemy boars just outside of the small town. The boars you need to kill are the ones with the staves and not with the swords.")
        let img5 = newImage("step5")
        let img5_1 = newImage("step6")
        let step6 = newText("Step 6: After you complete that quest. Turn it in and receive the follow up which should take you to a man at the top of a giant hill.")
        let img6 = newImage("step7")
        let step7 = newText("Step 7: Turn in the quest and accept the follow up. The next quest will take you to the base of Korin's tower where you'll meet a girl. Turn in the quest there and talk to her again. She should now teleport you to to the top of Korin's Tower.")
        let img7 = newImage("step8")
        let step8 = newText("Step 8: Turn in the quest that has you talk to Korin and accept the quest he gives you. You should now have an item that looks like a bit like a tea kettle in your inventory.")
        let img8 = newImage("step9")
        let img8_1 = newImage("step10")
        let step9 = newText("Step 9: When you're ready, right click on the item which will summon four transparent Korins (two at a time). You must defeat all four to complete the quest. If you're having trouble defeating them you can stand where I am in the image below and fight them one at a time instead of two at a time.")
        let img9 = newImage("step11")
        let step10 = newText("Step 10: Turn in the quest and you will transform into an adult as well as receive your first HTB skill.")
        let img10 = newImage("step12")
        let step11 = newText("Step 11: Now, to choose a master class, talk to Korin again (choose the 3rd option). He will then present you with two items, each of which represent your master class choices. You will be permanently stuck with whichever Master Class you choose. There is currently no way to change your Master Class after you've chosen..")
        let step11_1 = newText("Click to view which master class each weapon represents")
        let img11 = newImage("step13")
        let step12 = newText("Step 12: After you choose your weapon Karin will give it to you. Right click on it and accept the quest it gives you.")
        let img12 = newImage("step14")
        let step12_1 = newText("If you're a Human your quest will take you to the Majin zone. If you're a Namekian you quest will take you to the Human zone. If you're a Majin your quest will take you to the Namekian zone.")
        let step12_2 = newText("Once you get to where you need to go the quest giver will give you a unique quest with the reward being your master class weapon (although you won't be able to equip it yet). He will then taken give you another quest which will take you to a special arena where you will have to defeat a powerful enemy (each enemy is class specific).")
        let img12_1 = newImage("step15")
        let step12_3 = newText("After you've defeated your enemy turn in the quest and you will recieve your master class and can now equip the weapon you got earlier.")
        let img12_2 = newImage("step16")
        
        setupContent(views: step0, img0, step1, step1_1, img1, step2, img2, step3, img3, step4, img4, step5, img5, img5_1, step6, img6, step7, img7, step8, img8, img8_1, step9, img9, step10, img10, step11, step11_1, img11, step12, img12, step12_1, step12_2, img12_1, step12_3, img12_2)
    }
    
    
}
