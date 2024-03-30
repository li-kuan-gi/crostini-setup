{ # this ensures the entire script is downloaded #

        ## rustup
        curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

        ## rust-analyzer
	# Extensions
        code --install-extension rust-lang.rust-analyzer

	# Settings
	jq '. + { "rust-analyzer.inlayHints.parameterHints.enable": false, "rust-analyzer.inlayHints.typeHints.enable": false }' ~/.config/Code/User/settings.json > tmp.$$.json && mv tmp.$$.json ~/.config/Code/User/settings.json
}
