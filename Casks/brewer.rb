cask "brewer" do
  version "1.0.2"
  sha256 "961436fdfbf123314936c26d5f8043c0b539407061205a87902eba62f49348e4"

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
    This build is not yet notarized, so macOS blocks the first launch:
    System Settings -> Privacy & Security -> scroll down -> "Open Anyway".
    Skip that prompt entirely by installing with:
      brew reinstall --cask --no-quarantine monzdigital/tap/brewer
  EOS

  zap trash: [
    "~/Library/Application Support/Brewer",
    "~/Library/Preferences/com.monz.brewer.plist",
    "~/Library/Saved Application State/com.monz.brewer.savedState",
  ]
end
