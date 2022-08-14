//import Foundation
import UIKit

protocol ProfileViewDelegate: AnyObject {
    func openImagePickerController()
}

class ProfileHeaderView: UIView{

    //Аватарка
    private lazy var avatarImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 16, y: 16, width: 150, height: 150))
        imageView.layer.cornerRadius = imageView.frame.width/2
        imageView.clipsToBounds = true //так как кнопка скругленная, данная функция делает так, чтобы дочерние компоненты не вылезали из углов (где скругление)
        //imageView.backgroundColor = .systemBlue
        imageView.image = UIImage(named: "ava.jpeg")
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor.white.cgColor
        return imageView
    }()
    
    //Заголовок
    private lazy var titleLable: UILabel = {
        let label = UILabel(frame: CGRect(x: 200, y: 27, width: 150, height: 30))
        //label.backgroundColor = .systemYellow
        label.text = "Иван Солярка"
        label.font = UIFont(name: label.font.fontName, size: 18)
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        return label
    }()
    
    private lazy var statusLable: UILabel = {
        let label = UILabel(frame: CGRect(x: 200, y: 100, width: 200, height: 30))
        //label.backgroundColor = .systemYellow
        label.text = "Ожидаем статус..."
        label.font = UIFont(name: label.font.fontName, size: 14)
        label.font = UIFont.boldSystemFont(ofSize: 10)
        label.textColor = .darkGray
        return label
    }()
    
    private lazy var inputBlock: UITextField = {
        let input = UITextField(frame: CGRect(x: 200, y: 150, width: 190, height: 45))
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
        return input
    }()
    
    //рисуем кнопку
    private lazy var editButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 16, y: 230, width: 380, height: 50))
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
    }
    
    func setup(with profile: Profile){
        self.avatarImageView.image = profile.image ?? UIImage(systemName: "person.circle")
    }
    
    @objc private func showStatus() {
        //print(self.statusLable.text ?? "Статус не найден")
        self.statusLable.text = self.statusText
    }
    
    @objc private func statusTextChanged(_ textField: UITextField){
        //print(self.inputBlock.text ?? "")
        self.statusText = self.inputBlock.text ?? ""
    }
    
    private var statusText: String?
}
 
