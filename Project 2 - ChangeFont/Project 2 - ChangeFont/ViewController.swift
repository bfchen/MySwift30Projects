//
//  ViewController.swift
//  Project 2 - ChangeFont
//
//  Created by KingyoWang on 17/2/25.
//  Copyright © 2017年 hp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    /*
     总结
      1、导入第三方字体步骤
        （1）下载.ttf文件
        （2）在info.plist中增加字体
        （3）找出字体对应的fontName, 使用
      2、数值和集合的互相转化
         set = Set(arr)
         arr = Array(set)
      3、集合的定义
         var set = Set<String>()
         需要说清楚集合装的元素？
      4、系统自带字体名字，systemFontString
     
     */
    
    
    let w = UIScreen.main.bounds.size.width
    let h = UIScreen.main.bounds.size.height
    var content : UILabel!
    var cFonts = ["~QxLNf", "JLiSu","~Qx~Ae"]
    var i = 0

    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.black
        
        let title = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: w, height: 60))
        title.text = "Customer Font"
        title.textColor = UIColor.white
        title.font = UIFont.systemFont(ofSize: 40)
        title.backgroundColor = UIColor.init(white: 0.1, alpha: 0.7)
        self.view.addSubview(title)
        
        content = UILabel.init(frame: CGRect.init(x: 50, y: 60, width: w-100, height: h-100))
        content.textColor = UIColor.white
        content.numberOfLines = 0
        self.view.addSubview(content)
        
        let btn = UIButton.init(type: UIButtonType.system)
        btn.frame = CGRect.init(x: (w-150)/2, y: h-150, width: 150, height: 150)
        btn.layer.cornerRadius = 75
        btn.backgroundColor = UIColor.yellow
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        btn.addTarget(self, action: #selector(changeFont), for: UIControlEvents.touchUpInside)
        btn.setTitle("change font", for: UIControlState.normal)
        self.view.addSubview(btn)
        
        let text = "    每天都盼望着，盼望着你的出现。犹新的记得：你总是很活泼，眼角总带笑，甚至觉得连天上那轮太阳都没有你耀眼。起初刚认识你，你总是害羞的和我说话，出于你的这种性格，我总是习惯性扭头默默地望着你，望着你发呆，望着你写作业，也总是会把你看红了脸，像极了熟透的苹果。起初，你不敢和我对视，只是匆匆的看我一眼，赶紧把头扭向一边，样子可爱极了。你也会娇嗔的让我转过头去，有时也会故作生气，板着脸一般正经的望着我。那句话说的可真对，认真的女孩儿特别可爱。我知道，你已经悄悄地，闯入到了我的心里。\n    记得一次，我吃完饭回来，竟发现你的双眼带有泪光。那一刹那，很清晰，我竟莫名的心酸，有种落泪的感觉。第一次体会到为别人而心痛的滋味。那个晚自习，我心不在焉，什么都没有听进去，总是用略带关心的语气问你为什么哭泣。而你什么都没有说，却自己骂自己，把手中的纸默默地撕成了粉碎。你知道吗？当时，我是多么心痛啊。我知道，在我莫名心痛的那一瞬间，我心里仅存的那点自我安慰也烟消云散，我终于，还是到底，喜欢上了你。下了大晚，对你道了一声晚安，魂不守舍的进了宿舍，第一次为一个人而难过，这种味道真的是好奇特，竟能左右我的心情。同学让一起去买东西，我也只是淡淡的说了一句，你们去吧，心累。一个人躺在床上，闭上眼，安安静静，耳机里林俊杰的《爱要怎么说出口》成了单曲循环，眼睛感觉有些痛，想必是落泪了吧，真是为你欢喜为你忧啊。"
        content.text = text
        content.font = UIFont.init(name: cFonts[0], size: 20)
    }
    
    
    func changeFont() {
        i += 1
        let j = i % 3
        content.font = UIFont.init(name: cFonts[j], size: 20)
    }

    
    func findThirdPartyFontName() {
        let systemFontString = "PingFangHK-Semibold,KohinoorTelugu-Light,PingFangTC-Semibold,HiraMinProN-W3,PingFangTC-Ultralight,Cochin-BoldItalic,DamascusSemiBold,KohinoorTelugu-Medium,MarkerFelt-Wide,TamilSangamMN-Bold,AvenirNextCondensed-Heavy,BodoniSvtyTwoITCTT-Book,AvenirNext-Heavy,HiraginoSans-W6,HelveticaNeue-Thin,AvenirNextCondensed-HeavyItalic,Courier-Oblique,Georgia-BoldItalic,PingFangSC-Regular,AvenirNext-MediumItalic,AppleSDGothicNeo-Regular,OriyaSangamMN,AmericanTypewriter-CondensedLight,AlNile,AppleSDGothicNeo-Medium,AppleSDGothicNeo-Light,HelveticaNeue-CondensedBlack,AvenirNext-Regular,PingFangSC-Light,Avenir-Medium,GillSans-Italic,SnellRoundhand,Arial-BoldItalicMT,EuphemiaUCAS-Bold,AvenirNextCondensed-Italic,Optima-BoldItalic,MalayalamSangamMN-Bold,Damascus,KohinoorTelugu-Regular,AvenirNextCondensed-DemiBoldItalic,GillSans-Light,EuphemiaUCAS,DevanagariSangamMN,Avenir-Oblique,PingFangHK-Thin,TimesNewRomanPSMT,PingFangTC-Regular,HoeflerText-BlackItalic,AppleSDGothicNeo-SemiBold,GillSans-SemiBoldItalic,Avenir-BlackOblique,AmericanTypewriter-CondensedBold,Noteworthy-Light,HelveticaNeue-Light,ArialHebrew-Light,HelveticaNeue-LightItalic,KohinoorBangla-Semibold,AppleSDGothicNeo-UltraLight,Cochin-Bold,DiwanMishafi,PingFangSC-Semibold,Baskerville-SemiBoldItalic,PingFangTC-Medium,GurmukhiMN-Bold,PingFangTC-Light,AcademyEngravedLetPlain,Futura-MediumItalic,GillSans-UltraBold,Thonburi-Light,AvenirNext-DemiBoldItalic,SnellRoundhand-Black,KannadaSangamMN,Helvetica-Oblique,MarkerFelt-Thin,TimesNewRomanPS-BoldMT,PartyLetPlain,AmericanTypewriter-Light,Trebuchet-BoldItalic,AvenirNext-UltraLight,Arial-ItalicMT,Courier,PingFangSC-Thin,Copperplate-Bold,Avenir-Roman,AvenirNextCondensed-UltraLightItalic,HelveticaNeue-Bold,Menlo-Italic,SinhalaSangamMN-Bold,PingFangHK-Medium,AlNile-Bold,TimesNewRomanPS-ItalicMT,TrebuchetMS,Palatino-Bold,HelveticaNeue-Medium,Cochin-Italic,Copperplate,HelveticaNeue-BoldItalic,AppleSDGothicNeo-Bold,Menlo-Bold,SavoyeLetPlain,AmericanTypewriter-Bold,GillSans-LightItalic,AvenirNextCondensed-Medium,Baskerville-SemiBold,AvenirNext-HeavyItalic,KohinoorDevanagari-Regular,AvenirNextCondensed-DemiBold,BodoniSvtyTwoOSITCTT-Bold,Verdana-Italic,Zapfino,GillSans-Bold,GillSans-SemiBold,ArialRoundedMTBold,ChalkboardSE-Regular,PingFangTC-Thin,Futura-CondensedMedium,Kailasa-Bold,HelveticaNeue-ThinItalic,Palatino-Italic,CourierNewPS-BoldMT,AvenirNextCondensed-Regular,CourierNewPS-ItalicMT,AppleSDGothicNeo-Thin,AvenirNext-UltraLightItalic,ChalkboardSE-Light,ArialMT,KohinoorBangla-Light,PingFangSC-Ultralight,DevanagariSangamMN-Bold,Avenir-BookOblique,AvenirNextCondensed-Bold,LaoSangamMN,ChalkboardSE-Bold,AvenirNextCondensed-BoldItalic,Baskerville-Italic,KohinoorDevanagari-Light,BradleyHandITCTT-Bold,EuphemiaUCAS-Italic,HoeflerText-Regular,Thonburi-Bold,Courier-Bold,HelveticaNeue,PingFangSC-Medium,Helvetica-LightOblique,TimesNewRomanPS-BoldItalicMT,Avenir-LightOblique,Cochin,Didot,Menlo-BoldItalic,Papyrus,MyanmarSangamMN-Bold,Noteworthy-Bold,AvenirNext-BoldItalic,Avenir-Book,Verdana-BoldItalic,AvenirNext-Medium,GillSans,Baskerville,CourierNewPS-BoldItalicMT,AmericanTypewriter,HelveticaNeue-UltraLightItalic,HiraMinProN-W6,Palatino-Roman,OriyaSangamMN-Bold,Baskerville-Bold,CourierNewPSMT,ZapfDingbatsITC,Georgia-Italic,GurmukhiMN,BodoniSvtyTwoITCTT-Bold,Didot-Bold,AvenirNextCondensed-UltraLight,Helvetica-Bold,AvenirNext-Bold,Verdana,AvenirNextCondensed-MediumItalic,AppleColorEmoji,Kailasa,GeezaPro-Bold,ArialHebrew,Georgia,TrebuchetMS-Italic,HoeflerText-Italic,AvenirNext-DemiBold,Chalkduster,DamascusLight,HelveticaNeue-MediumItalic,Futura-CondensedExtraBold,Helvetica-BoldOblique,DamascusMedium,KohinoorDevanagari-Semibold,AmericanTypewriter-Semibold,Avenir-MediumOblique,GujaratiSangamMN-Bold,Courier-BoldOblique,KhmerSangamMN,GeezaPro,KannadaSangamMN-Bold,ArialHebrew-Bold,Georgia-Bold,KohinoorBangla-Regular,PingFangHK-Regular,Optima-Italic,BodoniSvtyTwoSCITCTT-Book,TrebuchetMS-Bold,HoeflerText-Black,Papyrus-Condensed,MyanmarSangamMN,Arial-BoldMT,HelveticaNeue-UltraLight,Optima-Regular,SinhalaSangamMN,DamascusBold,Farah,TamilSangamMN,AvenirNext-Italic,GillSans-BoldItalic,HiraginoSans-W3,Didot-Italic,BodoniSvtyTwoOSITCTT-BookIt,PingFangHK-Ultralight,HelveticaNeue-CondensedBold,Avenir-HeavyOblique,AmericanTypewriter-Condensed,SnellRoundhand-Bold,Avenir-Heavy,Palatino-BoldItalic,Futura-Medium,BodoniSvtyTwoOSITCTT-Book,Avenir-Black,Symbol,Menlo-Regular,GujaratiSangamMN,BodoniOrnamentsITCTT,Thonburi,Avenir-Light,Verdana-Bold,HelveticaNeue-Italic,Futura-Bold,Copperplate-Light,PingFangHK-Light,Optima-ExtraBlack,MalayalamSangamMN,Baskerville-BoldItalic,Helvetica,Optima-Bold,Helvetica-Light,BodoniSvtyTwoITCTT-BookIta"
        let fontArr = systemFontString.components(separatedBy: ",")
        let set = Set(fontArr)
        let arr = UIFont.familyNames
        for name in arr {
            let fontNames = UIFont.fontNames(forFamilyName: name)
            for s in fontNames {
                if set.contains(s) {
                    continue
                }
                print(s)
            }
        }
    }
}

