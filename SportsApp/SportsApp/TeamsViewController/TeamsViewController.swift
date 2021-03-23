//
//  TeamsViewController.swift
//  SportsApp
//
//  Created by Mahmoud Morsy on 23/03/2021.
//

import UIKit

class TeamDetailsViewController: UIViewController {

    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var stadiumNameLabel: UILabel!
    @IBOutlet weak var foundedYearLabel: UILabel!
    @IBOutlet weak var countryNameLabel: UILabel!
    @IBOutlet weak var leagueName: UILabel!
    @IBOutlet weak var teamNameLabel: UILabel!
    @IBOutlet weak var teamLogoImageView: UIImageView!
    @IBOutlet weak var stadiumImagView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        teamLogoImageView.image=UIImage(named: "teamLogo")
        stadiumImagView.image=UIImage(named: "studemImg")
       teamNameLabel.text="Arsenal"
        leagueName.text="English Primer League"
        countryNameLabel.text="England"
        foundedYearLabel.text="1892"
        stadiumNameLabel.text="Emiartes stadium"
        /*descriptionLabel.text="""
 Arsenal Football Club is a professional football club based in Islington, London, England that plays in the Premier League, the top flight of English football. The club has won 13 league titles (including one unbeaten title), a record 14 FA Cups, two League Cups, 16 FA Community Shields, the League Centenary Trophy, one European Cup Winners' Cup, and one Inter-Cities Fairs Cup.
        
        Arsenal was the first club from the South of England to join The Football League, in 1893, and they reached the First Division in 1904. Relegated only once, in 1913, they continue the; longest streak in the top division,[6] and have won the second-most top-flight matches in English football history.[7] In the 1930s, Arsenal won five League Championships and two FA Cups, and another FA Cup and two Championships after the war. In 1970–71, they won their first League and FA Cup Double. Between 1989 and 2005, they won five League titles and five FA Cups, including two more Doubles. They completed the 20th century with the highest average league position.[8]

        Herbert Chapman, who changed the fortunes of Arsenal forever, won the club its first silverware, and his legacy led the club to dominate the 1930s decade; Chapman, however, died of pneumonia in 1934, aged 55.He helped introduce the WM formation, floodlights, and shirt numbers;[9] he also added the white sleeves and brighter red to the club's jersey.[10] Arsène Wenger was the longest-serving manager and won the most trophies. He won a record seven FA Cups, and his title-winning team set an English record for the longest top-flight unbeaten league run at 49 games between 2003 and 2004,[11] receiving the nickname The Invincibles.

        In 1886 munitions workers at the Royal Arsenal in Woolwich founded the club as Dial Square.In 1913, the club crossed the city to Arsenal Stadium in Highbury, becoming close neighbours of Tottenham Hotspur, and creating the North London derby. In 2006, they moved to the nearby Emirates Stadium. In terms of revenue, Arsenal is the ninth highest-earning football club in the world, earned €487.6m in 2016–17 season.[12] Based on socia
 """
 */
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
