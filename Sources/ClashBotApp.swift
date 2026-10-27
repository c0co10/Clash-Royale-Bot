import SwiftUI

@main
struct ClashBotApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

struct ContentView: View {
    @State private var status = "Bereit"
    @State private var bot = BotEngine()

    var body: some View {
        VStack(spacing: 20) {
            Text("ClashBot DL").font(.largeTitle.bold())
            Text(status).font(.headline)
            Button("Bot starten") { status = bot.start() }
            Button("Bot stoppen") { status = bot.stop() }
        }
        .padding()
    }
}
