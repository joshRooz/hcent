#!/usr/bin/env bash
set -eou pipefail

nv="$(curl -s https://api.releases.hashicorp.com/v1/releases/consul/latest?license_class=enterprise | jq -r .version)"
cv="$(cat .version)"

for f in $(grep -l "${cv}" ./*) ; do
  sed -i '' -e "s/${cv}/${nv}/" "${f}"
done

echo "${nv}" > .version

#git commit -am "bump default release to ${nv/+ent/}" 
#git push

exit 0
