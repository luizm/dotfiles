 # shellcheck disable=SC2148
pub_key() {
	pbcopy < "$HOME"/.ssh/id_rsa.pub
}

github_token() {
	pbcopy < "$HOME"/.github/token
}

convbase64() {
	echo -n "$1" | base64 | pbcopy
}

decodebase64() {
	echo -n "$1" | base64 --decode
}

sub() {
	grep -R -l "$1" * |
		while read -r i; do
			sed -i "s/$1/$2/g" "$i"
		done
}

p() {
	dig +time=1 www.google.com.br >/dev/null || {
		echo "DNS server is down" &&
			return 1
	}
	ping 8.8.8.8
}

vault_login() {
	local -r env="$1"
	local -r vault_addr="$(grep "$env" ~/.vault-config | cut -d: -f2-)"

	export VAULT_ADDR="$vault_addr"
	export VAULT_CACERT="$HOME/.cert/vault-$env.crt"

	vault login -method=github token="$(cat ~/.github/token)"
}

gcloud_login() {
	local -r account="$1"

	export GOOGLE_CREDENTIALS="/Users/luiz.muller/.gcloud/$account.json"
}

avault() {
	local -r action="$1"
	local -r f="$2"

	ansible-vault "$action" \
		--vault-password-file "$HOME"/.ansible-vault/ansible-vault-file \
		"$f"
}
