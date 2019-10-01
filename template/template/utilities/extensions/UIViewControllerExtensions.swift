import Foundation
import UIKit

extension UIViewController {

    internal func showNavigationBar(_ isShowing: Bool) {
        navigationController?.setNavigationBarHidden(!isShowing, animated: true)
    }

    internal func addChild(_ child: UIViewController, in containerView: UIView) {
        guard containerView.isDescendant(of: view) else {
            return
        }
        addChild(child)
        containerView.addSubview(child.view)
        child.view.pinToSuperview()
        child.didMove(toParent: self)
    }

    internal func removeChild(_ child: UIViewController) {
        child.willMove(toParent: nil)
        child.view.removeFromSuperview()
        child.removeFromParent()
    }
}
