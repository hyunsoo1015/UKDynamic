import UIKit

class GravityView: UIView {
    //사각형 뷰를 생성
    //lazy : 지연생성(처음 사용할 때 생성)을 해주는 예약어
    lazy var squareView: UIView = {[unowned self] in
        let sv = UIView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        addSubview(sv)
        return sv
    }()
    
    //중력 애니메이션
    lazy var gravity = {[unowned self] in
        return UIGravityBehavior(items: [self.squareView])
    }()
    
    //애니메이션 수행 해 줄 객체
    lazy var animator: UIDynamicAnimator = {[unowned self] in
        return UIDynamicAnimator(referenceView: self)
    }()
}
