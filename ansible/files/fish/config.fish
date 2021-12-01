set -g fish_user_paths "/usr/local/opt/*/bin" $fish_user_paths
set -g fish_user_paths "/opt/homebrew/bin" $fish_user_paths

abbr -a fcleaner 'fork-cleaner --token (cat ~/.github/fork-cleaner)'

function fish_user_key_bindings
  bind \cc 'echo; commandline | cat; commandline ""; commandline -f repaint'
end

function certp -d "prints the certificate of a given domain"
	if not set -q argv[1]
		echo (set_color red)"first argument need to be a domain" >&2
		return 1
	end
	echo | openssl s_client -showcerts -servername $argv[1] -connect $argv[1]:443 2>/dev/null | openssl x509 -inform pem -noout -text
end

function convbase64 -d "conver to base64"
	if not set -q argv[1]
		echo (set_color red)"first argument need to be a string" >&2
		return 1
	end
	echo $argv[1] | base64
end

function decodebase64 -d "decode from base64"
	if not set -q argv[1]
		echo (set_color red)"first argument need to be a base64 string" >&2
		return 1
	end
	echo $argv[1] | base64 -d
end
