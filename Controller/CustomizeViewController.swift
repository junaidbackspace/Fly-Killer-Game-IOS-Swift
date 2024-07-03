


import UIKit
import DropDown

class CustomizeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    
    @IBOutlet weak var lblwaspscore: UITextField!
    @IBOutlet weak var lblladybugscore: UITextField!
    @IBOutlet weak var lbldragin1score: UITextField!
    @IBOutlet weak var lbldragon2score: UITextField!
    @IBOutlet weak var txtwasplbl: UILabel!
    
    @IBOutlet weak var txtenemywasplbl: UILabel!
    
    @IBOutlet weak var txtladybuglbl: UILabel!
    
    @IBOutlet weak var txtladugugfriendlylbl: UILabel!
    
    @IBOutlet weak var txtdragon1friendlylbl: UILabel!
    @IBOutlet weak var txtdragon1lbl: UILabel!
    var userScore: Int = 0 // Property to track the user's score

    @IBOutlet weak var txtdragon2enemylbl: UILabel!
    @IBOutlet weak var txtdragon2lbl: UILabel!
    let checkboxButton = UIButton()
    @IBOutlet weak var checkbtn1: UIButton!
    
    
    @IBOutlet weak var rdbutton: UIButton!
    @IBOutlet weak var lbltext: UILabel!
    @IBOutlet weak var numberTextField: UITextField!
    var isChecked: Bool = false
    var flyImageView: UIImageView!
    let options = ["2x", "3x", "4x"]
    var tableView = UITableView()
    var textField = UITextField()
    
    let option1 = ["2x", "3x", "4x"]
    var tableView1 = UITableView()
    var textField1 = UITextField()
    
    let option3 = ["2x", "3x", "4x"]
    var tableView3 = UITableView()
    var textField3 = UITextField()
    
    var checkBoxSwitch: UISwitch!
    var checkBoxButton: UIButton!
//var isChecked: Bool = false
    var checkBoxSwitch2: UISwitch!
    var checkBoxButton2: UIButton!
    var isChecked2: Bool = false
    var checkBoxSwitch3: UISwitch!
    var checkBoxButton3: UIButton!
    var isChecked3: Bool = false
    var checkBoxSwitch4: UISwitch!
    var checkBoxButton4: UIButton!
    var isChecked4: Bool = false
    
    @IBOutlet weak var rdbutton2: UIButton!
    //    let home = UIButton(type: .system)
//    let back = UIButton(type: .system)
    @IBOutlet weak var rdbutton3: UIButton!
    @IBOutlet weak var rdbutton4: UIButton!
    
    @IBOutlet weak var drpview: UITextField!
    let drp = DropDown()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
       // checkbtn1.setImage(UIImage(named: "unchecked"), for: .normal)
      //  checkbtn1.setImage(UIImage(named: "checked"), for: .selected)
        // Check if the user has enough score to customize
        if userScore < 500 {
            let alert = UIAlertController(title: "Insufficient Score", message: "You need 500 points to access customization.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
                self.dismiss(animated: true, completion: nil)
            }))
            present(alert, animated: true, completion: nil)
        } else {
            //setupUI()
        }
    }
    
    func setupUI() {
        // Set up the UI components as needed
        checkboxButton.frame = CGRect(x: 100, y: 100, width: 200, height: 100)
        checkboxButton.addTarget(self, action: #selector(checkboxTapped), for: .touchUpInside)
        updateCheckboxImage()
        self.view.addSubview(checkboxButton)
        
        checkBoxSwitch = UISwitch(frame: CGRect(x: 350, y: 280, width: 30, height: 30))
        checkBoxSwitch.isOn = false
        checkBoxSwitch.onTintColor = UIColor.blue
        checkBoxSwitch.addTarget(self, action: #selector(switchChanged), for: .valueChanged)
        self.view.addSubview(checkBoxSwitch)
        
        checkBoxSwitch2 = UISwitch(frame: CGRect(x: 350, y: 420, width: 30, height: 30))
        checkBoxSwitch2.isOn = false
        checkBoxSwitch2.onTintColor = UIColor.blue
        checkBoxSwitch2.addTarget(self, action: #selector(switchChanged2), for: .valueChanged)
        self.view.addSubview(checkBoxSwitch2)
        
        checkBoxSwitch3 = UISwitch(frame: CGRect(x: 350, y: 570, width: 30, height: 30))
        checkBoxSwitch3.isOn = false
        checkBoxSwitch3.onTintColor = UIColor.blue
        checkBoxSwitch3.addTarget(self, action: #selector(switchChanged3), for: .valueChanged)
        self.view.addSubview(checkBoxSwitch3)
        
        checkBoxSwitch4 = UISwitch(frame: CGRect(x: 350, y: 730, width: 30, height: 30))
        checkBoxSwitch4.isOn = false
        checkBoxSwitch4.onTintColor = UIColor.blue
        checkBoxSwitch4.addTarget(self, action: #selector(switchChanged4), for: .valueChanged)
        self.view.addSubview(checkBoxSwitch4)
    }
    
    @objc func checkboxTapped() {
        isChecked = !isChecked
        updateCheckboxImage()
        
        if isChecked {
            print("Checkbox is checked")
        } else {
            print("Checkbox is unchecked")
        }
    }

    func updateCheckboxImage() {
        let imageName = isChecked ? "checked_circle" : "unchecked_circle"
        checkboxButton.setImage(UIImage(named: imageName), for: .normal)
    }
    
    @objc func switchChanged(mySwitch: UISwitch) {
        print(mySwitch.isOn ? "Switch is ON" : "Switch is OFF")
    }

    @objc func switchChanged2(mySwitch: UISwitch) {
        print(mySwitch.isOn ? "Switch is ON" : "Switch is OFF")
    }

    @objc func switchChanged3(mySwitch: UISwitch) {
        print(mySwitch.isOn ? "Switch is ON" : "Switch is OFF")
    }

    @objc func switchChanged4(mySwitch: UISwitch) {
        print(mySwitch.isOn ? "Switch is ON" : "Switch is OFF")
    }
    
    @objc func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return options.count
    }

    @objc(tableView:cellForRowAtIndexPath:) func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = options[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        textField.text = options[indexPath.row]
        tableView.isHidden = true
    }
    
    @objc func textFieldTapped() {
        tableView.isHidden = !tableView.isHidden
    }

    @objc func tableView1(_ tableView2: UITableView, numberOfRowsInSection section: Int) -> Int {
        return option1.count
    }

    @objc(tableView:cellForRowAtIndexPath2:) func tableView(_ tableView2: UITableView, cellForRowAt1 indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = option1[indexPath.row]
        return cell
    }

    func tableView1(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        textField1.text = option1[indexPath.row]
        tableView.isHidden = true
    }
    
    @objc func textFieldTapped2() {
        tableView1.isHidden = !tableView1.isHidden
    }

    @objc func tableView3(_ tableView2: UITableView, numberOfRowsInSection section: Int) -> Int {
        return option3.count
    }

    @objc(tableView:cellForRowAtIndexPath3:) func tableView3(_ tableView3: UITableView, cellForRowAt3 indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = option3[indexPath.row]
        return cell
    }

    func tableView3(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        textField3.text = option3[indexPath.row]
        tableView.isHidden = true
    }
    
    @objc func textFieldTapped3() {
        tableView3.isHidden = !tableView3.isHidden
    }

    @objc func HomeButtonTapped() {
        let start = storyboard?.instantiateViewController(identifier: "FirstViewController") as! FirstViewController
        start.modalPresentationStyle = .fullScreen
        present(start, animated: true)
    }

    @objc func BackButtonTapped() {
        let start = storyboard?.instantiateViewController(identifier: "GamePlayViewController") as! GamePlayViewController
        start.modalPresentationStyle = .fullScreen
        present(start, animated: true)
    }

    @IBAction func playButtonTapped(_ sender: UIButton) {
        guard let image = selectedImage else {
            // Show an alert indicating that no image has been selected
            return
        }
        
        // Handle the play button action
    }
    
    @IBAction func savebtn(_ sender: Any) {
        let flyMgr = DBManager()
        
        flyMgr.createTable(query: "CREATE TABLE IF NOT EXISTS CUSTOMLEVEL (LEVEL TEXT, FLY TEXT,ISENEMY INTEGER,SCORE INTEGER)")
        //var query = "delete from CUSTOMLEVEL"
        var query = ""
        if rdbutton.isSelected{
            query = "Insert into CUSTOMLEVEL VALUES('1','wasp1','1','500')"
        }else if rdbutton2.isSelected{
            query = "Insert into CUSTOMLEVEL VALUES('1','simplefly1','2','500')"
        }else if rdbutton3.isSelected{
            query = "Insert into CUSTOMLEVEL VALUES('1','dragon1','3','500')"
        }else if rdbutton4.isSelected{
            query = "Insert into CUSTOMLEVEL VALUES('1','mustuito1','4','500')"
        }
        
        
        if checkBoxSwitch.isSelected{
            query = "Insert into CUSTOMLEVEL VALUES('1','wasp1','1','500')"
        }else if checkBoxSwitch2.isSelected{
            query = "Insert into CUSTOMLEVEL VALUES('1','simplefly1','2','500')"
        } else if checkBoxSwitch3.isSelected{
            query = "Insert into CUSTOMLEVEL VALUES('1','dragon1','3','500')"
        }else if checkBoxSwitch4.isSelected{
            query = "Insert into CUSTOMLEVEL VALUES('1','mustuito1','4','500')"
        }
        
        
        //flyMgr.createTable(query: query)
//         query = "Insert into CUSTOMLEVEL VALUES('1','wasp1','1','500')"
//        flyMgr.createTable(query: query)
//         query = "Insert into CUSTOMLEVEL VALUES('1','dragon1','1','500')"
//        flyMgr.createTable(query: query)
//        query = "Insert into CUSTOMLEVEL VALUES('1','musquito1','1','500')"
//       flyMgr.createTable(query: query)
//        query = "Insert into CUSTOMLEVEL VALUES('1','simplefly1','1','500')"
       flyMgr.createTable(query: query)
        print("data save")
    }
    @IBAction func checkboxbtn1(_ sender: Any) {
        rdbutton.isSelected = true
        

}

    @IBAction func checkboxbtn2(_ sender: Any) {
        rdbutton2.isSelected = true
    }
    
    @IBAction func checkboxbtn3(_ sender: Any) {
        rdbutton3.isSelected = true
    }
    
   
    
 
    @IBAction func checkboxbtn4(_ sender: Any) {
        rdbutton4.isSelected = true
    }
    
    
    var selectedImage: UIImage?

    
    @IBAction func dropdownbtn(_ sender: Any) {
        let dropDown = DropDown()
        dropDown.anchorView = drpview
        dropDown.dataSource = ["1","2","3","4","5","6"]
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            self.lbltext.text = "\(item)"
        }
        dropDown.show()

    }
    
    @IBAction func btnaction(_ sender: Any) {
        let start = storyboard?.instantiateViewController(identifier: "FirstViewController") as! FirstViewController
        start.modalPresentationStyle = .fullScreen
        present(start, animated: true)
    }
    
     
    @IBAction func ActionBtn(_ sender: Any) {
        let start = storyboard?.instantiateViewController(identifier: "CustomViewController") as! CustomViewController
        start.modalPresentationStyle = .fullScreen
        present(start, animated: true)
    }
}
