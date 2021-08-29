brew install flux
flux check --pre
flux bootstrap github \
  --owner=nrbunn \
  --repository=homelab \
  --branch=main \
  --path=./clusters/my-cluster \
  --personal