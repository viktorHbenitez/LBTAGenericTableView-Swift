# Create a Generic TableView


## Generic programming is a way to write function and data types while making minimal assumptions (suposiciones minimas) about the type of data being used.
## Generic can be used to reduce functions to redundant code.

![startProject](../master/assets/sketch1.png)  

### Example:

Create a generic UITableViewCell and use in the CustomTableViewController:  

1. `BaseTableViewController` heritage of `UITableViewController`
1.2 Register the UITableViewCell  `tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)`

what happen if whe want to register other UItableViewCell?  

2. we can use `Generic UITableViewCell`  

```swift
class SomeListController: BaseTableViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // What happent if you want to register diferent tableViewCell  REDUNDANT CODE
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        OR ...
        // GENERIC TYPE

    }
    
    ...
}
```

## Creating a Generic customGenericCell

```swift

class BaseTableViewController<GenericCell: UITableViewCell>: UITableViewController {
    
    ...
    
    fileprivate func setupTableView(){
        tableView.register(GenericCell.self, forCellReuseIdentifier: cellId)
        
    }
    
    ...
}

```
in  `SomeListController`  

```swift 
class SomeListController: BaseTableViewController<BaseCustomCell> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}


class BaseCustomCell: UITableViewCell {
    
    var item : Any!{
        didSet{
            textLabel?.text = item as? String
        }
    }
    
}


```
## add a Base Custom Cell

```swift

// <T: UITableViewCell> Declare generic, we can change different tableViewCell
class BaseTableViewController<GenericCell: UITableViewCell>: UITableViewController {
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        
    }
    
    ... 
    
    fileprivate func setupTableView(){
        
        //        tableView.tableFooterView  = UIView() // Remove horizontal lines
        tableView.register(GenericCell.self, forCellReuseIdentifier: cellId)
        
        
    }
   
    // Create a cell for each table view row
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! BaseCustomCell
        let item = arrItems[indexPath.row]
        cell.item = item
        
        return cell
        
    }
}


class BaseCustomCell: UITableViewCell {
    
    var item : Any!{
        didSet{
            textLabel?.text = item as? String
        }
    }
    
}

```








