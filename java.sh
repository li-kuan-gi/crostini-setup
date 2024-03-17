{ # this ensures the entire script is downloaded #

	## JDK
	sudo apt update
	sudo apt install -y default-jdk

	## VScode settings
	# Extensions
	code --install-extension vscjava.vscode-java-pack
	code --install-extension vmware.vscode-boot-dev-pack

	# Settings
	jq '. + { "java.inlayHints.parameterNames.enabled": "none" }' ~/.config/Code/User/settings.json > tmp.$$.json && mv tmp.$$.json ~/.config/Code/User/settings.json

 	# Keybindings
  	jq '. += [{ "key": "ctrl+r ctrl+t","command": "java.test.editor.run" }]' ~/.config/Code/User/keybindings.json > tmp.$$.json && mv tmp.$$.json ~/.config/Code/User/keybindings.json

}
