import ApolloCodegenLib
import ArgumentParser
import Foundation

// An outer structure to hold all commands and sub-commands handled by this script.
struct SwiftScript: ParsableCommand {
    
    static let parentFolderOfScriptFile = FileFinder.findParentFolder()
    
    static var configuration = CommandConfiguration(
        abstract: """
        A swift-based utility for performing Apollo-related tasks.
        
        NOTE: If running from a compiled binary, prefix subcommands with `swift-script`. Otherwise use `swift run ApolloCodegen [subcommand]`.
        """,
        subcommands: [GenerateCode.self])
    
    /// The sub-command to actually generate code.
    struct GenerateCode: ParsableCommand {
        static var configuration = CommandConfiguration(
            commandName: "generate",
            abstract: "Generates swift code from your schema + your operations based on information set up in the `GenerateCode` command.")
        
        mutating func run() throws {
            let configuration = ApolloCodegenConfiguration(
                schemaNamespace: "GraphQL",
                input: ApolloCodegenConfiguration.FileInput(
                    schemaSearchPaths: ["./schema/schema.graphqls"],
                    operationSearchPaths: ["../Operations/*.graphql"]
                ),
                output: ApolloCodegenConfiguration.FileOutput(
                    schemaTypes: ApolloCodegenConfiguration.SchemaTypesFileOutput(
                        path: "../Sources/PrintablesKit/GeneratedCode/Apollo/",
                        moduleType: .embeddedInTarget(name: "PrintablesKit", accessModifier: .internal)
                    ),
                    operations: .inSchemaModule,
                    testMocks: .none
                ),
                options: ApolloCodegenConfiguration.OutputOptions(
                    queryStringLiteralFormat: .multiline,
                    deprecatedEnumCases: .include,
                    schemaDocumentation: .include,
                    apqs: .disabled,
                    cocoapodsCompatibleImportStatements: false,
                    warningsOnDeprecatedUsage: .include,
                    conversionStrategies: ApolloCodegenConfiguration.ConversionStrategies(
                        enumCases: .camelCase
                    ),
                    pruneGeneratedFiles: true
                )
            )
            
            try! ApolloCodegen.build(with: configuration)
        }
    }
}

// This will set up the command and parse the arguments when this executable is run.
SwiftScript.main()
