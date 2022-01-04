import UIKit

class ViewController: UIViewController, UIColorPickerViewControllerDelegate {
    let canvas = Canvas()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        canvas.frame = CGRect(x: 0, y: 20, width: view.frame.width, height: view.frame.height - 100)
        canvas.backgroundColor = .white
        
        let colorButton = UIButton(frame: CGRect(x: 0, y: 100, width: 100, height: 50))
        
        colorButton.setTitle("Color", for: .normal)
        colorButton.backgroundColor = .systemGreen
        colorButton.addTarget(self, action: #selector(didTapSelectColor), for: .touchUpInside)

        view.addSubview(canvas)
        view.addSubview(colorButton)
    }
    

    @objc private func didTapSelectColor(){
        let colorPickerVC = UIColorPickerViewController()
        colorPickerVC.delegate = self
        colorPickerVC.selectedColor = UIColor(cgColor: canvas.color)
        
        present(colorPickerVC, animated: true)
    }
    
    func colorPickerViewControllerDidSelectColor(_ viewController: UIColorPickerViewController) {
        let color = viewController.selectedColor

        canvas.setColor(color.cgColor)
    }
    
    @IBAction func remove(_ sender: Any) {
        canvas.clearAll()
    }

    @IBAction func undo(_ sender: Any) {
        canvas.removePrevLine()
    }
}
