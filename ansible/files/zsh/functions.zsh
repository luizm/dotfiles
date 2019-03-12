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
			gsed -i "s/$1/$2/g" $i
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
	domain="$1"
	export VAULT_AUTH_GITHUB_TOKEN=$(cat ~/.github/token)
	export VAULT_ADDR="https://$domain:8200"
	vault auth -method=github
}

gcloud_login() {
	account="$1"
	export GOOGLE_CREDENTIALS="/Users/luiz.muller/.gcloud/$account.json"
}
