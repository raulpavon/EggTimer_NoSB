//
//  EggTimerViewController.swift
//  EggTimer_NoSB
//
//  Created by Raúl Pavón on 01/02/22.
//

import UIKit
import AVFoundation

class EggTimerViewController: UIViewController {
    
    weak var eggTimerCoordinator: EggTimerCoordinator?
    private let factory: EggTimerFactory
    var player: AVAudioPlayer?
    
    let eggTimes = [GlobalConstants.EggTimer.soft: 3, GlobalConstants.EggTimer.medium: 420, GlobalConstants.EggTimer.hard: 720]
    
    var totalTime = 0
    var secondPassed = 0
    var timer = Timer()
    
    private lazy var eggTimerUIView: EggTimerUIView = {
        let view = EggTimerUIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    required init(factory: EggTimerFactory, eggTimerCoordinator: EggTimerCoordinator) {
        self.factory = factory
        self.eggTimerCoordinator = eggTimerCoordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        initComponents()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func initComponents() {
        addComponents()
        setAutolayout()
        setTarget()
    }
    
    private func addComponents() {
        view.addSubview(eggTimerUIView)
    }
    
    private func setAutolayout() {
        NSLayoutConstraint.activate([
            eggTimerUIView.topAnchor.constraint(equalTo: view.topAnchor),
            eggTimerUIView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            eggTimerUIView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            eggTimerUIView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    private func setTarget() {
        eggTimerUIView.setBtTargets(target: self, action: #selector(hardOptional(_:)))
    }
    
    @objc private func hardOptional(_ sender: UIButton) {
        timer.invalidate()
        
        let hardness = sender.titleLabel?.text ?? ""
        
        totalTime = eggTimes[hardness] ?? 0
        
        eggTimerUIView.getSearchBar().progress = 0.0
        secondPassed = 0
        eggTimerUIView.getLbTitle().text = hardness

        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc private func updateTimer() {
        if secondPassed < totalTime {
            secondPassed += 1
            eggTimerUIView.getSearchBar().progress = Float(secondPassed) / Float(totalTime)
        } else {
            timer.invalidate()
            eggTimerUIView.getLbTitle().text = GlobalConstants.EggTimer.done
            playAlarm()
        }
    }
    
    private func playAlarm() {
        let url = Bundle.main.url(forResource: GlobalConstants.Sound.alarm, withExtension: GlobalConstants.Sound.mp3)
        player = try! AVAudioPlayer(contentsOf: url!)
        player?.play()
    }
}
