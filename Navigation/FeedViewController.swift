import UIKit

class FeedViewController: UIViewController {

    var post = Post(title: "Мой пост для передачи")
    
    private lazy var button: UIButton = {
        let button = UIButton(frame: CGRect(x:0, y:0, width: 200, height: 50))
        button.backgroundColor = .systemRed
        button.addTarget(self, action: #selector(self.didTapButton), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBrown
        self.view.addSubview(self.button)
        self.button.center = self.view.center
        self.title = "Страница ленты"
    }
    
    @objc private func didTapButton(){
        let vc = PostViewController()
        vc.titlePost = post.title
        self.navigationController?.pushViewController(vc, animated: true)        
    }
}
