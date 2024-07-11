{ # this ensures the entire script is downloaded #

	## venv
	sudo apt update
	sudo apt install -y python3-venv

	## VScode settings
	# Extensions
	code --install-extension ms-python.python
	code --install-extension ms-python.black-formatter
 	code --install-extension ms-toolsai.jupyter

}
