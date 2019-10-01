import UIKit

/// Created by Gaétan Zanella on 14/11/2018.
///     A view which removes itself from the responder chain.
///     Use whenever you need to provide a backdrop view to an `OverlayContainerViewController`.

public class PassThroughView: UIView {

    public override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        let view = super.hitTest(point, with: event)
        if view == self {
            return nil
        }
        return view
    }
}