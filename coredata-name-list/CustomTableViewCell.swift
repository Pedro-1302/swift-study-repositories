import UIKit

class CustomTableViewCell: UITableViewCell {
    // Your outlets
    var nameLabel = UILabel()
    var genreLabel = UILabel()
    var lastnameLabel = UILabel()
    var eyecolorLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        // Configure and add subviews, e.g., add your labels to the cell's contentView
        contentView.addSubview(nameLabel)
        contentView.addSubview(genreLabel)
        contentView.addSubview(lastnameLabel)
        contentView.addSubview(eyecolorLabel)

        // Configure constraints for your labels
        // This is where you define the layout and constraints for your labels within the cell
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
