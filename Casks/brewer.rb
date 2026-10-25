cask "brewer" do
  version "1.3.0"
  sha256 "57038836ceb39640604597ba9f1df2668edbfe07d5b324354841fc4fb39171e0"

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

