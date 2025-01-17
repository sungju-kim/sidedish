import UIKit

extension UIColor {
    static let dishBlack = UIColor(rgb: 0x010101)
    static let dishWhite = UIColor(rgb: 0xFFFFFF)
    static let dishGrey1 = UIColor(rgb: 0x4F4F4F)
    static let dishGrey2 = UIColor(rgb: 0x828282)
    static let dishGrey3 = UIColor(rgb: 0xE0E0E0)
    static let dishGrey4 = UIColor(rgb: 0xF5F5F7)
    static let dishPrimary = UIColor(rgb: 0x007AFF)
    static let dishPrimaryDark = UIColor(rgb: 0x0066D6)
    static let dishPrimaryLight = UIColor(rgb: 0x80BCFF)
    
    convenience init(red: Int, green: Int, blue: Int, alpha: CGFloat = 1.0) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: alpha)
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
}
