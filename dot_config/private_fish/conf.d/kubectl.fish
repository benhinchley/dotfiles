if type -q "gke-gcloud-auth-plugin"
    set -gx USE_GKE_GCLOUD_AUTH_PLUGIN TRUE
end

if test -d $HOME/.krew
   fish_add_path $HOME/.krew/bin
end
