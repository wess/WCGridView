WCGridView
==========
WCGridView is a drop in View and Controller for creating simple and scrollable Grids for iOS applications. It's modeled very closely after UITableView/UITableViewController so getting up and going should be fairly easy.

### Using the WCGridViewController
Start with creating a UIViewController file, then include WCGridViewController.h and have your newly created view controller extend it.

---

#### You will need to override the dataSource and delegate Methods:

```objectivec

- (NSInteger)numberOfRowsForGridView:(WCGridView *)gridView;

- (NSInteger)gridView:(WCGridView *)gridView numberOfColumnsForRowAtIndex:(NSInteger)index;

- (WCGridViewCell *)gridView:(WCGridView *)gridView cellForGridIndexPath:(WCGridIndexPath)indexPath;

```

#### To interact with selected cells you can implement the optional delegate method:

```objectivec

- (void)gridView:(WCGridView *)gridView didSelectCellAtIndexPath:(WCGridIndexPath)indexPath;

```

To create custom cells, you can just subclass WCGridViewCell. Currently WCGridViewCell uses layoutsubiews, but you could easily use drawrect instead.  When subclassing, it is suggested to use initWithReuseIdentifier:(NSString *)reuseIdentifier to setup cell caching.
 

---

#### Notes:
- This project uses ARC
- This is still in early stages

---


If you have an suggestions, contributes, etc.. Feel free to send me a message here and I will do what I can to get back with ya.

Thanks, 
Wess
