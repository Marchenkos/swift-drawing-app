import UIKit

class ViewController: UIViewController, UIColorPickerViewControllerDelegate {
    let canvas = Canvas()

    override func viewDidLoad() {
        super.viewDidLoad()

        addCanvas()
    }
    
    func addCanvas() {
        canvas.frame = CGRect(x: 0, y: 20, width: view.frame.width, height: view.frame.height - 100)
        canvas.backgroundColor = .white

        view.addSubview(canvas)
    }
    
    func colorPickerViewControllerDidSelectColor(_ viewController: UIColorPickerViewController) {
        let color = viewController.selectedColor

        canvas.setColor(color.cgColor)
    }
    
    @IBAction func remove(_ sender: Any) {
        canvas.clearAll()
    }
    
    @IBAction func undo(_ sender: Any) {
        canvas.undo()
    }

    @IBAction func onColorButtonPress(_ sender: Any) {
        let colorPickerVC = UIColorPickerViewController()
        colorPickerVC.delegate = self
        colorPickerVC.selectedColor = UIColor(cgColor: canvas.color)
        
        present(colorPickerVC, animated: true)
    }

    @IBAction func onSliderValueChange(_ sender: UISlider) {
        canvas.setStrokeWidth(CGFloat(sender.value))
    }
}
