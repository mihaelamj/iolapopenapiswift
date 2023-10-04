
import Foundation
import PackagePlugin

@main
struct Plugin: CommandPlugin {
    static let apiSpecFile = "PetStore.json"
    static let createSpecFile = "create-api-config.yaml"
    static let workingDir = "Sources"

    func performCommand(context: PluginContext, arguments _: [String]) async throws {
        try await generate(context: context)
        try await lint(context: context)
    }

    private func runProcess(_ commandLine: String, context: PluginContext, workingDirectory: String? = nil) throws {
        var arguments = commandLine.split(separator: " ").map { String($0) }
        let commandName = arguments.removeFirst()

        let command = try context.tool(named: commandName)

        let actualWorkingDirectory: Path

        if let workingDirectory {
            actualWorkingDirectory = context.package.directory.appending(workingDirectory)
        } else {
            actualWorkingDirectory = context.package.directory
        }

        let process = Process()
        process.currentDirectoryURL = URL(fileURLWithPath: actualWorkingDirectory.string)
        process.executableURL = URL(fileURLWithPath: command.path.string)
        process.arguments = arguments

        try process.run()
        process.waitUntilExit()
    }

    private func generate(context: PluginContext) async throws {
        try runProcess(
            "create-api generate \(Plugin.apiSpecFile) --config \(Plugin.createSpecFile) --output .",
            context: context,
            workingDirectory: Plugin.workingDir
        )
    }

    private func lint(context: PluginContext) async throws {
        try runProcess(
            "swiftformat .",
            context: context
        )
    }
}
