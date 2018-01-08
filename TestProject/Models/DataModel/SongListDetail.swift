//
//  Results.swift
//
//  Created by User on 08/01/18
//  Copyright (c) . All rights reserved.
//

import Foundation

public class SongListDetail: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private let kResultsKindKey: String = "kind"
  private let kResultsTrackIdKey: String = "trackId"
  private let kResultsTrackHdPriceKey: String = "trackHdPrice"
  private let kResultsContentAdvisoryRatingKey: String = "contentAdvisoryRating"
  private let kResultsDiscCountKey: String = "discCount"
  private let kResultsIsStreamableKey: String = "isStreamable"
  private let kResultsArtworkUrl30Key: String = "artworkUrl30"
  private let kResultsArtworkUrl60Key: String = "artworkUrl60"
  private let kResultsPreviewUrlKey: String = "previewUrl"
  private let kResultsDiscNumberKey: String = "discNumber"
  private let kResultsTrackViewUrlKey: String = "trackViewUrl"
  private let kResultsCollectionCensoredNameKey: String = "collectionCensoredName"
  private let kResultsCollectionExplicitnessKey: String = "collectionExplicitness"
  private let kResultsArtworkUrl100Key: String = "artworkUrl100"
  private let kResultsCollectionArtistNameKey: String = "collectionArtistName"
  private let kResultsCurrencyKey: String = "currency"
  private let kResultsWrapperTypeKey: String = "wrapperType"
  private let kResultsTrackNumberKey: String = "trackNumber"
  private let kResultsCollectionViewUrlKey: String = "collectionViewUrl"
  private let kResultsCollectionNameKey: String = "collectionName"
  private let kResultsArtistNameKey: String = "artistName"
  private let kResultsTrackCensoredNameKey: String = "trackCensoredName"
  private let kResultsCollectionPriceKey: String = "collectionPrice"
  private let kResultsTrackCountKey: String = "trackCount"
  private let kResultsReleaseDateKey: String = "releaseDate"
  private let kResultsArtistIdKey: String = "artistId"
  private let kResultsPrimaryGenreNameKey: String = "primaryGenreName"
  private let kResultsTrackExplicitnessKey: String = "trackExplicitness"
  private let kResultsCollectionIdKey: String = "collectionId"
  private let kResultsTrackNameKey: String = "trackName"
  private let kResultsTrackHdRentalPriceKey: String = "trackHdRentalPrice"
  private let kResultsHasITunesExtrasKey: String = "hasITunesExtras"
  private let kResultsCollectionHdPriceKey: String = "collectionHdPrice"
  private let kResultsTrackRentalPriceKey: String = "trackRentalPrice"
  private let kResultsTrackPriceKey: String = "trackPrice"
  private let kResultsArtistViewUrlKey: String = "artistViewUrl"
  private let kResultsTrackTimeMillisKey: String = "trackTimeMillis"
  private let kResultsCountryKey: String = "country"

  // MARK: Properties
  public var kind: String?
  public var trackId: Int?
  public var trackHdPrice: Float?
  public var contentAdvisoryRating: String?
  public var discCount: Int?
  public var isStreamable: Bool = false
  public var artworkUrl30: String?
  public var artworkUrl60: String?
  public var previewUrl: String?
  public var discNumber: Int?
  public var trackViewUrl: String?
  public var collectionCensoredName: String?
  public var collectionExplicitness: String?
  public var artworkUrl100: String?
  public var collectionArtistName: String?
  public var currency: String?
  public var wrapperType: String?
  public var trackNumber: Int?
  public var collectionViewUrl: String?
  public var collectionName: String?
  public var artistName: String?
  public var trackCensoredName: String?
  public var collectionPrice: Float?
  public var trackCount: Int?
  public var releaseDate: String?
  public var artistId: Int?
  public var primaryGenreName: String?
  public var trackExplicitness: String?
  public var collectionId: Int?
  public var trackName: String?
  public var trackHdRentalPrice: Float?
  public var hasITunesExtras: Bool = false
  public var collectionHdPrice: Float?
  public var trackRentalPrice: Float?
  public var trackPrice: Float?
  public var artistViewUrl: String?
  public var trackTimeMillis: Int?
  public var country: String?

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
    kind = json[kResultsKindKey].string
    trackId = json[kResultsTrackIdKey].int
    trackHdPrice = json[kResultsTrackHdPriceKey].float
    contentAdvisoryRating = json[kResultsContentAdvisoryRatingKey].string
    discCount = json[kResultsDiscCountKey].int
    isStreamable = json[kResultsIsStreamableKey].boolValue
    artworkUrl30 = json[kResultsArtworkUrl30Key].string
    artworkUrl60 = json[kResultsArtworkUrl60Key].string
    previewUrl = json[kResultsPreviewUrlKey].string
    discNumber = json[kResultsDiscNumberKey].int
    trackViewUrl = json[kResultsTrackViewUrlKey].string
    collectionCensoredName = json[kResultsCollectionCensoredNameKey].string
    collectionExplicitness = json[kResultsCollectionExplicitnessKey].string
    artworkUrl100 = json[kResultsArtworkUrl100Key].string
    collectionArtistName = json[kResultsCollectionArtistNameKey].string
    currency = json[kResultsCurrencyKey].string
    wrapperType = json[kResultsWrapperTypeKey].string
    trackNumber = json[kResultsTrackNumberKey].int
    collectionViewUrl = json[kResultsCollectionViewUrlKey].string
    collectionName = json[kResultsCollectionNameKey].string
    artistName = json[kResultsArtistNameKey].string
    trackCensoredName = json[kResultsTrackCensoredNameKey].string
    collectionPrice = json[kResultsCollectionPriceKey].float
    trackCount = json[kResultsTrackCountKey].int
    releaseDate = json[kResultsReleaseDateKey].string
    artistId = json[kResultsArtistIdKey].int
    primaryGenreName = json[kResultsPrimaryGenreNameKey].string
    trackExplicitness = json[kResultsTrackExplicitnessKey].string
    collectionId = json[kResultsCollectionIdKey].int
    trackName = json[kResultsTrackNameKey].string
    trackHdRentalPrice = json[kResultsTrackHdRentalPriceKey].float
    hasITunesExtras = json[kResultsHasITunesExtrasKey].boolValue
    collectionHdPrice = json[kResultsCollectionHdPriceKey].float
    trackRentalPrice = json[kResultsTrackRentalPriceKey].float
    trackPrice = json[kResultsTrackPriceKey].float
    artistViewUrl = json[kResultsArtistViewUrlKey].string
    trackTimeMillis = json[kResultsTrackTimeMillisKey].int
    country = json[kResultsCountryKey].string
  }

  /**
   Generates description of the object in the form of a NSDictionary.
   - returns: A Key value pair containing all valid values in the object.
  */
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = kind { dictionary[kResultsKindKey] = value }
    if let value = trackId { dictionary[kResultsTrackIdKey] = value }
    if let value = trackHdPrice { dictionary[kResultsTrackHdPriceKey] = value }
    if let value = contentAdvisoryRating { dictionary[kResultsContentAdvisoryRatingKey] = value }
    if let value = discCount { dictionary[kResultsDiscCountKey] = value }
    dictionary[kResultsIsStreamableKey] = isStreamable
    if let value = artworkUrl30 { dictionary[kResultsArtworkUrl30Key] = value }
    if let value = artworkUrl60 { dictionary[kResultsArtworkUrl60Key] = value }
    if let value = previewUrl { dictionary[kResultsPreviewUrlKey] = value }
    if let value = discNumber { dictionary[kResultsDiscNumberKey] = value }
    if let value = trackViewUrl { dictionary[kResultsTrackViewUrlKey] = value }
    if let value = collectionCensoredName { dictionary[kResultsCollectionCensoredNameKey] = value }
    if let value = collectionExplicitness { dictionary[kResultsCollectionExplicitnessKey] = value }
    if let value = artworkUrl100 { dictionary[kResultsArtworkUrl100Key] = value }
    if let value = collectionArtistName { dictionary[kResultsCollectionArtistNameKey] = value }
    if let value = currency { dictionary[kResultsCurrencyKey] = value }
    if let value = wrapperType { dictionary[kResultsWrapperTypeKey] = value }
    if let value = trackNumber { dictionary[kResultsTrackNumberKey] = value }
    if let value = collectionViewUrl { dictionary[kResultsCollectionViewUrlKey] = value }
    if let value = collectionName { dictionary[kResultsCollectionNameKey] = value }
    if let value = artistName { dictionary[kResultsArtistNameKey] = value }
    if let value = trackCensoredName { dictionary[kResultsTrackCensoredNameKey] = value }
    if let value = collectionPrice { dictionary[kResultsCollectionPriceKey] = value }
    if let value = trackCount { dictionary[kResultsTrackCountKey] = value }
    if let value = releaseDate { dictionary[kResultsReleaseDateKey] = value }
    if let value = artistId { dictionary[kResultsArtistIdKey] = value }
    if let value = primaryGenreName { dictionary[kResultsPrimaryGenreNameKey] = value }
    if let value = trackExplicitness { dictionary[kResultsTrackExplicitnessKey] = value }
    if let value = collectionId { dictionary[kResultsCollectionIdKey] = value }
    if let value = trackName { dictionary[kResultsTrackNameKey] = value }
    if let value = trackHdRentalPrice { dictionary[kResultsTrackHdRentalPriceKey] = value }
    dictionary[kResultsHasITunesExtrasKey] = hasITunesExtras
    if let value = collectionHdPrice { dictionary[kResultsCollectionHdPriceKey] = value }
    if let value = trackRentalPrice { dictionary[kResultsTrackRentalPriceKey] = value }
    if let value = trackPrice { dictionary[kResultsTrackPriceKey] = value }
    if let value = artistViewUrl { dictionary[kResultsArtistViewUrlKey] = value }
    if let value = trackTimeMillis { dictionary[kResultsTrackTimeMillisKey] = value }
    if let value = country { dictionary[kResultsCountryKey] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.kind = aDecoder.decodeObject(forKey: kResultsKindKey) as? String
    self.trackId = aDecoder.decodeObject(forKey: kResultsTrackIdKey) as? Int
    self.trackHdPrice = aDecoder.decodeObject(forKey: kResultsTrackHdPriceKey) as? Float
    self.contentAdvisoryRating = aDecoder.decodeObject(forKey: kResultsContentAdvisoryRatingKey) as? String
    self.discCount = aDecoder.decodeObject(forKey: kResultsDiscCountKey) as? Int
    self.isStreamable = aDecoder.decodeBool(forKey: kResultsIsStreamableKey)
    self.artworkUrl30 = aDecoder.decodeObject(forKey: kResultsArtworkUrl30Key) as? String
    self.artworkUrl60 = aDecoder.decodeObject(forKey: kResultsArtworkUrl60Key) as? String
    self.previewUrl = aDecoder.decodeObject(forKey: kResultsPreviewUrlKey) as? String
    self.discNumber = aDecoder.decodeObject(forKey: kResultsDiscNumberKey) as? Int
    self.trackViewUrl = aDecoder.decodeObject(forKey: kResultsTrackViewUrlKey) as? String
    self.collectionCensoredName = aDecoder.decodeObject(forKey: kResultsCollectionCensoredNameKey) as? String
    self.collectionExplicitness = aDecoder.decodeObject(forKey: kResultsCollectionExplicitnessKey) as? String
    self.artworkUrl100 = aDecoder.decodeObject(forKey: kResultsArtworkUrl100Key) as? String
    self.collectionArtistName = aDecoder.decodeObject(forKey: kResultsCollectionArtistNameKey) as? String
    self.currency = aDecoder.decodeObject(forKey: kResultsCurrencyKey) as? String
    self.wrapperType = aDecoder.decodeObject(forKey: kResultsWrapperTypeKey) as? String
    self.trackNumber = aDecoder.decodeObject(forKey: kResultsTrackNumberKey) as? Int
    self.collectionViewUrl = aDecoder.decodeObject(forKey: kResultsCollectionViewUrlKey) as? String
    self.collectionName = aDecoder.decodeObject(forKey: kResultsCollectionNameKey) as? String
    self.artistName = aDecoder.decodeObject(forKey: kResultsArtistNameKey) as? String
    self.trackCensoredName = aDecoder.decodeObject(forKey: kResultsTrackCensoredNameKey) as? String
    self.collectionPrice = aDecoder.decodeObject(forKey: kResultsCollectionPriceKey) as? Float
    self.trackCount = aDecoder.decodeObject(forKey: kResultsTrackCountKey) as? Int
    self.releaseDate = aDecoder.decodeObject(forKey: kResultsReleaseDateKey) as? String
    self.artistId = aDecoder.decodeObject(forKey: kResultsArtistIdKey) as? Int
    self.primaryGenreName = aDecoder.decodeObject(forKey: kResultsPrimaryGenreNameKey) as? String
    self.trackExplicitness = aDecoder.decodeObject(forKey: kResultsTrackExplicitnessKey) as? String
    self.collectionId = aDecoder.decodeObject(forKey: kResultsCollectionIdKey) as? Int
    self.trackName = aDecoder.decodeObject(forKey: kResultsTrackNameKey) as? String
    self.trackHdRentalPrice = aDecoder.decodeObject(forKey: kResultsTrackHdRentalPriceKey) as? Float
    self.hasITunesExtras = aDecoder.decodeBool(forKey: kResultsHasITunesExtrasKey)
    self.collectionHdPrice = aDecoder.decodeObject(forKey: kResultsCollectionHdPriceKey) as? Float
    self.trackRentalPrice = aDecoder.decodeObject(forKey: kResultsTrackRentalPriceKey) as? Float
    self.trackPrice = aDecoder.decodeObject(forKey: kResultsTrackPriceKey) as? Float
    self.artistViewUrl = aDecoder.decodeObject(forKey: kResultsArtistViewUrlKey) as? String
    self.trackTimeMillis = aDecoder.decodeObject(forKey: kResultsTrackTimeMillisKey) as? Int
    self.country = aDecoder.decodeObject(forKey: kResultsCountryKey) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(kind, forKey: kResultsKindKey)
    aCoder.encode(trackId, forKey: kResultsTrackIdKey)
    aCoder.encode(trackHdPrice, forKey: kResultsTrackHdPriceKey)
    aCoder.encode(contentAdvisoryRating, forKey: kResultsContentAdvisoryRatingKey)
    aCoder.encode(discCount, forKey: kResultsDiscCountKey)
    aCoder.encode(isStreamable, forKey: kResultsIsStreamableKey)
    aCoder.encode(artworkUrl30, forKey: kResultsArtworkUrl30Key)
    aCoder.encode(artworkUrl60, forKey: kResultsArtworkUrl60Key)
    aCoder.encode(previewUrl, forKey: kResultsPreviewUrlKey)
    aCoder.encode(discNumber, forKey: kResultsDiscNumberKey)
    aCoder.encode(trackViewUrl, forKey: kResultsTrackViewUrlKey)
    aCoder.encode(collectionCensoredName, forKey: kResultsCollectionCensoredNameKey)
    aCoder.encode(collectionExplicitness, forKey: kResultsCollectionExplicitnessKey)
    aCoder.encode(artworkUrl100, forKey: kResultsArtworkUrl100Key)
    aCoder.encode(collectionArtistName, forKey: kResultsCollectionArtistNameKey)
    aCoder.encode(currency, forKey: kResultsCurrencyKey)
    aCoder.encode(wrapperType, forKey: kResultsWrapperTypeKey)
    aCoder.encode(trackNumber, forKey: kResultsTrackNumberKey)
    aCoder.encode(collectionViewUrl, forKey: kResultsCollectionViewUrlKey)
    aCoder.encode(collectionName, forKey: kResultsCollectionNameKey)
    aCoder.encode(artistName, forKey: kResultsArtistNameKey)
    aCoder.encode(trackCensoredName, forKey: kResultsTrackCensoredNameKey)
    aCoder.encode(collectionPrice, forKey: kResultsCollectionPriceKey)
    aCoder.encode(trackCount, forKey: kResultsTrackCountKey)
    aCoder.encode(releaseDate, forKey: kResultsReleaseDateKey)
    aCoder.encode(artistId, forKey: kResultsArtistIdKey)
    aCoder.encode(primaryGenreName, forKey: kResultsPrimaryGenreNameKey)
    aCoder.encode(trackExplicitness, forKey: kResultsTrackExplicitnessKey)
    aCoder.encode(collectionId, forKey: kResultsCollectionIdKey)
    aCoder.encode(trackName, forKey: kResultsTrackNameKey)
    aCoder.encode(trackHdRentalPrice, forKey: kResultsTrackHdRentalPriceKey)
    aCoder.encode(hasITunesExtras, forKey: kResultsHasITunesExtrasKey)
    aCoder.encode(collectionHdPrice, forKey: kResultsCollectionHdPriceKey)
    aCoder.encode(trackRentalPrice, forKey: kResultsTrackRentalPriceKey)
    aCoder.encode(trackPrice, forKey: kResultsTrackPriceKey)
    aCoder.encode(artistViewUrl, forKey: kResultsArtistViewUrlKey)
    aCoder.encode(trackTimeMillis, forKey: kResultsTrackTimeMillisKey)
    aCoder.encode(country, forKey: kResultsCountryKey)
  }

}
