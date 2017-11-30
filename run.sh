hipchat_token=$(./get-k8s-vault-secret.sh secret/kubernetes/bots/hipchat token)
pagerduty_token=$(./get-k8s-vault-secret.sh secret/kubernetes/bots/pagerduty token)

export HIPCHAT_TOKEN=$hipchat_token
export PAGERDUTY_TOKEN=$pagerduty_token

#/bin/hubot --adapter hipchat
