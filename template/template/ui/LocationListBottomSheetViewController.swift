import Foundation
import UIKit
import SnapKit

class LocationListBottomSheetViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let tableView = UITableView()
    private let locationsTitleLabel = UILabel()
    private let cellReuseIdentifier = "cell"
    private var locationList: [Location] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        initializeViews()
        setConstraints()
        populateLocations()
    }

    private func initializeViews() {
        locationsTitleLabel.text = "Locations"
        view.addSubview(locationsTitleLabel)

        tableView.apply {
            $0.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
            $0.delegate = self
            $0.dataSource = self
            view.addSubview($0)
        }
    }

    private func setConstraints() {
        locationsTitleLabel.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(VerticalSpacings.m)
            make.left.equalTo(view.safeAreaLayoutGuide.snp.left).offset(HorizontalSpacings.m)
            make.right.equalTo(view.safeAreaLayoutGuide.snp.right).offset(-HorizontalSpacings.m)
        }
        tableView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(locationsTitleLabel.snp.bottom).offset(VerticalSpacings.m)
            make.left.equalTo(view.safeAreaLayoutGuide.snp.left).offset(HorizontalSpacings.m)
            make.right.equalTo(view.safeAreaLayoutGuide.snp.right).offset(-HorizontalSpacings.m)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }

    private func populateLocations() {
        self.locationList = [Location("Paris"), Location("NY")]
        self.tableView.reloadData()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.locationList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = self.tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier)!
        cell.apply {_ in
            cell.textLabel?.text = self.locationList[indexPath.row].name
        }
        return cell
    }
}