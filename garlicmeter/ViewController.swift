//
//  ViewController.swift
//  garlicmeter
//
//  Created by 舘佳紀 on 2020/06/07.
//  Copyright © 2020 yoshiki Tachi. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    @IBOutlet weak var garlicImage: UIImageView!
    
    @IBOutlet weak var ManyButton: UIButton!
    
    @IBOutlet weak var NormalButton: UIButton!
    
    @IBOutlet weak var SmallButton: UIButton!
    
    @IBOutlet weak var TextLabel: UILabel!
    
    private let disposeBeg = DisposeBag()
    private var garlicCount : Double = 0
    let userDefaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()

        TextLabel.text = "累計\(garlicCount)片"


        ManyButton.rx.tap
                .subscribe(onNext: { [weak self] in
                    guard let self = self else { return }
                    self.garlicCount += 2
                    self.userDefaults.set(self.garlicCount, forKey: "garlicCount")
                    self.garlicCount = self.userDefaults.double(forKey: "garlicCount")
                    self.TextLabel.text = "累計\(self.garlicCount)片"
                    self.garlicCount = self.userDefaults.object(forKey: "garlicCount") as! Double
                })
                .disposed(by: disposeBeg)

        NormalButton.rx.tap
                .subscribe(onNext: { [weak self] in
                    guard let self = self else { return }
                    self.garlicCount += 1
                    self.userDefaults.set(self.garlicCount, forKey: "garlicCount")
                    self.garlicCount = self.userDefaults.double(forKey: "garlicCount")
                    self.TextLabel.text = "累計\(self.garlicCount)片"
                    self.garlicCount = self.userDefaults.object(forKey: "garlicCount") as! Double
                })
                .disposed(by: disposeBeg)

        SmallButton.rx.tap
                .subscribe(onNext: {[weak self] in
                    guard let self = self else { return }
                    self.garlicCount += 0.5
                    self.userDefaults.set(self.garlicCount, forKey: "garlicCount")
                    self.garlicCount = self.userDefaults.double(forKey: "garlicCount")
                    self.TextLabel.text = "累計\(self.garlicCount)片"
                    self.garlicCount = self.userDefaults.object(forKey: "garlicCount") as! Double
                })
                .disposed(by: disposeBeg)
    }
}

