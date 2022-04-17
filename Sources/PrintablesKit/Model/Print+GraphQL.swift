import Foundation

extension Print {
    init(_ gqlSearchResult: GraphQL.SearchPrintsQuery.Data.SearchPrints.Item) {
        id = gqlSearchResult.id
        name = gqlSearchResult.name
        images = [Constants.mediaBaseURL.appendingPathComponent(gqlSearchResult.image.filePath)]
        nsfw = gqlSearchResult.nsfw
        hasModel = gqlSearchResult.hasModel
        liked = gqlSearchResult.liked ?? false
        likesCount = gqlSearchResult.likesCount
        downloadCount = gqlSearchResult.downloadCount
        datePublished = gqlSearchResult.datePublished.dateFromGQLDayString
        summary = nil
        description = nil
        user = nil
        makesCount = nil
        tags = nil
        stls = nil
        gcodes = nil
        slas = nil
        pdfFilePath = nil
    }
    
    init(_ gqlPrintResult: GraphQL.PrintProfileQuery.Data.Print) {
        id = gqlPrintResult.id
        name = gqlPrintResult.name
        images = gqlPrintResult.images?.compactMap{Constants.mediaBaseURL.appendingPathComponent($0.filePath)} ?? []
        nsfw = gqlPrintResult.nsfw
        hasModel = gqlPrintResult.hasModel
        liked = gqlPrintResult.liked ?? false
        likesCount = gqlPrintResult.likesCount
        downloadCount = gqlPrintResult.downloadCount
        datePublished = gqlPrintResult.datePublished.dateFromGQLDayString
        
        summary = gqlPrintResult.summary
        description = gqlPrintResult.description
        
        if let gqlUser = gqlPrintResult.user {
            user = User(id: gqlUser.id,
                        name: gqlUser.publicUsername,
                        avatarFilePath: gqlUser.avatarFilePath,
                        handle: gqlUser.handle,
                        company: gqlUser.company,
                        verified: gqlUser.verified)
        } else {
            user = nil
        }
        
        makesCount = gqlPrintResult.makesCount
        
        if let gqlTags = gqlPrintResult.tags {
            tags = gqlTags.map{Tag(id: $0.id, name: $0.name)}
        } else {
            tags = nil
        }
        
        if let gqlStls = gqlPrintResult.stls {
            stls = gqlStls.map{PrintFile(id: $0.id,
                                         name: $0.name,
                                         filePath: $0.filePath,
                                         filePreviewPath: $0.filePreviewPath,
                                         fileSize: $0.fileSize,
                                         type: .stl)}
        } else {
            stls = nil
        }
        
        if let gqlGCodes = gqlPrintResult.gcodes {
            gcodes = gqlGCodes.map{PrintFile(id: $0.id,
                                             name: $0.name,
                                             filePath: $0.filePath,
                                             filePreviewPath: $0.filePreviewPath,
                                             fileSize: $0.fileSize,
                                             type: .gcode)}
        } else {
            gcodes = nil
        }
        
        if let gqlSlas = gqlPrintResult.slas {
            slas = gqlSlas.map{PrintFile(id: $0.id,
                                         name: $0.name,
                                         filePath: $0.filePath,
                                         filePreviewPath: $0.filePreviewPath,
                                         fileSize: $0.fileSize,
                                         type: .sla)}
        } else {
            slas = nil
        }
        
        pdfFilePath = gqlPrintResult.pdfFilePath
    }
}
