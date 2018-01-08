//
//  AbstractTableListControl.swift

import UIKit

var itemsPerPage = 10
var preloadAtItem = 7
protocol TableListDelegate {
    func didSelectCell()
}
class AbstractTableListControl: UITableViewController, TableCellDelegate {
    enum RequestPageType : Int {
        case first = 0
        case next = 1
    }
    
    var searchEnabled : Bool = false
    var _searchQuery : NSString!
    
    var isLoading : Bool!
    var offset : NSInteger!
    var isPageAvailable : Bool!
    var cellDelegate: TableCellDelegate!
    var   listDelegate: TableListDelegate!
    
    
    var searchQuery: NSString! {
        get {
            return _searchQuery ?? ""
        }
        set {
            if newValue != _searchQuery {
                _searchQuery = newValue
                requestItemsForFirstPage()
            }
        }
    }
    
    var items = NSMutableArray()
    
    var isNibUsed: Bool {
        return false
    }
    
    var cellClass: AbstractTableCell.Type {
        return AbstractTableCell.self
    }
    
    var reuseId: String {
        return self.cellClass.reuseId
    }
    
    // MARK: init view
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    required override init(style: UITableViewStyle) {
        super.init(style: style)
    }
    
    // MARK: View load functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isLoading = false
        self.setupCollectionView()
        self.requestItemsForFirstPage()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        for cell in self.tableView.visibleCells {
            (cell as! AbstractTableCell).viewDisappear()
        }
    }
    
    // MARK: init view
    
    func setupCollectionView() {
        // Register cell classes
        tableView?.backgroundColor = UIColor.clear
        tableView?.rowHeight = UITableViewAutomaticDimension;
        tableView.estimatedRowHeight = self.cellClass.cellSize.height;
        tableView.separatorStyle = .singleLine
        tableView.separatorInset = .zero
        tableView.tableFooterView = UIView()
        if isNibUsed {
            tableView!.register((UINib.init(nibName: String(describing: cellClass), bundle: nil)), forCellReuseIdentifier: reuseId)
        } else {
            tableView!.register(self.cellClass, forCellReuseIdentifier:self.reuseId)
        }
        tableView!.showsVerticalScrollIndicator = false;
        tableView!.alwaysBounceVertical = true;
        
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(AbstractTableListControl.refresh), for: .valueChanged)
        
        if #available(iOS 10.0, *) {
            tableView.refreshControl = refreshControl
        } else {
            tableView.backgroundView = refreshControl
        }
        
        tableView?.contentInset = UIEdgeInsetsMake(5, 0, 0, 0)
        tableView?.backgroundView = self.customBackgroundView
    }
    
    func addContentOffsetObserver() {
//        self.tableView!.addObserver(self, forKeyPath: CONTENT_OFFSET_KEY_PATH, options: NSKeyValueObservingOptions.new, context: nil);
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
//        if (keyPath == CONTENT_OFFSET_KEY_PATH) {
        
//        }
    }
    
    // MARK: setter getters
    
    var _customBackgroundView: ListBackgroundView?
    var customBackgroundView: ListBackgroundView {
        get {
            if (_customBackgroundView == nil) {
                _customBackgroundView = ListBackgroundView()
                _customBackgroundView?.isVisible = false
            }
            return _customBackgroundView!
        }
        set {
            _customBackgroundView = newValue
        }
    }
    
    var noItemsText: String {
        get {
            return self.customBackgroundView.messageText;
        }
        set {
            self.customBackgroundView.messageText = newValue
        }
    }
    
    // MARK: requests
    
    func requestItemsForFirstPage() {
        if isLoading == false {
            isLoading = true
            self.isPageAvailable = true
            offset = 0
            self.requestItemsForPage(.first)
        }
    }
    
    func requestItemsForNextPage() {
        if isLoading == false && self.isPageAvailable == true {
            isLoading = true
            offset = offset+itemsPerPage
            self.requestItemsForPage(.next)
        }
    }
    
    func requestItemsForPage(_ type: RequestPageType) {
        // Skip request if searching and no search query
        if (self.searchEnabled && self.searchQuery.length == 0) {
            self.items.removeAllObjects();
            self.tableView!.reloadData();
            return;
        }
        if (self.items.count == 0) {
//            SVProgressHUD.show()
        }
        // Make a request
        self.requestItems(self.searchQuery, limit: itemsPerPage, offset: offset, completion:{(items, error, pageAvailable) in
            self.isLoading = false
            self.isPageAvailable = pageAvailable
            self.endRefreshing()
//            SVProgressHUD.dismiss()
            if (error == nil && !self.items.isEqual(items) && items != nil) {
                if (type == .first) {
                    self.items.removeAllObjects()
                }
                self.items.addObjects(from: items! as! [Any])
                self.tableView?.reloadData()
            } else {
                if (type == .first && error != nil) {
                    self.items.removeAllObjects();
                    self.tableView!.reloadData();
                }
            }
            self.customBackgroundView.isVisible = (self.items.count == 0)
        })
    }
    
    func requestItems(_ query: NSString, limit: NSInteger, offset: NSInteger, completion: @escaping (_ : NSArray?, _ : NSError?, _ : Bool?) -> Void) {
        completion(nil, nil, false); // Default implementation does almost nothing
    }
    
    func endRefreshing() {
        self.refreshControl?.endRefreshingIfNeeded()
    }
    // MARK: Actions
    
    @objc func refresh() {
        self.requestItemsForFirstPage()
    }
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.reuseId, for: indexPath) as! AbstractTableCell
        cell.delegate = self
        cell.updateWithModel(items[indexPath.row] as AnyObject)
        cell.selectionStyle = .none
        cell.accessoryType = .none
        // Configure the cell
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if listDelegate != nil {
        listDelegate.didSelectCell()
        }
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        (cell as! AbstractTableCell).viewAppear()
        
        let shouldPreloadHere = indexPath.item == self.items.count - itemsPerPage + preloadAtItem;
        let lastItemReached = indexPath.item == self.items.count - 1;
        if (shouldPreloadHere || lastItemReached) {
            self.requestItemsForNextPage();
        }
    }
    
    // MARK: Cell delegate methods
    
    func updateCell() {
        tableView.reloadData()
    }
    
    func updateModel(_ model: AnyObject, cell: AbstractTableCell) {
        let indexPath = tableView.indexPathForRow(at: cell.frame.origin)
        let row: Int = (indexPath?.row)!
        self.items.replaceObject(at: row, with: model)
        print(row)
    }
    
    override func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        (cell as! AbstractTableCell).viewDisappear()
    }
    
    // MARK: Misc
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}



    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
// To show error message label.



