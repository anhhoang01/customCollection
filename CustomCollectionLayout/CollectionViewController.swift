// Copyright 2017 Brightec
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import UIKit

class CollectionViewController: UIViewController {
    
    let contentCellIdentifier = "ContentCellIdentifier"
    
    @IBOutlet weak var collectionView: UICollectionView!
    let arrHour = ["00:00","00:30","01:00","01:30","02:00","02:30","03:00","03:30","04:00","04:30","05:00","05:30","06:00","07:00","07:30","08:00","08:00","08:30","09:00","09:30","10:00","10:30","11:00","11:30","12:00","12:30","13:30","14:00","14:30","15:00","15:30","16:00","16:30","17:00","17:30","18:00","18:30","19:00","19:30","20:00","20:30","21:00","21:30","22:00","22:30","23:00","23:30"]
    let arrDate = ["1","2","3","4","5","6","7"]
    
    var arrData = [Data(time: "1 - 00:00", color: .red, data: "booked"),
                   Data(time: "1 - 01:00", color: .red, data: "booked"),
                   Data(time: "2 - 11:30", color: .red, data: "booked"),
                   Data(time: "3 - 09:00", color: .red, data: "booked"),
                   Data(time: "4 - 14:00", color: .red, data: "booked"),
                   Data(time: "5 - 15:00", color: .red, data: "booked"),
                   Data(time: "6 - 10:30", color: .red, data: "booked"),
                   Data(time: "4 - 20:00", color: .red, data: "booked"),
                   Data(time: "2 - 23:30", color: .red, data: "booked"),
                   Data(time: "7 - 00:30", color: .red, data: "booked"),
                   Data(time: "2 - 18:00", color: .red, data: "booked")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(UINib(nibName: "ContentCollectionViewCell", bundle: nil),
                                forCellWithReuseIdentifier: contentCellIdentifier)
    }
    
}

// MARK: - UICollectionViewDataSource
extension CollectionViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return arrHour.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrDate.count + 1
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // swiftlint:disable force_cast
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: contentCellIdentifier,
                                                      for: indexPath) as! ContentCollectionViewCell
        
        cell.backgroundColor = indexPath.section % 2 != 0 ? UIColor(white: 242/255.0, alpha: 1.0) : .white
        
        switch indexPath.section {
        case 0:
            cell.time = ""
            cell.contentLabel.text = indexPath.row == 0 ? "" : arrDate[indexPath.row - 1]
        default:
            if indexPath.row == 0 {
                cell.time = ""
                cell.contentLabel.text = arrHour[indexPath.section - 1]
            } else {
                let time = "\(arrDate[indexPath.row - 1]) - \(arrHour[indexPath.section - 1])"
                cell.time = time
                cell.contentLabel.text = arrData.filter({$0.time == time}).first?.data
                cell.background.backgroundColor = arrData.filter({$0.time == time}).first?.color
            }
        }
        
        return cell
    }
    
}

// MARK: - UICollectionViewDelegate
extension CollectionViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
        print("->",indexPath.section)
        
    }
}

class Data: NSObject {
    var time = ""
    var color : UIColor = UIColor.red
    var data  = ""
    init(time: String, color: UIColor, data:String) {
        self.time = time
        self.color = color
        self.data = data
    }
}

