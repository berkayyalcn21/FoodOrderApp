//
//  DetailsEntity.swift
//  YemekSiparisApp
//
//  Created by Berkay on 7.09.2022.
//

import Foundation


class ProductDetails {
    
    var star: String?
    var desc: String?
    var prepareTime: String?
    
    init(star: String, desc: String, prepareTime: String) {
        self.star = star
        self.desc = desc
        self.prepareTime = prepareTime
    }
}


class ProductDetailsList {
    
    static var productList: [ProductDetails] = [
        ProductDetails(star: "4.8", desc: "Soğuk, buz gibi Ayran ile yemeğinizin tadını çıkarın.", prepareTime: "0 dk"),
        ProductDetails(star: "4.5", desc: "Çıtır çıtır sıcak baklava yemekten sonra keyfinizi yerine getirsin.", prepareTime: "2 dk"),
        ProductDetails(star: "4.2", desc: "Soğuk, buz gibi Fanta ile yemeğinizin tadını çıkarın.", prepareTime: "0 dk"),
        ProductDetails(star: "4.2", desc: "En iyi şekilde marine edilmiş Izgara Somonumuzun tadına baktınız mı? Doyurucu ve lezzeti ile ön plana çıkan somonun tadını kaçırmayın.", prepareTime: "35 dk"),
        ProductDetails(star: "3.8", desc: "Tavuk sevenlerin vazgeçemediği Izgara Tavuk, kömür ateşinde leziz bir tat.", prepareTime: "25 dk"),
        ProductDetails(star: "4.2", desc: "Yemek sonrası tatlı sevenlerin vazgeçemediği Kadayıf tatlısı, hemen tadına bak.", prepareTime: "20 dk"),
        ProductDetails(star: "5", desc: "Hiç kumda kahve içtiniz mi? Bu lezzeti kaçırmayın", prepareTime: "10 dk"),
        ProductDetails(star: "4.6", desc: "Yüksek kalite kıyma kullanarak Köfte konusunda iddalıyız. Doyurucu ve mükemmel bir tat.", prepareTime: "25 dk"),
        ProductDetails(star: "4.2", desc: "Lazanya sevenler toplansın, taze ve lezzetli bir lazanya yemek istiyorsan hemen sipariş ver.", prepareTime: "30 dk"),
        ProductDetails(star: "4.8", desc: "Sen hiç köfteli makarna yedin mi? Yemediysen özel sos ile hazırlanmış bu makarnayı tatmalısın...", prepareTime: "25 dk"),
        ProductDetails(star: "5", desc: "Italyanlar yanımızda halt etmiş, sen bir de bizim pizzamızın tadına bak.", prepareTime: "35 dk"),
        ProductDetails(star: "4.2", desc: "Su hayattır, bol bol su için.", prepareTime: "0 dk"),
        ProductDetails(star: "5", desc: "Fırın sütlat ile keyfine keyif kat, hemen sipariş ver.", prepareTime: "20 dk"),
        ProductDetails(star: "4.6", desc: "Taze ve mükemmel bir tat olan Tiramisu bu lezzeti kaçırma.", prepareTime: "20 dk")
    ]
}
