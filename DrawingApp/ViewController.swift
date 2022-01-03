import UIKit

class ViewController: UIViewController {
    let canvas = Canvas()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(canvas);

        canvas.frame = CGRect(x: 0, y: 20, width: view.frame.width, height: view.frame.height - 100);
        canvas.backgroundColor = UIColor.white;
    }
    
    func showModal() {
        let modalViewController = ModalViewController()
        modalViewController.modalPresentationStyle = .overCurrentContext
        present(modalViewController, animated: true, completion: nil)
    }
}
