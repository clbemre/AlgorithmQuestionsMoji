import UIKit

class Node {
    var value:Int?
    var leftChild:Node?
    var rightChild:Node?
    
    static func getTestData() -> Node? {
            return Node()
    }
}

//  DispatchQueue(label: "", attributes: .concurrent) kullanılırsa daha hızlı sonuç elde edilebilir.
//  Ancak her döngüde yeni threadler oluşacağı için tutarsızlık yaşanabilir veya memory tükenebilir.
class TestBinarySearchTree {
     // Sol veya Sağ tarafta bir hata var ise bu değişkende tutulur.
    var isErrorGeneral: Bool = false

    // Her zaman tek bir tarafı kontrol eder, bittikten sonra diğer tarafa geçer.
    // Bunun için ağacın yüksekliğini bularak farklı bir çözüm üretme şansımız olabilir.
    func checkNodeForBinarySearch(node: Node?) -> Bool{
        if(isErrorGeneral){ // Herhangi birinde hata çıktığında metodun çalışması durdurulur.
            return false
        }
        
        var resultLeft: Bool = true
        var resultRight: Bool = true
        
        if(node?.value != nil) {
            if(node?.leftChild == nil){
                resultLeft = true;
                print("Left Child is nil")
            }else if ((node?.value!)! > (node?.leftChild!.value!)!){
                resultLeft = checkNodeForBinarySearch(node: node?.leftChild!)
                print("resultLeft \(resultLeft) Sayı: \(String(describing: node?.value!)) Solundaki: \((node?.leftChild?.value!)!)")
            } else {
                print("Result --> Error Left")
                resultLeft = false
                isErrorGeneral = true
            }
        
            if(node?.rightChild == nil){
                resultRight = true
                print("Right Child is nil")
         } else if ((node?.value!)! < (node?.rightChild!.value!)!){
                resultRight = checkNodeForBinarySearch(node: node?.rightChild!)
                print("resultRight \(resultRight) Sayı: \(String(describing: node?.value!)) Sağındaki: \((node?.rightChild?.value!)!)")
            }else {
                print("Result --> Error Right")
                resultRight = false
                isErrorGeneral = true
            }
        }else {
            print("Root is Value nil")
            return true
        }
        return (resultLeft && resultRight)
    }
}

let nodeTestData: Node? = Node.getTestData()
let test = TestBinarySearchTree()
if(nodeTestData == nil){
    print("Root is nil")
} else {
let isError = test.checkNodeForBinarySearch(node: nodeTestData)
if(isError){
    print("Good - No Error")
} else {
    print("Error")
}
}
