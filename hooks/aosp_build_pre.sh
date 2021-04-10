#!/usr/bin/env bash

cd "${AOSP_BUILD_DIR}"

## apply microg sigspoof patch
#echo "applying microg sigspoof patch"
#patch -p1 --no-backup-if-mismatch < "platform/prebuilts/microg/00002-microg-sigspoof.patch"

# apply community patches
echo "applying community patches"
community_patches_dir="${ROOT_DIR}/community_patches"
rm -rf "${community_patches_dir}"
git clone https://github.com/rattlesnakeos/community_patches "${community_patches_dir}"
patch -p1 --no-backup-if-mismatch < "${community_patches_dir}/00001-global-internet-permission-toggle.patch"
patch -p1 --no-backup-if-mismatch < "${community_patches_dir}/00004-use-cloudflare-dns.patch"
patch -p1 --no-backup-if-mismatch < "${community_patches_dir}/00007-set-seedvault-as-dftl-bkp-provider.patch"
patch -p1 --no-backup-if-mismatch < "${community_patches_dir}/00006-increase-default-maximum-password-length.patch"
patch -p1 --no-backup-if-mismatch < "${community_patches_dir}/00002-round-icon.patch"

community_patches_dir="${ROOT_DIR}/community_patches/custom"
rm -rf "${community_patches_dir}"
git clone https://github.com/pinembour/custom-config-repo.git "$community_patches_dir"
patch -p1 --no-backup-if-mismatch < "${community_patches_dir}/patches/00010-backup-any-application.patch"

## apply custom hosts file
#custom_hosts_file="https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts"
#echo "applying custom hosts file ${custom_hosts_file}"
#retry wget -q -O "${AOSP_BUILD_DIR}/system/core/rootdir/etc/hosts" "${custom_hosts_file}"
