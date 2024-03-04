{ # this ensures the entire script is downloaded #

	echo "set -o vi" >> ~/.bashrc
	sudo apt update
	sudo apt -y upgrade
	sudo apt install -y build-essential jq

	## VScode
	# Install
	wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
	sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
	sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
	rm -f packages.microsoft.gpg
	sudo apt update
	sudo apt install -y code

    # Install Vim
	code --install-extension vscodevim.vim

	# Edit basic settings
    mkdir -p ~/.config/Code/User/
    
	echo '[
    {
        "key": "ctrl+k ctrl+i",
        "command": "editor.action.showHover",
        "when": "editorTextFocus"
    },
    {
        "key": "ctrl+k ctrl+i",
        "command": "-editor.action.showHover",
        "when": "editorTextFocus"
    }
]' >> ~/.config/Code/User/keybindings.json

    echo {} > ~/.config/Code/User/settings.json
	jq '. + { "window.restoreWindows": "none" }' ~/.config/Code/User/settings.json > tmp.$$.json && mv tmp.$$.json ~/.config/Code/User/settings.json

	
	# Edit Vim settings
	jq '. + { "vim.foldfix": true }' ~/.config/Code/User/settings.json > tmp.$$.json && mv tmp.$$.json ~/.config/Code/User/settings.json

	## Docker
	# Install
	sudo install -m 0755 -d /etc/apt/keyrings
	sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
	sudo chmod a+r /etc/apt/keyrings/docker.asc

	echo \
		"deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
		$(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
		sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
	sudo apt update
	sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

	# Manage Docker as a non-root user
	sudo groupadd docker
	sudo usermod -aG docker $USER

}
