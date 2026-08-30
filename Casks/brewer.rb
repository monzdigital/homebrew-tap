cask "brewer" do
  version "1.0.3"
  sha256 "06356342e9062d14d70ea1be0fda6eda033eff3575ad435e9c629ef81fbafe5d"

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
