import UIKit

class ProfileViewController: UIViewController {
    
    private lazy var profileHeaderView: ProfileHeaderView = {
        //let profileHeaderView = ProfileHeaderView(frame: CGRect(x: 0, y: 100, width: 450, height: 700))
        //let profileHeaderView = ProfileHeaderView(frame: CGRect(x: 0, y: 88, width: 414, height: 808))
        //profileHeaderView.delegate = self
        let profileHeaderView = Navigation.ProfileHeaderView(frame: .zero)
        profileHeaderView.backgroundColor = .systemGray
        
        profileHeaderView.translatesAutoresizingMaskIntoConstraints = false
        
        return profileHeaderView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .lightGray
        self.title = "Страница профиля"
        self.view.addSubview(self.profileHeaderView) //добавление на экран
        
        let profileViewContraints = ProfileHeaderView()
        //let fullNameLabelContraints = fullNameLabelContraints()
        //активация констрейна
        NSLayoutConstraint.activate(profileViewContraints)
        
        //self.profileHeaderView.setup(with: self.profile) //передача данных
    }
    
    private func ProfileHeaderView() -> [NSLayoutConstraint]{
        let topContraint = NSLayoutConstraint(item: self.profileHeaderView, attribute: .top, relatedBy: .equal, toItem: self.view.safeAreaLayoutGuide, attribute: .top, multiplier: 1, constant: 0)
        let leftContraint = self.profileHeaderView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
        let rightContraint = self.profileHeaderView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        let heightAnchor = self.profileHeaderView.heightAnchor.constraint(equalToConstant: 220)
        
        return [
            topContraint, leftContraint, rightContraint, heightAnchor
        ]
    }
    
    @objc private func didTapButton(){
        let vc = PostViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
