import UIKit

class ProfileViewController: UIViewController {
    
    private lazy var profileHeaderView: ProfileHeaderView = {
        let profileHeaderView = ProfileHeaderView(frame: CGRect(x: 0, y: 100, width: 450, height: 700))
        //profileView.delegate = self
        profileHeaderView.backgroundColor = .systemGray
        return profileHeaderView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .lightGray
        self.title = "Страница профиля"
        self.view.addSubview(self.profileHeaderView) //добавление на экран
    }
    
    @objc private func didTapButton(){
        let vc = PostViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
