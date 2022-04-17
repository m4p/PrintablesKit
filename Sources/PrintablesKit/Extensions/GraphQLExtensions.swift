import Foundation

extension String {
    var dateFromGQLDayString: Date {
        let dateFormatter = ISO8601DateFormatter()
        dateFormatter.formatOptions = [.withFullDate]
        return dateFormatter.date(from: self) ?? .distantPast
    }
}
