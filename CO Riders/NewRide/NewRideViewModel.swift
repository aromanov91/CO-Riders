//
//  NewRideViewModel.swift
//  CO Riders
//
//  Created by 18391981 on 24.07.2020.
//  Copyright © 2020 romanov. All rights reserved.
//

import Foundation

class NewRideViewModel: ObservableObject {
    
    @Published var category: String?
    
    @Published var mountain: String?
    
    var categories = ["В горах", "На воде", "Городские виды спорта", "Здоровье", "Гастрономия", "Для детей", "Продажа оборудования"]
    
    
    var subCategories = [
        
        ["Трекинг и походы",
         "МТБ",
         "Экскурсии",
         "Сноуборд",
         "Мото"],
        
        ["Серфинг",
         "SUP",
         "Кайт",
         "Винд-серфинг",
         "Яхтинг"],
        
        ["Велосипед",
         "Скейт",
         "Бег"],
        
        ["Йога",
         "Массаж",
         "Бассейны",
         "Бани"],
        
        ["Фермы и производства",
         "Кафе и рестораны"],
        
        ["???"],
        
        ["Трекинг и походы",
         "МТБ",
         "Экскурсии",
         "Сноуборд",
         "Мото",
         "Серфинг",
         "SUP",
         "Кайт",
         "Винд-серфинг",
         "Яхтинг",
         "Велосипед",
         "Скейт",
         "Йога"]
    ]
    
    
    
    //    var mountains = ["Трекинг и походы",
    //                     "МТБ",
    //                     "Экскурсии",
    //                     "Сноуборд",
    //                     "Мото"]
    //
    //    var onWater = ["Серфинг",
    //                   "SUP",
    //                   "Кайт",
    //                   "Винд-серфинг",
    //                   "Яхтинг"]
    //
    //    var urbanSports = ["Велосипед",
    //                       "Скейт",
    //                       "Бег"]
    //
    //    var health = [
    //        "Йога",
    //        "Массаж",
    //        "Бассейны",
    //        "Бани"]
    //
    //    var gastronomy = ["Фермы и производства",
    //                 "Кафе и рестораны"]
    //
    //    var equipmentSales = ["Трекинг и походы",
    //                          "МТБ",
    //                          "Экскурсии",
    //                          "Сноуборд",
    //                          "Мото",
    //                          "Серфинг",
    //                          "SUP",
    //                          "Кайт",
    //                          "Винд-серфинг",
    //                          "Яхтинг",
    //                          "Велосипед",
    //                          "Скейт",
    //                          "Йога"]
    
}
