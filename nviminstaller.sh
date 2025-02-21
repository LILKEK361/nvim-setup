

echo "Ist dies deine Home dir: ${HOME} y/n"

HOME_DIR="${HOME}"

read yes

if [[ "$yes" -eq "y" ]]; then
	echo "----------------"
	echo "Updating and Upgrading"
	echo "----------------"

	sudo apt update -y && sudo apt upgrade -y

	echo "----------------"
	echo "Installing neovim"
	echo "----------------"

	sudo apt install neovim -y

	echo "----------------"
	echo "Cloning inti.lua"
	echo "----------------"

	git clone https://github.com/LILKEK361/nvim-setup

	mkdir "$HOME/.config/nvim"

	mv ./nvim-setup/* "$HOME/.config/nvim/"

	rm -rf ./nvim-setup

	echo "----------------"
	echo "Installing node"
	echo "----------------"

	# Download and install nvm:
	curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bas

	# in lieu of restarting the shell
	\. "$HOME/.nvm/nvm.sh"

	# Download and install Node.js:
	nvm install 22

	# Verify the Node.js version:
	node -v # Should echo "v22.14.0".

	echo "----------------"
	echo "Installing Nerd Font"
	echo "----------------"

	declare -a fonts=(
	    BitstreamVeraSansMono
	    Hermit
	    JetBrainsMono
	)

	version='2.1.0'
	fonts_dir="${HOME}/.local/share/fonts"

	if [[ ! -d "$fonts_dir" ]]; then
	    mkdir -p "$fonts_dir"
	fi

	for font in "${fonts[@]}"; do
	    zip_file="${font}.zip"
	    download_url="https://github.com/ryanoasis/nerd-fonts/releases/download/v${version}/${zip_file}"
	    echo "Downloading $download_url"
	    wget "$download_url"
	    unzip "$zip_file" -d "$fonts_dir"
	    rm "$zip_file"
	done

	find "$fonts_dir" -name '*Windows Compatible*' -delete

	fc-cache -fv
fi
if [[ "$yes" != "y" ]]; then
	echo "DAIM!"

fi

exit
