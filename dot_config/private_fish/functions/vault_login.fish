function vault_login
    set --local op_vault "Algolia"
    set --local op_item "HashiCorp Vault Auth Token"

    set --local vault_address (op read "op://$op_vault/$op_item/address")

    set --local token (VAULT_ADDR=$vault_address op run -- vault login --no-store --token-only --method=oidc)

    if test -n $token
        op item edit --vault="$op_vault" "$op_item" "token=$token" >/dev/null
    end
end
