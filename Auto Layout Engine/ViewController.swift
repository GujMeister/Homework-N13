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
    
    var isLiked = false
    
    @IBOutlet weak var likeButton: UIButton!
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
        setupButtonActions()
    }
    
    // MARK: - Setup UI
    func UISetup() {
        view.backgroundColor = UIColor(hex: "F5F5F5")
        
        func nameLabelsSetup() {
            productNameLabel.text = cappuccino.productName
            productNameLabel.font = .systemFont(ofSize: 20)
            productNameDescriptionLabel.text = cappuccino.withWhat
            productNameDescriptionLabel.font = .systemFont(ofSize: 12)
            productNameDescriptionLabel.textColor = UIColor(hex: "9B9B9B")
        }
        
        func priceLabelBuyButtonSetup() {
            buyUIView.backgroundColor = .white
            
            priceIntLabel.textColor = UIColor(hex: "C67C4E")
            priceIntLabel.font = .systemFont(ofSize: 22)
            priceIntLabel.text = "₾\(String(cappuccino.prices.medium))"
            
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
            sizeStackView.spacing = 8
            sizeStackView.backgroundColor = .clear
            sizeMediumButton.isSelected = true
            
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
            sizeMediumButton.tintColor = UIColor(hex: "2F2D2C")
            sizeMediumButton.layer.borderWidth = 1.0
            sizeMediumButton.layer.borderColor = UIColor(hex: "DEDEDE").cgColor
            sizeMediumButton.layer.cornerRadius = 10.0
            sizeMediumButton.clipsToBounds = true
            
            sizeLargeButton.setTitle("დიდი", for: .normal)
            sizeLargeButton.tintColor = UIColor(hex: "2F2D2C")
            sizeLargeButton.layer.borderWidth = 1.0
            sizeLargeButton.layer.borderColor = UIColor(hex: "DEDEDE").cgColor
            sizeLargeButton.layer.cornerRadius = 10.0
            sizeLargeButton.clipsToBounds = true
        }
        
        func descriptionSetup() {
            productDescriptionTitleLabel.text = "აღწერა"
            productDescription.text = cappuccino.description.medium
            productDescription.font = UIFont.systemFont(ofSize: 16, weight: .thin)
            productDescription.textColor = UIColor(hex: "9B9B9B")
        }
        
        func reviewsSetup() {
            averageStarsLabel.text = String(cappuccino.averageStarCount)
            averageStarsLabel.textColor = UIColor(hex: "2F2D2C")
            averageStarsLabel.font = .boldSystemFont(ofSize: 20)
            
            
            totalReviewsLabel.text = "(\(cappuccino.totalNumberOfReviews))"
            totalReviewsLabel.textColor = UIColor(hex: "808080")
            totalReviewsLabel.font = .systemFont(ofSize: 10)
            
            divisorLineView.backgroundColor = UIColor(hex: "EAEAEA")
        }
        
        func likeButtonSetup() {
            let unfilledHeart = UIImage(systemName: "heart")
            likeButton.setImage(unfilledHeart, for: .normal)
            likeButton.tintColor = .black
            likeButton.addTarget(self, action: #selector(likeButtonTapped), for: .touchUpInside)
        }
        
        likeButtonSetup()
        sizeStackViewButtonsSetup()
        reviewsSetup()
        descriptionSetup()
        coffeeImageViewSetup()
        nameLabelsSetup()
        priceLabelBuyButtonSetup()
    }
    
    // MARK: - Setup Actions
    func setupButtonActions() {
        sizeSmallButton.addTarget(self, action: #selector(sizeButtonTapped(_:)), for: .touchUpInside)
        sizeMediumButton.addTarget(self, action: #selector(sizeButtonTapped(_:)), for: .touchUpInside)
        sizeLargeButton.addTarget(self, action: #selector(sizeButtonTapped(_:)), for: .touchUpInside)
    }
    
    @objc func sizeButtonTapped(_ sender: UIButton) {
        sizeSmallButton.isSelected = false
        sizeMediumButton.isSelected = false
        sizeLargeButton.isSelected = false
        
        sender.isSelected = true
        
        switch sender {
        case sizeSmallButton:
            productDescription.text = cappuccino.description.small
            priceIntLabel.text = "₾\(String(cappuccino.prices.small))"
        case sizeMediumButton:
            productDescription.text = cappuccino.description.medium
            priceIntLabel.text = "₾\(String(cappuccino.prices.medium))"
        case sizeLargeButton:
            productDescription.text = cappuccino.description.large
            priceIntLabel.text = "₾\(String(cappuccino.prices.large))"
        default:
            break
        }
    }
    
    @objc func likeButtonTapped() {
        if isLiked {
            cappuccino.totalNumberOfReviews -= 1
            totalReviewsLabel.text = "(\(cappuccino.totalNumberOfReviews))"
            totalReviewsLabel.textColor = UIColor(hex: "808080")
            totalReviewsLabel.font = .systemFont(ofSize: 10)
            let unfilledHeart = UIImage(systemName: "heart")
            likeButton.setImage(unfilledHeart, for: .normal)
            likeButton.tintColor = .black
        } else {
            cappuccino.totalNumberOfReviews += 1
            totalReviewsLabel.text = "(\(cappuccino.totalNumberOfReviews))"
            totalReviewsLabel.textColor = UIColor(hex: "808080")
            totalReviewsLabel.font = .systemFont(ofSize: 10)
            let filledHeart = UIImage(systemName: "heart.fill")
            likeButton.setImage(filledHeart, for: .normal)
            likeButton.tintColor = .red
        }
        isLiked.toggle()
    }
}

// MARK: - Setup Hex color coding
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
