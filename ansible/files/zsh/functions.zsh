 # shellcheck disable=SC2148
pub_key() {
	cat ~/.ssh/id_rsa.pub | pbcopy
}

convbase64() {
	echo -n $1 | base64 | pbcopy
}

decodebase64() {
	echo -n $1 | base64 --decode
}

sub() {
	grep -R -l $1 * |
		while read i; do
			sed -i "s/$1/$2/g" $i
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

	export VAULT_ADDR="$(grep "$env" ~/.vault-config | cut -d: -f2-)"
	export VAULT_CACERT="$HOME/.cert/vault-$env.crt"

	vault login -method=github token="$(cat ~/.github/token)"
}

gcloud_login() {
	account="$1"
	export GOOGLE_CREDENTIALS="/Users/luiz.muller/.gcloud/$account.json"
}
