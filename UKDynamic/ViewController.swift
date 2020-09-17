import UIKit

class ViewController: UIViewController {
    //snap을 위한 인스턴스 변수
    //var square: UIView?
    //var snap: UISnapBehavior?
    //var animator: UIDynamicAnimator?
    
    var blueBox: UIView?
    var redBox: UIView?
    
    var animator: UIDynamicAnimator?
    
    var curLocation: CGPoint?
    var attachment: UIAttachmentBehavior?
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first, let blueBox = blueBox {
            curLocation = touch.location(in: self.view)
            if let location = curLocation {
                let offset = UIOffset(horizontal: 20, vertical: 20)
                attachment = UIAttachmentBehavior(item: blueBox, offsetFromCenter: offset, attachedToAnchor: location)
            }
            if let attach = attachment {
                animator?.addBehavior(attach)
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        curLocation = touches.first!.location(in: self.view)
        attachment?.anchorPoint = curLocation!
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        animator?.removeBehavior(attachment!)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
        //사용자 정의 뷰를 생성
        let myView = GravityView()
        myView.frame = UIScreen.main.bounds
        self.view.addSubview(myView)
        
        myView.squareView.backgroundColor = UIColor.yellow
        
        //중력 적용
        myView.animator.addBehavior(myView.gravity)
        
        //충돌 동작 생성
        let collision = UICollisionBehavior(items: [myView.squareView])
        collision.translatesReferenceBoundsIntoBoundary = true
        //충돌 적용
        myView.animator.addBehavior(collision)
        
        //아이템 동작
        let itemBehavior = UIDynamicItemBehavior(items: [myView.squareView])
        itemBehavior.elasticity = 0.8
        myView.animator.addBehavior(itemBehavior)
        */
        
        
        //snap 적용을 위한 초기화 작업
        /*
        square = UIView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        square?.backgroundColor = UIColor.gray
        view.addSubview(square!)
        animator = UIDynamicAnimator(referenceView: view)
        */
        
        blueBox = UIView(frame: CGRect(x: 10, y: 20, width: 80, height: 80))
        blueBox?.backgroundColor = UIColor.blue
        view.addSubview(blueBox!)
        
        redBox = UIView(frame: CGRect(x: 150, y: 20, width: 100, height: 100))
        redBox?.backgroundColor = UIColor.red
        view.addSubview(redBox!)
        
        animator = UIDynamicAnimator(referenceView: self.view)
        
        let gravity = UIGravityBehavior(items: [blueBox!, redBox!])
        let vector = CGVector(dx: 0.0, dy: 1.0)
        gravity.gravityDirection = vector
        animator?.addBehavior(gravity)
        
        let collision = UICollisionBehavior(items: [blueBox!, redBox!])
        collision.translatesReferenceBoundsIntoBoundary = true
        animator?.addBehavior(collision)
        
        let spring = UIDynamicItemBehavior(items: [blueBox!])
        spring.elasticity = 0.5
        animator?.addBehavior(spring)
        
        let boxAttach = UIAttachmentBehavior(item: blueBox!, attachedTo: redBox!)
        boxAttach.frequency = 4.0
        boxAttach.damping = 0.0
        animator?.addBehavior(boxAttach)
    }
    
    //터치가 종료되었을 때 호출되는 메소드
    /*
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if snap != nil {
            animator?.removeBehavior(snap!)
        }
        let touch = touches.first
        snap = UISnapBehavior(item: square!, snapTo: touch!.location(in: self.view))
        animator?.addBehavior(snap!)
    }
    */
}
