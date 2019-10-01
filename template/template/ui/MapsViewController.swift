import Foundation
import MapKit
import OverlayContainer
import SnapKit

class MapsViewController: UIViewController {

    internal var mapView: MKMapView?

    private var showsOverlay = false
    private let backgroundPassThrough = PassThroughView()
    private let overlayBackground = PassThroughView()
    private let locationListViewController = LocationListBottomSheetViewController()
    private let overlayController = OverlayContainerViewController()
    private var overlayContainerView = UIView()
    private let backgroundView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        showNavigationBar(true)
        title = "Maps"
        initializeViews()
        setConstraints()
    }

    internal func notchHeight(for notch: OverlayNotch, availableSpace: CGFloat) -> CGFloat {
        return notch.getHeight(withHeight: availableSpace)
    }

    private func initializeViews() {
        mapView = MKMapView()
        self.view.insertSubview(mapView!, at: 0)

        overlayController.delegate = self

        view.addSubview(backgroundPassThrough)

        overlayBackground.addSubview(overlayContainerView)
        backgroundPassThrough.addSubview(overlayBackground)

        setLocationsListBottomSheet()
    }

    private func setConstraints() {
        backgroundPassThrough.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(view.snp.top)
            make.left.equalTo(view.snp.left)
            make.right.equalTo(view.snp.right)
            make.bottom.equalTo(view.snp.bottom)
        }
        mapView!.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(view.snp.top)
            make.left.equalTo(view.snp.left)
            make.right.equalTo(view.snp.right)
            make.bottom.equalTo(view.snp.bottom)
        }
        overlayBackground.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(view.snp.centerY)
            make.left.equalTo(view.snp.left)
            make.right.equalTo(view.snp.right)
            make.bottom.equalTo(view.snp.bottom)
        }
        overlayContainerView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(view.snp.top)
            make.left.equalTo(view.snp.left)
            make.right.equalTo(view.snp.right)
            make.bottom.equalTo(view.snp.bottom)
        }
    }

    private func setLocationsListBottomSheet() {
        removeChild(overlayController)
        overlayController.viewControllers = [locationListViewController]
        addChild(overlayController, in: overlayContainerView)
    }
}
