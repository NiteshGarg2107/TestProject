//
//  Result.swift


import Foundation
let kResultStatusKey: String = "status"
let kResultDataKey: String = "results"
let kResultMessageKey: String = "message"

public class BaseAPIModel {

  // MARK: Declaration for string constants to be used to decode and also serialize.

  // MARK: Properties
  public var status: Bool? = false
  public var data: JSON?
  public var message: String?

  // MARK: SwiftyJSON Initalizers
  /**
   Initates the instance based on the object
   - parameter object: The object of either Dictionary or Array kind that was passed.
   - returns: An initalized instance of the class.
  */
  convenience public init(object: Any) {
    self.init(json: JSON(object))
  }

  /**
   Initates the instance based on the JSON that was passed.
   - parameter json: JSON object from SwiftyJSON.
   - returns: An initalized instance of the class.
  */
  public init(json: JSON) {
    status = json[kResultStatusKey].boolValue
    data = json[kResultDataKey]
    message = json[kResultMessageKey].string
  }

  /**
   Generates description of the object in the form of a NSDictionary.
   - returns: A Key value pair containing all valid values in the object.
  */
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = status { dictionary[kResultStatusKey] = value }
    if let value = message { dictionary[kResultMessageKey] = value }
    return dictionary
  }

}
