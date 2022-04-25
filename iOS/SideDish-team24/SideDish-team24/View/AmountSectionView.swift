import UIKit

class AmountSectionView: UIView {
    
    private let amountTitle : UILabel = {
        let label = UILabel.customLabel("총 주문금액", UIColor.dishLightGrey)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: CGFloat(18), weight: .semibold)
        return label
    }()
    
    private let amountValue : UILabel = {
        let label = UILabel.customLabel("12,640원", UIColor.dishBlack)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: CGFloat(32), weight: .semibold)
        return label
    }()
    
    private let amountView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.frame.size.width = 243
        view.frame.size.height = 48
        return view
    }()
    
    private let button : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("주문하기", for: .normal)
        button.setTitleColor(.white, for: .normal)

        button.frame.size.width = 343
        button.frame.size.height = 50
        button.backgroundColor = UIColor.dishPrimary2
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.layout()
    }

    private func layout() {
        self.addSubview(amountView)
        self.addSubview(button)
        layoutAmount()
        layoutButton()
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: 122),

            self.amountView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            self.amountView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            self.amountView.bottomAnchor.constraint(equalTo: self.button.topAnchor, constant: -24),
            
            self.button.heightAnchor.constraint(equalToConstant: 50),
            self.button.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            self.button.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            self.button.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
    
    private func layoutAmount() {
        self.amountView.addSubview(self.amountTitle)
        self.amountView.addSubview(self.amountValue)
        
        NSLayoutConstraint.activate([
            self.amountView.heightAnchor.constraint(equalToConstant: 48),
            
            self.amountTitle.widthAnchor.constraint(equalToConstant: 87),
            self.amountTitle.heightAnchor.constraint(equalToConstant: 24),
            self.amountTitle.topAnchor.constraint(equalTo: self.amountView.topAnchor, constant: 12),
            self.amountTitle.trailingAnchor.constraint(equalTo: self.amountValue.leadingAnchor, constant: -CGFloat.defaultInset),

            self.amountValue.heightAnchor.constraint(equalToConstant: 48),
            self.amountValue.topAnchor.constraint(equalTo: self.amountView.topAnchor),
            self.amountValue.leadingAnchor.constraint(equalTo: self.amountTitle.trailingAnchor),
            self.amountValue.trailingAnchor.constraint(equalTo: self.amountView.trailingAnchor)
        ])
    }
    
    private func layoutButton() {
        self.button.layer.cornerRadius = 12
        self.button.clipsToBounds = true
    }
}
