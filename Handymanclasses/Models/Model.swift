//
//  Model.swift
//  Handymanclasses
//
//  Created by Nurillo Domlajonov on 06/10/23.
//

import Foundation

var informationOfApp = """
    "In our app you can find yourself or your friends an activity to your liking.
    We are engaged in leading different master classes in our studio and will be glad to teach you new skills and give you cool emotions at our training.
    In order to leave feedback in the application, we suggest you to set a nickname. You can change it in the settings at any time.

    When you sign up for master classes, you will need to provide your contact and name so that we can contact you in any way convenient for you. The application will not use your data for its personal purposes. They are only needed to contact you in case you want to sign up for a master class and clarify the details.
    We wish you to find an activity to your liking"

"""

struct FeedbackDatas{
    
    let desc: [String] = [
        "learn the basics of modeling, create craft dishes for your home and have a great time in a pleasant atmosphere.".uppercased(),
        "we will learn simple drawing techniques and shape taking, learn how to work with paints and pencil, show the basics of shadow perception.".uppercased(),
        "we will teach several knitting techniques, tell about the properties of different threads, knit something warm and pleasant to the body.".uppercased(),
        "we will teach you how to make a lot of crafts from paper, show how to properly construct the scheme of your own crafts, create a zoo of paper".uppercased(),
        "we will learn how to make beautiful decor from products, decorate dishes, learn basic techniques and learn how to use basic tools.".uppercased(),
        "we will cook dishes from different countries of the world, learn chef's secrets, taste our creations.".uppercased(),
        "we will collect fashion jewelry with our own hands, learn how to create additions to our clothes, we will understand the types of accessories.".uppercased(),
        "will show how to add something new to your home, teach techniques for creating simple home decorations, refresh old furniture.".uppercased(),
        "teach card tricks and more, work on sleight of hand and reveal the secrets of the most famous tricks.".uppercased(),
        "we'll learn techniques for expanding space, selecting colors for the house, discuss the combination of materials and create layouts of their ideal home spaces.".uppercased(),
        "learn how to make cards, scrapbooks, surprise letters and interactive books using everyday objects.".uppercased(),
        "we will teach modern marker drawing techniques, analyze palettes, and tell you how to choose quality sketching tools.".uppercased(),
        "understand woodcarving tools, teach basic techniques, create your own totem animal from wood, learn how to work on a lathe.".uppercased(),
        "we will fight with junk, teach to easily part with things, talk about ergonomics, show the techniques and lifehacks on the placement of things in space.".uppercased(),
        "we will look at clothing trends, basic elements of clothing decoration, consider simple designs and their combination, make a design of your own T-shirts.".uppercased(),
        "we'll show you the cleaning flyhacks, teach you how to deal with complicated dirt in the apartment, show you recipes for effective cleaning products, show you how to defeat laziness.".uppercased(),
        "make your own soap, learn how to create a combination of odors, get acquainted with the useful properties of oils and the impact of odors on humans".uppercased(),
    ]
    
    
    let title: [String] = [
        "Clay modeling",
        "Drawing",
        "Sewing",
        "Origami",
        "Carving",
        "Culinary Master Class",
        "Handmade jewelry",
        "Home decor with your own hands",
        "Magic tricks",
        "Interior Design",
        "Scrapbooking",
        "Sketching",
        "Woodcarving",
        "Space organization",
        "Clothes design",
        "Creating comfort and cleanliness",
        "Soap making",
    ]
    
    func getItems(index: Int)->String {
        title[index]
    }
    
    func getSize()->Int{
        title.count
    }
    
    func getDescriptions(index: Int)->String {
        desc[index].uppercased()
    }
}


struct Certificates {
    let large: String
    let small: String
}

struct CertificatesData{
    
    let certificates: [Certificates]  = [
        Certificates(large: "cc1", small: "c1"),
        Certificates(large: "cc2", small: "c2"),
        Certificates(large: "cc3", small: "c3"),
        Certificates(large: "cc4", small: "c4"),
        Certificates(large: "cc5", small: "c5"),
        Certificates(large: "cc6", small: "c6"),
        Certificates(large: "cc7", small: "c7"),
        Certificates(large: "cc8", small: "c8"),
        Certificates(large: "cc9", small: "c9"),
        Certificates(large: "cc10", small: "c10")
    ]
    
    func getCertificates(index: Int)->Certificates{
        return certificates[index]
    }
    
}
