secret_path=$1
secret_key=$2

jwt=$(cat /var/run/secrets/kubernetes.io/serviceaccount/token)
echo "{\"jwt\":\""$jwt"\",\"role\":\"demo\"}" > k8s-login.json
client_token=$(curl --insecure  -sSL ${VAULT_ADDR}/v1/auth/kubernetes/login -d @k8s-login.json | jq .auth.client_token)
echo "X-Vault-Token:$(echo $client_token | xargs)" > client_token_header
curl --insecure -sSL -H $(cat client_token_header) ${VAULT_ADDR}/v1/$secret_path | jq .data."$secret_key"
