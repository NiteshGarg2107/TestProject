//
//  AbstractTableCell.swift

import UIKit

protocol TableCellDelegate {
    func updateCell()
    func updateModel(_ model: AnyObject, cell: AbstractTableCell)
}

class AbstractTableCell: UITableViewCell {

    var delegate: TableCellDelegate!
    
    class var reuseId: String {
        return String(describing: self)
    }
    
    class var aspectRatio: CGFloat {
        get {
            return 0.8;
        }
        set {
            self.aspectRatio = newValue
        }
    }
    
    class var cellSize: CGSize {
        let width = UIScreen.main.bounds.width
        return CGSize(width: width, height: width * self.aspectRatio)
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.initViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.initViews()
    }
    
    func initViews() {
        self.backgroundColor = UIColor.clear
    }
    
    func viewAppear() {
    }
    
    func viewDisappear() {
    }
    
    func updateWithModel(_ model: AnyObject) {
    }
    
    func updateCell() {
        layoutSubviews()
        delegate.updateCell()
    }
    
    func updateModel(_ model: AnyObject) {
        delegate.updateModel(model, cell: self)
    }
}


