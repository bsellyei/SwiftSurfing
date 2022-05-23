//
// CouchAPI.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation
import Alamofire



open class CouchAPI {
    /**
     Add a new couch
     
     - parameter body: (body) Couch object that needs to be added 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func addCouch(body: APICouch, completion: @escaping ((_ data: Void?,_ error: Error?) -> Void)) {
        addCouchWithRequestBuilder(body: body).execute { (response, error) -> Void in
            if error == nil {
                completion((), error)
            } else {
                completion(nil, error)
            }
        }
    }


    /**
     Add a new couch
     - POST /couches
     - 
     
     - parameter body: (body) Couch object that needs to be added 

     - returns: RequestBuilder<Void> 
     */
    open class func addCouchWithRequestBuilder(body: APICouch) -> RequestBuilder<Void> {
        let path = "/couches"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters = JSONEncodingHelper.encodingParameters(forEncodableObject: body)

        let url = URLComponents(string: URLString)

        let requestBuilder: RequestBuilder<Void>.Type = SwaggerClientAPI.requestBuilderFactory.getNonDecodableBuilder()

        return requestBuilder.init(method: "POST", URLString: (url?.string ?? URLString), parameters: parameters, isBody: true)
    }

    /**
     Deletes a couch
     
     - parameter _id: (path) Couch id to delete 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func deleteCouch(_id: String, completion: @escaping ((_ data: Void?,_ error: Error?) -> Void)) {
        deleteCouchWithRequestBuilder(_id: _id).execute { (response, error) -> Void in
            if error == nil {
                completion((), error)
            } else {
                completion(nil, error)
            }
        }
    }


    /**
     Deletes a couch
     - DELETE /couches/{Id}
     - 
     
     - parameter _id: (path) Couch id to delete 

     - returns: RequestBuilder<Void> 
     */
    open class func deleteCouchWithRequestBuilder(_id: String) -> RequestBuilder<Void> {
        var path = "/couches/{Id}"
        let _idPreEscape = "\(_id)"
        let _idPostEscape = _idPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        path = path.replacingOccurrences(of: "{Id}", with: _idPostEscape, options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        
        let url = URLComponents(string: URLString)

        let requestBuilder: RequestBuilder<Void>.Type = SwaggerClientAPI.requestBuilderFactory.getNonDecodableBuilder()

        return requestBuilder.init(method: "DELETE", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     Find all couch by city excluding userId's couch
     
     - parameter cityName: (path) name of a city 
     - parameter userId: (path) userId whose couches need to be excluded 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func findAllCouchByCityExceptUserId(cityName: String, userId: String, completion: @escaping ((_ data: [APICouch]?,_ error: Error?) -> Void)) {
        findAllCouchByCityExceptUserIdWithRequestBuilder(cityName: cityName, userId: userId).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }


    /**
     Find all couch by city excluding userId's couch
     - GET /couches/city/{cityName}/{userId}
     - 
     - examples: [{contentType=application/json, example={}}]
     
     - parameter cityName: (path) name of a city 
     - parameter userId: (path) userId whose couches need to be excluded 

     - returns: RequestBuilder<[APICouch]> 
     */
    open class func findAllCouchByCityExceptUserIdWithRequestBuilder(cityName: String, userId: String) -> RequestBuilder<[APICouch]> {
        var path = "/couches/city/{cityName}/{userId}"
        let cityNamePreEscape = "\(cityName)"
        let cityNamePostEscape = cityNamePreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        path = path.replacingOccurrences(of: "{cityName}", with: cityNamePostEscape, options: .literal, range: nil)
        let userIdPreEscape = "\(userId)"
        let userIdPostEscape = userIdPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        path = path.replacingOccurrences(of: "{userId}", with: userIdPostEscape, options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        
        let url = URLComponents(string: URLString)

        let requestBuilder: RequestBuilder<[APICouch]>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     Find all couch for user
     
     - parameter userId: (path) ID of user whose couches to return 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func findAllCouchForUser(userId: String, completion: @escaping ((_ data: [APICouch]?,_ error: Error?) -> Void)) {
        findAllCouchForUserWithRequestBuilder(userId: userId).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }


    /**
     Find all couch for user
     - GET /couches/user/{userId}
     - 
     - examples: [{contentType=application/json, example={}}]
     
     - parameter userId: (path) ID of user whose couches to return 

     - returns: RequestBuilder<[APICouch]> 
     */
    open class func findAllCouchForUserWithRequestBuilder(userId: String) -> RequestBuilder<[APICouch]> {
        var path = "/couches/user/{userId}"
        let userIdPreEscape = "\(userId)"
        let userIdPostEscape = userIdPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        path = path.replacingOccurrences(of: "{userId}", with: userIdPostEscape, options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        
        let url = URLComponents(string: URLString)

        let requestBuilder: RequestBuilder<[APICouch]>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     Find couch by ID
     
     - parameter _id: (path) ID of couch to return 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func getCouchById(_id: String, completion: @escaping ((_ data: APICouch?,_ error: Error?) -> Void)) {
        getCouchByIdWithRequestBuilder(_id: _id).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }


    /**
     Find couch by ID
     - GET /couches/{Id}
     - Returns a single couch
     - examples: [{contentType=application/json, example={"empty": false}}]
     
     - parameter _id: (path) ID of couch to return 

     - returns: RequestBuilder<APICouch> 
     */
    open class func getCouchByIdWithRequestBuilder(_id: String) -> RequestBuilder<APICouch> {
        var path = "/couches/{Id}"
        let _idPreEscape = "\(_id)"
        let _idPostEscape = _idPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        path = path.replacingOccurrences(of: "{Id}", with: _idPostEscape, options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        
        let url = URLComponents(string: URLString)

        let requestBuilder: RequestBuilder<APICouch>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

}
