//import Foundation
import UIKit

protocol ProfileViewDelegate: AnyObject {
    func openImagePickerController()
}

class ProfileHeaderView: UIView{
    private var statusText: String?
    //Аватарка
    private lazy var avatarImageView: UIImageView = {
        
        /*
        let imageView = UIImageView(frame: .zero)
        imageView.layer.cornerRadius = 25
        imageView.clipsToBounds = true //так как кнопка скругленная, данная функция делает так, чтобы дочерние компоненты не вылезали из углов (где скругление)
        imageView.translatesAutoresizingMaskIntoConstraints = false //нужно, чтобы работа наши констреины
        
        return imageView
        */
        
        //let imageView = UIImageView(frame: CGRect(x: 16, y: 16, width: 150, height: 150))
        let imageView = UIImageView(frame: .zero)
        //imageView.layer.cornerRadius = imageView.frame.width/2
        //print("imageView.frame.width: \(imageView.frame.width)")
        print("imageView.frame.width:")
        //imageView.layer.cornerRadius = 100
        //imageView.widthAnchor.cornerRadius.round(1.0)
        
        imageView.layer.cornerRadius = 60
        imageView.clipsToBounds = true //так как кнопка скругленная, данная функция делает так, чтобы дочерние компоненты не вылезали из углов (где скругление)
        //imageView.contentMode = .scaleAspectFit
        
        imageView.clipsToBounds = true //так как кнопка скругленная, данная функция делает так, чтобы дочерние компоненты не вылезали из углов (где скругление)
        //imageView.backgroundColor = .systemBlue
        imageView.image = UIImage(named: "ava.jpeg")
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor.white.cgColor
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    //Заголовок
    private lazy var titleLable: UILabel = {
        /*
        let label = UILabel(frame: CGRect(x: 200, y: 27, width: 150, height: 30))
        //label.backgroundColor = .systemYellow
        label.text = "Иван Солярка"
        label.font = UIFont(name: label.font.fontName, size: 18)
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        */
        
        let label = UILabel(frame: .zero)
        label.text = "Иван Солярка"
        label.font = UIFont(name: label.font.fontName, size: 18)
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var statusLable: UILabel = {
        //let label = UILabel(frame: CGRect(x: 200, y: 100, width: 200, height: 30))
        //label.backgroundColor = .systemYellow
        let label = UILabel(frame: .zero)
        label.text = "Ожидаем статус..."
        label.font = UIFont(name: label.font.fontName, size: 14)
        label.font = UIFont.boldSystemFont(ofSize: 10)
        label.textColor = .darkGray
        //label.textColor = .red
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
 
    private lazy var inputBlock: UITextField = {
        //let input = UITextField(frame: CGRect(x: 200, y: 150, width: 190, height: 45))
        let input = UITextField(frame: .zero)
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: self.frame.size.height))
        input.leftView = paddingView
        input.leftViewMode = .always
        input.backgroundColor = .white
        input.layer.cornerRadius = 12
        input.layer.borderWidth = 1
        input.layer.borderColor = UIColor.black.cgColor
        input.textColor = .black
        input.font = UIFont.systemFont(ofSize: 15.0)
        input.font = UIFont.boldSystemFont(ofSize: 10)
        input.addTarget(self, action: #selector(self.statusTextChanged), for: .editingChanged)
        
        input.translatesAutoresizingMaskIntoConstraints = false
        
        return input
    }()
 
    
 
    //рисуем кнопку
    private lazy var editButton: UIButton = {
        //let button = UIButton(frame: CGRect(x: 16, y: 230, width: 380, height: 50))
        let button = UIButton(frame: .zero)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 20
        button.clipsToBounds = true //так как кнопка скругленная, данная функция делает так, чтобы дочерние компоненты не вылезали из углов (где скругление)
        button.addTarget(self, action: #selector(self.showStatus), for: .touchUpInside) //обработка нажатие на кнопку (кнопка, свитчер и степпер умеют обрабатывать касание, все остальные (картинки, надписи и т.д.) - не умеют, нужно использовать истуры (отдельный инкапсулированный объект (UIGestureRecognizer и другие gesture recognizer))
        button.setTitle("Показать статус", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 4.0, height: 4.0)
        button.layer.shadowOpacity = 0.7
        button.layer.shadowRadius = 4
        //button.layer.masksToBounds = true
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    
    
    private lazy var newButton: UIButton = {
        //let button = UIButton(frame: CGRect(x: 16, y: 230, width: 380, height: 50))
        let button = UIButton(frame: .zero)
        button.backgroundColor = .systemGreen
        button.setTitle("кнопка", for: .normal)
        button.setTitleColor(.white, for: .normal)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
    }
 
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.backgroundColor = .systemBackground
        self.addSubview(self.avatarImageView)
        self.addSubview(self.titleLable)
        self.addSubview(self.statusLable)
        self.addSubview(self.editButton)
        self.addSubview(self.inputBlock)
        self.addSubview(self.newButton)
                
        let avatarImageViewContraints = self.avatarImageViewContraints()
        let fullNameLabelContraints = self.fullNameLabelContraints()
        let statusLabelContraints = self.statusLabelContraints()
        let statusTextFieldContraints = self.statusTextFieldContraints()
        let setStatusButtonContraints = self.setStatusButtonContraints()
        let setStatusNewButtonContraints = self.setStatusNewButtonContraints()
        
        NSLayoutConstraint.activate(avatarImageViewContraints
                                    + fullNameLabelContraints
                                    + statusLabelContraints
                                    + statusTextFieldContraints
                                    + setStatusButtonContraints
                                    + setStatusNewButtonContraints
        )
        
        //self.setupGestures()
    }
    
    func setup(with profile: Profile){
        self.avatarImageView.image = profile.image ?? UIImage(systemName: "person.circle")
    }
    
    private func avatarImageViewContraints() -> [NSLayoutConstraint]{
        let topConstrain = self.avatarImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16)
        let leadingAnchor = self.avatarImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16)
        let widthAnchor = self.avatarImageView.widthAnchor.constraint(equalToConstant: 120)
        let heightAnchor = self.avatarImageView.heightAnchor.constraint(equalTo: self.avatarImageView.widthAnchor)
        
        return [
            topConstrain, leadingAnchor, widthAnchor, heightAnchor
        ]
    }
    
    private func fullNameLabelContraints() -> [NSLayoutConstraint]{
        let topConstrain = self.titleLable.topAnchor.constraint(equalTo: self.topAnchor, constant: 20)
        let leadingAnchor = self.titleLable.leadingAnchor.constraint(equalTo: self.avatarImageView.trailingAnchor, constant: 16)
        return [
            topConstrain, leadingAnchor//, widthAnchor
        ]
    }
    
    private func statusLabelContraints() -> [NSLayoutConstraint]{
        let topConstrain = self.statusLable.topAnchor.constraint(equalTo: self.titleLable.bottomAnchor, constant: 25)
        //let topConstrain = self.statusLable.topAnchor.constraint(equalTo: self.titleLable.bottomAnchor)
        let leadingAnchor = self.statusLable.leadingAnchor.constraint(equalTo: self.avatarImageView.trailingAnchor, constant: 16)
        //let bottomAnchor = self.statusLable.bottomAnchor.constraint(equalTo: self.editButton.topAnchor, constant: 34)
        return [
            topConstrain, leadingAnchor//, bottomAnchor
            //leadingAnchor, bottomAnchor
        ]
    }
 
    private func statusTextFieldContraints() -> [NSLayoutConstraint]{
        //let topConstrain = self.editButton.topAnchor.constraint(equalTo: self.avatarImageView.bottomAnchor, constant: 48)
        let leadingAnchor = self.editButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16)
        let trailingAnchor = self.editButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        let bottomAnchor = self.editButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        let heightAnchor = self.editButton.heightAnchor.constraint(equalToConstant: 50)
        //let widthAnchor = self.editButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.92, constant: 0)
        return [
            leadingAnchor, trailingAnchor, bottomAnchor, heightAnchor//, widthAnchor
        ]
    }
  
    private func setStatusButtonContraints() -> [NSLayoutConstraint]{
        let topConstrain = self.inputBlock.topAnchor.constraint(equalTo: self.statusLable.bottomAnchor, constant: 16)
        let leadingAnchor = self.inputBlock.leadingAnchor.constraint(equalTo: self.avatarImageView.trailingAnchor, constant: 16)
        let trailingAnchor = self.inputBlock.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        let heightAnchor = self.inputBlock.heightAnchor.constraint(equalToConstant: 50)
        let widthAnchor = self.inputBlock.widthAnchor.constraint(equalToConstant: 200)
        
        return [
            topConstrain, leadingAnchor, trailingAnchor, heightAnchor//, widthAnchor
        ]
    }
    
    private func setStatusNewButtonContraints() -> [NSLayoutConstraint]{
        //let topConstraint = self.editButton.topAnchor.constraint(greaterThanOrEqualTo: self.editButton.bottomAnchor, constant: 16)
        let leadingAnchor = self.newButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0)
        let trailingAnchor = self.newButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0)
        let bottomAnchor = self.newButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: 150)
        let heightAnchor = self.newButton.heightAnchor.constraint(equalToConstant: 50)
        //let widthAnchor = self.inputBlock.widthAnchor.constraint(equalToConstant: 50)
        //print(self.safeAreaLayoutGuide.bottomAnchor)
        return [
            leadingAnchor, trailingAnchor, bottomAnchor, heightAnchor//, widthAnchor
        ]
    }
    
    private func setupGestures() {
        //let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.cameraImageViewHandler))
        //self.cameraImageView.addGestureRecognizer(tapGesture)
    }
    
    @objc private func showStatus() {
        //print(self.statusLable.text ?? "Статус не найден")
        self.statusLable.text = self.statusText
    }
    
    @objc private func statusTextChanged(_ textField: UITextField){
        //print(self.inputBlock.text ?? "")
        self.statusText = self.inputBlock.text ?? ""
    }
}
 
