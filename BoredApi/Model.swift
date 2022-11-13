
import Foundation


struct Headers {
    let activity: String
    let type: String
    let participants: Int
    let price: Double
    let link: String
    let key: String
    let accessibility: Double
    
    var description: String {
        """
        Activity: \(activity)
        Type: \(type)
        Participants: \(participants)
        Price: \(price)
        Link: \(link)
        Key: \(key)
        Accessibility: \(accessibility)
        """
    }
    
    
    init(headersData: [String: Any]) {
        accessibility = headersData["accessibility"] as? Double ?? 0.0
        activity = headersData["activity"] as? String ?? ""
        key = headersData["key"] as? String ?? ""
        link = headersData["link"] as? String ?? ""
        participants = headersData["participants"] as? Int ?? 0
        price = headersData["price"] as? Double ?? 0.0
        type = headersData["type"] as? String ?? ""

    }
    
    static func getHeaders(from value: Any) -> [Headers] {
        guard let headersData = value as? [[String: Any]] else { return [] }
        return headersData.map { Headers(headersData: $0) }
    }
}
