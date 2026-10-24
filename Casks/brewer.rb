cask "brewer" do
  version "1.2.0"
  sha256 "37a05d3d9da68fa370deeed97fb9e6a686e126aa5ec1cbf20f368f2320bf8b31"

  url "https://github.com/monzdigital/brewer/releases/download/v#{version}/Brewer-#{version}.zip"
  name "Brewer"
  desc "Free native Homebrew manager with live brew output"
  homepage "https://monzdigital.github.io/brewer/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "Brewer.app"

  caveats <<~EOS
    Brewer is not notarized yet, so macOS blocks its first launch and the
    first launch after each upgrade. Approve it once in:
      System Settings -> Privacy & Security -> scroll down -> "Open Anyway"
    or clear the quarantine flag from the terminal:
      xattr -dr com.apple.quarantine /Applications/Brewer.app
  EOS

  zap trash: [
    "~/Library/Application Support/Brewer",
    "~/Library/Preferences/com.monz.brewer.plist",
    "~/Library/Saved Application State/com.monz.brewer.savedState",
  ]
end
