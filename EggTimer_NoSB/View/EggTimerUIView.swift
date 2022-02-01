//
//  EggTimerUIView.swift
//  EggTimer_NoSB
//
//  Created by Raúl Pavón on 31/01/22.
//

import UIKit

class EggTimerUIView: UIView {
    enum EggTimerUIViewConstraints {
        static let fontSize: CGFloat = 18
        enum LbTitle {
            static let fontSize: CGFloat = 30
            static let height: CGFloat = 246.5
        }
        enum StackContainer {
            static let leading: CGFloat = 20
            static let trailing: CGFloat = -20
        }
        enum Image {
            static let heigth: CGFloat = 247
            static let width: CGFloat = 111
        }
        enum ProgressBar {
            static let heigth: CGFloat = 5
            static let leading: CGFloat = 15
            static let trailing: CGFloat = -15
        }
    }
    
    private lazy var mainContainer: UIView = {
        let view = UIView(frame: CGRect.zero)
        view.backgroundColor = UIColor(hex: GlobalConstants.Colors.blue)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var stackContainer: UIStackView = {
        let stack = UIStackView(frame: .zero)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 39
        stack.alignment = .fill
        stack.contentMode = .scaleToFill
        stack.distribution = .fillEqually
        return stack
    }()
    
    private lazy var titleView: UIView = {
        let view = UIView(frame: CGRect.zero)
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let lbtitle: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: EggTimerUIViewConstraints.LbTitle.fontSize)
        label.textColor = .darkGray
        label.text = GlobalConstants.EggTimer.title
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    private lazy var eggStack: UIStackView = {
        let stack = UIStackView(frame: .zero)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 20
        stack.alignment = .fill
        stack.contentMode = .scaleAspectFit
        stack.distribution = .fillEqually
        return stack
    }()
    
    private lazy var softEggView: UIView = {
        let view = UIView(frame: CGRect.zero)
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let imgSoftEgg: UIImageView = {
        let image = UIImageView(image: UIImage(named: GlobalConstants.Images.softEgg))
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var btSoftEgg: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(GlobalConstants.EggTimer.soft, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: EggTimerUIViewConstraints.fontSize, weight: .black)
        return button
    }()
    
    private lazy var mediumEggView: UIView = {
        let view = UIView(frame: CGRect.zero)
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let imgMediumEgg: UIImageView = {
        let image = UIImageView(image: UIImage(named: GlobalConstants.Images.mediumEgg))
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var btMediumEgg: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(GlobalConstants.EggTimer.medium, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: EggTimerUIViewConstraints.fontSize, weight: .black)
        return button
    }()
    
    private lazy var hardEggView: UIView = {
        let view = UIView(frame: CGRect.zero)
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let imgHardEgg: UIImageView = {
        let image = UIImageView(image: UIImage(named: GlobalConstants.Images.hardEgg))
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var btHardEgg: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(GlobalConstants.EggTimer.hard, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: EggTimerUIViewConstraints.fontSize, weight: .black)
        return button
    }()
    
    private lazy var timerView: UIView = {
        let view = UIView(frame: CGRect.zero)
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var progressBar: UIProgressView = {
        let progressBar = UIProgressView(progressViewStyle: .bar)
        progressBar.progressTintColor = .systemYellow
        progressBar.trackTintColor = .systemGray
        progressBar.translatesAutoresizingMaskIntoConstraints = false
        return progressBar
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initComponents()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func initComponents() {
        addComponents()
        setAutolayout()
    }
    
    func addComponents() {
        addSubview(mainContainer)
        mainContainer.addSubview(stackContainer)
        stackContainer.addArrangedSubview(titleView)
        titleView.addSubview(lbtitle)
        stackContainer.addArrangedSubview(eggStack)
        eggStack.addArrangedSubview(softEggView)
        softEggView.addSubview(imgSoftEgg)
        softEggView.addSubview(btSoftEgg)
        eggStack.addArrangedSubview(mediumEggView)
        mediumEggView.addSubview(imgMediumEgg)
        mediumEggView.addSubview(btMediumEgg)
        eggStack.addArrangedSubview(hardEggView)
        hardEggView.addSubview(imgHardEgg)
        hardEggView.addSubview(btHardEgg)
        stackContainer.addArrangedSubview(timerView)
        timerView.addSubview(progressBar)
    }
    
    func setAutolayout() {
        NSLayoutConstraint.activate([
            mainContainer.topAnchor.constraint(equalTo: topAnchor),
            mainContainer.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainContainer.trailingAnchor.constraint(equalTo: trailingAnchor),
            mainContainer.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            stackContainer.topAnchor.constraint(equalTo: mainContainer.topAnchor),
            stackContainer.leadingAnchor.constraint(equalTo: mainContainer.leadingAnchor, constant: EggTimerUIViewConstraints.StackContainer.leading),
            stackContainer.trailingAnchor.constraint(equalTo: mainContainer.trailingAnchor, constant: EggTimerUIViewConstraints.StackContainer.trailing),
            stackContainer.bottomAnchor.constraint(equalTo: mainContainer.safeAreaLayoutGuide.bottomAnchor),
            
            lbtitle.centerXAnchor.constraint(equalTo: centerXAnchor),
            lbtitle.heightAnchor.constraint(equalToConstant: EggTimerUIViewConstraints.LbTitle.height),
            
            imgSoftEgg.heightAnchor.constraint(equalToConstant: EggTimerUIViewConstraints.Image.heigth),
            imgSoftEgg.widthAnchor.constraint(equalToConstant: EggTimerUIViewConstraints.Image.width),
            
            btSoftEgg.centerXAnchor.constraint(equalTo: imgSoftEgg.centerXAnchor),
            btSoftEgg.centerYAnchor.constraint(equalTo: imgSoftEgg.centerYAnchor),
            
            imgMediumEgg.heightAnchor.constraint(equalToConstant: EggTimerUIViewConstraints.Image.heigth),
            imgMediumEgg.widthAnchor.constraint(equalToConstant: EggTimerUIViewConstraints.Image.width),
            
            btMediumEgg.centerXAnchor.constraint(equalTo: imgMediumEgg.centerXAnchor),
            btMediumEgg.centerYAnchor.constraint(equalTo: imgMediumEgg.centerYAnchor),
            
            imgHardEgg.heightAnchor.constraint(equalToConstant: EggTimerUIViewConstraints.Image.heigth),
            imgHardEgg.widthAnchor.constraint(equalToConstant: EggTimerUIViewConstraints.Image.width),
            
            btHardEgg.centerXAnchor.constraint(equalTo: imgHardEgg.centerXAnchor),
            btHardEgg.centerYAnchor.constraint(equalTo: imgHardEgg.centerYAnchor),
            
            progressBar.heightAnchor.constraint(equalToConstant: EggTimerUIViewConstraints.ProgressBar.heigth),
            progressBar.centerYAnchor.constraint(equalTo: timerView.centerYAnchor),
            progressBar.leadingAnchor.constraint(equalTo: timerView.leadingAnchor, constant: EggTimerUIViewConstraints.ProgressBar.leading),
            progressBar.trailingAnchor.constraint(equalTo: timerView.trailingAnchor, constant: EggTimerUIViewConstraints.ProgressBar.trailing),
        ])
    }
    
    func setBtTargets(target: Any?, action: Selector) {
        btSoftEgg.addTarget(target, action: action, for: .touchUpInside)
        btMediumEgg.addTarget(target, action: action, for: .touchUpInside)
        btHardEgg.addTarget(target, action: action, for: .touchUpInside)
    }
    
    func getLbTitle() -> UILabel {
        return lbtitle
    }
    
    func getSearchBar() -> UIProgressView {
        return progressBar
    }
}
