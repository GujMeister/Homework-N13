//
//  ViewController.swift
//  Auto Layout Engine
//
//  Created by Luka Gujejiani on 05.04.24.
//
/*
ააწყეთ ფიგმაზე მოცემული გვერდი
დარწმუნდით რომ აწყობილი გვერდი ერგება როგორც iPhone 15 Pro Max, ისე iPhone 13 Mini-ს
შექმენით მოდელი (სტრუქტურა) Coffee. აღწერეთ ის პარამეტრები რომლებიც დაგჭირდებათ ამ ვიზუალისთვის. მაგ: productName: String, price: Double, და ასე შემდეგ, შეავსეთ ის სასურველი ინფორმაციით და გამოიყენეთ ეს მოდელი იმისათვის რომ გამოიტანოთ ინფორმაცია კომპონენტებზე


გაითვალისწინეთ:

იმისათვის რომ გაიგოთ constraint-ები დააჭირეთ სასურველ კომპონენტს ფიგმაზე, შემდეგ დააჭირეთ Option ღილაკს და მიიტანეთ მაუსი იმ ელემენტთან რომლის მიმართაც გაინტერესებთ დაშორების გაგება.
აღწერის ტექსტზე პანიკა არ აწიოთ არ არის საჭირო “მეტი”-ს გაკეთება, თუ გინდათ იგივე ტექსტი გადაიტანეთ და … დაუსვით
ფონტი სურვილისამებრ აარჩიეთ
ყავის ფოტო თუ არ მოგწონთ სურვილისამებრ სხვა გამოიყენეთ


არასავალდებულო:



ფავორიტზე დაჭერისას გული უნდა გაწითლდეს (გამოიყენეთ SF Symbols - “heart” & “heart.filled”)
ფავორიტზე დაჭერისას შეიცვალოს რეიტინგის რაოდენობა
ფასი ცვალეთ დინამიურად იმის მიხედვით თუ რა ზომის ყავა გაქვთ არჩეული
*/
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var productDescription: UILabel!
    
    @IBOutlet weak var sizeLargeButton: UIButton!
    @IBOutlet weak var sizeMediumButton: UIButton!
    @IBOutlet weak var sizeSmallButton: UIButton!
    @IBOutlet weak var sizeStackView: UIStackView!
    @IBOutlet weak var sizeLabel: UILabel!
    
    @IBOutlet weak var buyUIView: UIView!
    @IBOutlet weak var buyButton: UIButton!
    @IBOutlet weak var priceIntLabel: UILabel!
    @IBOutlet weak var priceTextLabel: UILabel!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productNameDescriptionLabel: UILabel!
    @IBOutlet weak var coffeeImageView: UIImageView!
    
    
    @IBOutlet weak var divisorLineView: UIView!
    @IBOutlet weak var starLogoImage: UIImageView!
    @IBOutlet weak var totalReviewsLabel: UILabel!
    @IBOutlet weak var averageStarsLabel: UILabel!
    
    @IBOutlet weak var productDescriptionTitleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UISetup()
    }
    
    func UISetup() {
        view.backgroundColor = UIColor(hex: "F5F5F5")
        
        func nameLabelsSetup() {
            productNameLabel.text = "კაპუჩინო"
            productNameLabel.font = .systemFont(ofSize: 20)
            productNameDescriptionLabel.text = "შოკოლადით"
            productNameDescriptionLabel.font = .systemFont(ofSize: 12)
        }
        
        func priceLabelBuyButtonSetup() {
            buyUIView.backgroundColor = .white
            
            priceIntLabel.textColor = UIColor(hex: "C67C4E")
            priceIntLabel.font = .systemFont(ofSize: 22)
            priceIntLabel.text = "₾4.53"
            
            priceTextLabel.font = .systemFont(ofSize: 14)
            priceTextLabel.text = "ფასი"
            
            buyButton.setTitle("ყიდვა", for: .normal)
            buyButton.tintColor = UIColor(hex: "C67C4E")
            buyButton.layer.cornerRadius = 10
        }
        
        func coffeeImageViewSetup() {
            coffeeImageView.contentMode = .scaleAspectFill
            coffeeImageView.layer.cornerRadius = 5
            let image = UIImage(named: "coffeeImage")
            coffeeImageView.image = image
        }
        
        func sizeStackViewButtonsSetup() {
            sizeStackView.spacing = 30
            sizeStackView.backgroundColor = .clear
            
            sizeLabel.text = "ზომა"
            sizeLabel.textColor = UIColor(hex: "2F2D2C")
            sizeLabel.font = .systemFont(ofSize: 14)
            
            sizeSmallButton.setTitle("პაწა", for: .normal)
            sizeSmallButton.tintColor = UIColor(hex: "2F2D2C")
            sizeSmallButton.layer.borderWidth = 1.0
            sizeSmallButton.layer.borderColor = UIColor(hex: "DEDEDE").cgColor
            sizeSmallButton.layer.cornerRadius = 10.0
            sizeSmallButton.clipsToBounds = true
            
            sizeMediumButton.setTitle("საშუალო", for: .normal)
            
            sizeLargeButton.setTitle("დიდი", for: .normal)
        }
        
        func descriptionSetup() {
            productDescriptionTitleLabel.text = "აღწერა"
            
            productDescription.text = "მოცემული კაპუჩინო არის დაახლოებით 150 მლ. ის შეიცავს 25 მლ. ესპრესოს ყავას, 85 მლ. ახალთახალი მოწველილი ძროხის რძის რძეს, რომელიც სპეც..."
        }
        
        func reviewsSetup() {
            
            averageStarsLabel.text = "4.8"
            averageStarsLabel.textColor = UIColor(hex: "2F2D2C")
            averageStarsLabel.font = .boldSystemFont(ofSize: 20)
            
            
            totalReviewsLabel.text = "(230)"
            totalReviewsLabel.textColor = UIColor(hex: "2F2D2C")
            totalReviewsLabel.font = .systemFont(ofSize: 14)
            
            divisorLineView.backgroundColor = UIColor(hex: "EAEAEA")
        }
        
        reviewsSetup()
        descriptionSetup()
        sizeStackViewButtonsSetup()
        coffeeImageViewSetup()
        nameLabelsSetup()
        priceLabelBuyButtonSetup()
    }

}




extension UIColor {
    convenience init(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")

        var rgb: UInt64 = 0

        Scanner(string: hexSanitized).scanHexInt64(&rgb)

        let red = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgb & 0x0000FF) / 255.0

        self.init(red: red, green: green, blue: blue, alpha: 1.0)
    }
}


// https://stackoverflow.com/questions/22882857/how-to-use-uibutton-as-toggle-button
