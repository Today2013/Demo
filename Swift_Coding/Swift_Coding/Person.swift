//
//  Person.swift
//  Swift_Coding
//
//  Created by TomatoPeter on 16/7/18.
//  Copyright © 2016年 ChenJianglin. All rights reserved.
//

import Foundation

struct Person {
    let firstName:String
    let lastName:String
    
    static func encode(person: Person) {
        let personClassObject = HelperClass(person: person)
        
        NSKeyedArchiver.archiveRootObject(personClassObject, toFile: HelperClass.path())
    }
    
    static func decode() -> Person? {
        let personClassObject = NSKeyedUnarchiver.unarchiveObjectWithFile(HelperClass.path()) as? HelperClass
        
        return personClassObject?.person
    }
    
}
//我们不能使这个结构体尊守NSCoding协议，但是我们可以在结构体当中增加一个类的定义，使这个类来遵守NSCoding协议：
extension Person{
    class HelperClass: NSObject,NSCoding {
        var person:Person?
        init(person:Person) {
            self.person = person
            super.init()
        }
        class func path()->String{
            let documentsPath = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true).first
            let path = documentsPath?.stringByAppendingString("/Person")
            return path!
        }
        
        required init?(coder aDecoder: NSCoder) {
            guard let firstName = aDecoder.decodeObjectForKey("firstName") as? String else {
                person = nil;
                super.init();
                return nil
            }
            guard let laseName = aDecoder.decodeObjectForKey("lastName") as? String else {
                person = nil;
                super.init();
                return nil
            }
            
            person = Person(firstName: firstName, lastName: laseName)
            
            super.init()
        }
        
        func encodeWithCoder(aCoder: NSCoder) {
            aCoder.encodeObject(person!.firstName, forKey: "firstName")
            aCoder.encodeObject(person!.lastName, forKey: "lastName")
        }
    }
}






