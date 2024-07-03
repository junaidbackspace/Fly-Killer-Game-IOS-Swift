//
//  FlyKillerDB.swift
//  FlyKillerGame
//
//  Created by Naeem Abbas on 12/01/2024.

//  DBManager.swift

//
//  Created by Naeem Abbas on 20/12/2023.
//
import Foundation

struct ResponseResult {
    var Msg : String
    var code : Int
  
    
}
 
import Foundation

import SQLite3
struct DBManager {

    func createTable(query:String)->ResponseResult {
  
        var result = ResponseResult(Msg: "no record", code: -1)
        
      var createPointer: OpaquePointer?
        let db = createOrOpenDatabase()
      if sqlite3_prepare_v2(db, query, -1, &createPointer, nil) ==
          SQLITE_OK {
        
        if sqlite3_step(createPointer) == SQLITE_DONE {
            result.code = 1
            result.Msg = "Sucessfully Executed"
        } else {
            let  errMsg:String = String(cString: sqlite3_errmsg(db))
          
            result.code = 0
            result.Msg = errMsg
        }
      } else {
        print("\nCREATE TABLE statement is not prepared.")
      }
        
        
     
      sqlite3_finalize(createPointer)
        return result
    }

    
    //Opening connection with db
    //donot create directory
    func createOrOpenDatabase()->OpaquePointer?{
        let path = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("Flydatabase.sqlite").path
        
        var db:OpaquePointer?
        if sqlite3_open(path, &db) == SQLITE_OK{
           
            return db
        }
        else{
            print("returned nill")
            return nil
        }
    }
    
    //Reading Database
    func query(query : String)->[Fly] {
        let db = createOrOpenDatabase()
        var strct = [Fly]()
        
      var queryPointer: OpaquePointer?
      if sqlite3_prepare_v2( db,query,-1,&queryPointer,nil) == SQLITE_OK {
        print("\n")
        while (sqlite3_step(queryPointer) == SQLITE_ROW) {
          
           
            guard let queryResultCol1 = sqlite3_column_text(queryPointer, 1) else {
            print("Query result is nil.")
            return strct
          }
            guard let queryResultCol2 = sqlite3_column_text(queryPointer, 2) else {
            print("Query result is nil.")
            return strct
          }
            guard let queryResultCol3 = sqlite3_column_text(queryPointer, 3) else {
            print("Query result is nil.")
            return strct
          }
            guard let queryResultCol4 = sqlite3_column_text(queryPointer, 4) else {
            print("Query result is nil.")
            return strct
          }
           
            
 
           
        }
      } else {
          let errorMessage = String(cString: sqlite3_errmsg(db))
          print("\nQuery is not prepared \(errorMessage)")
      }
      sqlite3_finalize(queryPointer)
        return strct
    }
    
    func getFlyForLevel(level: String) -> [Fly] {
            var queryStatement: OpaquePointer?
            var fly = [Fly]()
            let db = createOrOpenDatabase()
            let queryString = "SELECT FLY, ISENEMY, SCORE FROM CUSTOMLEVEL WHERE LEVEL = ?;"

            if sqlite3_prepare_v2(db, queryString, -1, &queryStatement, nil) == SQLITE_OK {
                sqlite3_bind_text(queryStatement, 1, (level as NSString).utf8String, -1, nil)

                while sqlite3_step(queryStatement) == SQLITE_ROW {
                    let flyName = String(cString: sqlite3_column_text(queryStatement, 0))
                    //let price = String(cString: sqlite3_column_text(queryStatement, 1))
                    let score = String(cString: sqlite3_column_text(queryStatement, 2))
                    
                    fly.append( Fly(id: 0, name: flyName, price: "0", score: score))
                } 
            } else {
                print("SELECT statement could not be prepared")
            }

            sqlite3_finalize(queryStatement)
            return fly
        }

}
