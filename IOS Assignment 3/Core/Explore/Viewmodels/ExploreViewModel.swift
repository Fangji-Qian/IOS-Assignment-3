//
//  ExploreViewModel.swift
//  IOS Assignment 3
//
//  Created by 李昌霖 on 13/5/2024.
//

import Foundation


class ExploreViewModel: ObservableObject {
    
    @Published var brand: [Brand] = [
        Brand(id: UUID().uuidString, brandName: "HOLDEN", imageName: "Holden", carIds: []),
        Brand(id: UUID().uuidString, brandName: "AUDI", imageName: "Audi", carIds: []),
        Brand(id: UUID().uuidString, brandName: "BENTLEY", imageName: "Bentley", carIds: []),
        Brand(id: UUID().uuidString, brandName: "BMW", imageName: "BMW", carIds: []),
        Brand(id: UUID().uuidString, brandName: "VOLKS", imageName: "Volks", carIds: []),
        Brand(id: UUID().uuidString, brandName: "LINCOLN", imageName: "Lincoln", carIds: []),
        Brand(id: UUID().uuidString, brandName: "FORD", imageName: "Ford", carIds: [])
    ]
    
    @Published var cars: [Car] = [
        
        
        
        
        Car(id: UUID().uuidString, carName: "BMW 440i", rating: 4.7, brand: "BMW", pricePerDay: 300, description: "Very nice car with a turbocharged six-cylinder engine that delivers up to 333 horsepower.", mainImageName: "BMW_1_1", imagesNames: ["BMW_1_1", "BMW_1_2","BMW_1_3"], insurance: "1 year accident insurance", numberOfSeats: 4, numberOfDoors: 4, GasType: "91#", hostName: "Peter Griffin", hostImageName: "Host_1", hostJoinDate: "1/Apr/2024", isFavorite: true),
        
        Car(id: UUID().uuidString, carName: "Holden Commodore", rating: 4.4, brand: "HOLDEN", pricePerDay: 200, description: "Strong engine power!", mainImageName: "Holden_1_1", imagesNames: ["Holden_1_1", "Holden_1_2", "Holden_1_3"], insurance: "No Insurance", numberOfSeats: 2, numberOfDoors: 2, GasType: "92#", hostName: "Trevor Philips", hostImageName: "Host_2", hostJoinDate: "5/Feb/2024", isFavorite: false),
        
        Car(id: UUID().uuidString, carName: "Holden Colorado", rating: 4.6, brand: "HOLDEN", pricePerDay: 225, description: "A nice and confortable car", mainImageName: "Holden_2_1", imagesNames: ["Holden_2_1","Holden_2_2","Holden_2_3","Holden_2_4"], insurance: "1 year accident insurance", numberOfSeats: 2, numberOfDoors: 2, GasType: "91#", hostName: "Bob Ross", hostImageName: "Host_3", hostJoinDate: "13/Feb/2024", isFavorite: false),
    
        Car(id: UUID().uuidString, carName: "Audi A3", rating: 4.6, brand: "AUDI", pricePerDay: 250, description: "Classic and comfortable sedan", mainImageName: "Audi_1_1", imagesNames: ["Audi_1_1","Audi_1_2","Audi1_3","Audi_1_4","Audi_1_5"], insurance: "4 years accident insurance", numberOfSeats: 4, numberOfDoors: 4, GasType: "97#", hostName: "Count Dooku", hostImageName: "Host_4", hostJoinDate: "7/Mar/2024", isFavorite: true),
    
        Car(id: UUID().uuidString, carName: "Audi Q5", rating: 4.7, brand: "AUDI", pricePerDay: 300, description: "A very good and confortable SUV.", mainImageName: "Audi_2_1", imagesNames: ["Audi_2_1","Audi_2_2","Audi_2_3"], insurance: "1 year accident insurance", numberOfSeats: 4, numberOfDoors: 4, GasType: "97#", hostName: "Montgomery Scott", hostImageName: "Host_5", hostJoinDate: "25/Feb/2024", isFavorite: false),
    
        Car(id: UUID().uuidString, carName: "Bentley Continental GT S", rating: 4.8, brand: "BENTLEY", pricePerDay: 400, description: "A luxury sports car with a powerful and the world's shortest 2-cylinder, 6-liter twin-turbo engine.", mainImageName: "Bentley_1_1", imagesNames: ["Bentley_1_1","Bentley_1_2","Bentley_1_3","Bentley_1_4"], insurance: "5 years accident insurance", numberOfSeats: 4, numberOfDoors: 4, GasType: "95#", hostName: "John English", hostImageName: "Host_6", hostJoinDate: "10/May/2024", isFavorite: true),
        
        Car(id: UUID().uuidString, carName: "Bentley Continental GTC V8", rating: 4.8, brand: "BENTLEY", pricePerDay: 450, description: "Very classical and good looking limousine", mainImageName: "Bentley_2_1", imagesNames: ["Bentley_2_1","Bentley_2_2","Bentley_2_3","Bentley_2_4"], insurance: "Very classical and good looking car", numberOfSeats: 2, numberOfDoors: 2, GasType: "97#", hostName: "Leonard H. McCoy", hostImageName: "Host_7", hostJoinDate: "26/Jan/2024", isFavorite: true),
    
        Car(id: UUID().uuidString, carName: "BMW X5", rating: 4.6, brand: "BMW", pricePerDay: 250, description: "Very comfortable high-level SUV", mainImageName: "BMW_2_1", imagesNames: ["BMW_2_1","BMW_2_2","BMW_2_3"], insurance: "2 year accident insurance", numberOfSeats: 6, numberOfDoors: 4, GasType: "95#", hostName: "Obi-Wan Kenobi", hostImageName: "Host_8", hostJoinDate: "8/Apr/2024", isFavorite: false),

        Car(id: UUID().uuidString, carName: "Volks Golf R333", rating: 4.5, brand: "VOLKS", pricePerDay: 200, description: "Fast accelerating car with plenty of power", mainImageName: "Volks_1_1", imagesNames: ["Volks_1_1","Volks_1_2","Volks_1_3"], insurance: "No insurance", numberOfSeats: 4, numberOfDoors: 4, GasType: "93#", hostName: "General Grievous", hostImageName: "Host_9", hostJoinDate: "15/Mar/2024", isFavorite: false),
        
        Car(id: UUID().uuidString, carName: "Volks Tiguan", rating: 4.7, brand: "VOLKS", pricePerDay: 300, description: "Very gooood SUV", mainImageName: "Volks_2_1", imagesNames: ["Volks_2_1","Volks_2_2","Volks_2_3"], insurance: "Half year accident insurance", numberOfSeats: 4, numberOfDoors: 4, GasType: "91#", hostName: "Sheev Palpatine", hostImageName: "Host_10", hostJoinDate: "30/Jan/2024", isFavorite: false),
        
        Car(id: UUID().uuidString, carName: "Lincoln Navigator", rating: 5.0, brand: "LINCOLN", pricePerDay: 400, description: "", mainImageName: "Lincoln_1_1", imagesNames: ["Lincoln_1_1","Lincoln_1_2","Lincoln_1_3"], insurance: "4 years accident insurance", numberOfSeats: 4, numberOfDoors: 4, GasType: "95#", hostName: "Spock S'chn T'gai", hostImageName: "Host_11", hostJoinDate: "29/Feb/2024", isFavorite: false),
        
        Car(id: UUID().uuidString, carName: "Lincoln MKT Strentch", rating: 5.0, brand: "LINCOLN", pricePerDay: 500, description: "A luxury sedan for the ultimate in enjoyment", mainImageName: "Lincoln_2_1", imagesNames: ["Lincoln_2_1","Lincoln_2_2","Lincoln_2_3","Lincoln_2_4","Lincoln_2_5","Lincoln_2_6"], insurance: "5 years accident insurance", numberOfSeats: 8, numberOfDoors: 4, GasType: "95#", hostName: "James T Kirk", hostImageName: "Host_12", hostJoinDate: "9/Apr/2024", isFavorite: true),
        
        Car(id: UUID().uuidString, carName: "Ford Ranger Raptor", rating: 4.8, brand: "FORD", pricePerDay: 200, description: "Near-perfect off-road vehicle for the ultimate off-road experience", mainImageName: "Ford_1_1", imagesNames: ["Ford_1_1","Ford_1_2","Ford_1_3"], insurance: "1 year insurance", numberOfSeats: 4, numberOfDoors: 4, GasType: "97#", hostName: "Anakin Skywalker", hostImageName: "Host_13", hostJoinDate: "16/Jun/2024", isFavorite: true),
        
        Car(id: UUID().uuidString, carName: "Ford Escape", rating: 4.6, brand: "FORD", pricePerDay: 200, description: "Great performance SUV.", mainImageName: "Ford_2_1", imagesNames: ["Ford_2_1","Ford_2_2","Ford_2_3"], insurance: "", numberOfSeats: 4, numberOfDoors: 4, GasType: "95#", hostName: "Jonathan Archer", hostImageName: "Host_14", hostJoinDate: "4/Feb/2024", isFavorite: false)
    ]
    
}
