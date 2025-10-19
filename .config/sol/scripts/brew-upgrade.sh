# Name: Brew Upgrade
# Icon: 🆙

brew upgrade
outdated_casks=$(brew outdated --cask --greedy | awk '{print $1}')

for cask in $outdated_casks; do
	echo "Upgrading $cask..."
	brew upgrade --cask "$cask" --greedy --no-quarantine </dev/null
	if [ $? -ne 0 ]; then
		echo "Skipped $cask (may require sudo or user interaction)"
	fi
done