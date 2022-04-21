import UIKit

class BriefBanchanViewCell: UICollectionViewCell {
    
    static let cellId = "briefBanchanViewCell"
    
    private var dishImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private var dishTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = UIColor.dishBlack
        label.text = "요리 제목"
        return label
    }()
    
    private var dishDescription: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight(400))
        label.textColor = UIColor.dishLightGrey
        label.text = "감질맛 나는 요리 설명"
        return label
    }()
    
    private var discountPrice: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight(600))
        label.textColor = UIColor.dishBlack
        label.text = "12,640원"
        return label
    }()
    
    private var normalPrice: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight(400))
        label.textColor = UIColor.dishLightGrey
        label.text = "15,800원"
        return label
    }()
    
    private var specialPrice: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight(600))
        label.textColor = UIColor.dishWhite
        label.backgroundColor = UIColor.dishBlue
        label.text = "특가 정보"
        label.layer.cornerRadius = 10
        label.clipsToBounds = true
        return label
    }()
    
    private var prices: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private var breifStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private var blank: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layout()
        self.layoutBreifStackView()
        self.layoutPriceStackView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.layout()
        self.layoutBreifStackView()
        self.layoutPriceStackView()
    }
    
    private func layout() {
        self.addSubview(self.dishImage)
        self.addSubview(self.breifStackView)
        self.addSubview(self.specialPrice)
        NSLayoutConstraint.activate([
            self.dishImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.dishImage.topAnchor.constraint(equalTo: self.topAnchor),
            self.dishImage.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.dishImage.widthAnchor.constraint(equalTo: self.heightAnchor, multiplier: 1),
            
            self.breifStackView.leadingAnchor.constraint(equalTo: self.dishImage.trailingAnchor, constant: CGFloat.defaultInset),
            self.breifStackView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -CGFloat.defaultInset),
            self.breifStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: CGFloat.defaultInset),
            self.breifStackView.bottomAnchor.constraint(equalTo: self.specialPrice.topAnchor, constant: -CGFloat.defaultInset),
            
            self.specialPrice.leadingAnchor.constraint(equalTo: self.dishImage.trailingAnchor, constant: CGFloat.defaultInset),
            self.specialPrice.widthAnchor.constraint(equalTo: self.breifStackView.widthAnchor, multiplier: 0.3),
            self.specialPrice.heightAnchor.constraint(equalTo: self.breifStackView.heightAnchor, multiplier: 0.3),
            self.specialPrice.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8),
        ])
        
    }
    
    private func layoutBreifStackView() {
        self.breifStackView.addArrangedSubview(self.dishTitle)
        self.breifStackView.addArrangedSubview(self.dishDescription)
        self.breifStackView.addArrangedSubview(self.prices)
    }
    
    private func layoutPriceStackView() {
        self.prices.addArrangedSubview(self.discountPrice)
        self.prices.addArrangedSubview(self.normalPrice)
        self.prices.addArrangedSubview(self.blank)
        
        self.normalPrice.attributedText = self.normalPrice.text?.strikeThrough()
    }
    
}