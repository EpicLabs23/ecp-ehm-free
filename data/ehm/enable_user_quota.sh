#!/usr/bin/env bash
# ==============================================================================
# Enable User Quota Setup Script for Ubuntu / Debian
# ==============================================================================
# This script automates enabling user quotas on an ext4 filesystem:
#   1. Installs 'quota' and required kernel modules
#   2. Loads quota kernel modules ('quota_v1', 'quota_v2')
#   3. Updates /etc/fstab with 'usrjquota=aquota.user,jqfmt=vfsv1'
#   4. Remounts the target filesystem
#   5. Initializes quota files via 'quotacheck' (handling active quotas safely)
#   6. Activates quotas via 'quotaon'
#   7. Enables systemd 'quota.service' for boot persistence
# ==============================================================================

set -euo pipefail

TARGET_MOUNT="${1:-/}"

# Ensure root privileges
if [[ "${EUID}" -ne 0 ]]; then
    echo "Error: This script must be run as root." >&2
    exit 1
fi

echo "=== Starting User Quota Setup on Target: '${TARGET_MOUNT}' ==="

# 1. Install quota packages and kernel modules
echo "[1/7] Installing quota package and kernel modules..."
KERNEL_VERSION="$(uname -r)"
apt-get update -qq
apt-get install -y -qq quota "linux-modules-extra-${KERNEL_VERSION}" || true

# 2. Load quota kernel modules
echo "[2/7] Loading kernel modules for quota..."
modprobe quota_v1 || true
modprobe quota_v2 || true

# 3. Update /etc/fstab safely
echo "[3/7] Updating /etc/fstab with quota mount options..."
FSTAB="/etc/fstab"
BACKUP_FSTAB="/etc/fstab.bak.$(date +%Y%m%d_%H%M%S)"
cp "${FSTAB}" "${BACKUP_FSTAB}"
echo "Backup created at ${BACKUP_FSTAB}"

# Check if target mount already has usrjquota or usrquota in fstab
if grep -qs -E "${TARGET_MOUNT}\s+ext4\s+.*usrjquota=" "${FSTAB}" || grep -qs -E "${TARGET_MOUNT}\s+ext4\s+.*usrquota" "${FSTAB}"; then
    echo "Quota options already present in ${FSTAB} for ${TARGET_MOUNT}."
else
    # Append usrjquota=aquota.user,jqfmt=vfsv1 to the options field of target mount point
    awk -v target="${TARGET_MOUNT}" '
    $2 == target && $3 ~ /^ext[34]$/ {
        if ($4 !~ /usrjquota=/) {
            $4 = $4 ",usrjquota=aquota.user,jqfmt=vfsv1"
        }
    }
    { print $1 "\t" $2 "\t" $3 "\t" $4 "\t" $5 "\t" $6 }
    ' "${BACKUP_FSTAB}" > "${FSTAB}"
    echo "Updated ${FSTAB} successfully."
    systemctl daemon-reload || true
fi

# 4. Remount filesystem
echo "[4/7] Remounting filesystem '${TARGET_MOUNT}'..."
mount -o remount "${TARGET_MOUNT}"

# 5. Initialize quota files safely
echo "[5/7] Checking and initializing quota files..."
# Turn off quota temporarily if enabled so quotacheck can scan safely
quotaoff "${TARGET_MOUNT}" 2>/dev/null || true
quotacheck -cum "${TARGET_MOUNT}" || quotacheck -fm "${TARGET_MOUNT}"

# 6. Turn on user quota
echo "[6/7] Turning on user quotas..."
quotaon -v "${TARGET_MOUNT}"

# 7. Enable systemd service for boot persistence
echo "[7/7] Enabling quota systemd service..."
systemctl enable quota.service || true

echo ""
echo "=== User Quota Setup Completed Successfully! ==="
echo ""
echo "Current Quota Status:"
quotaon -pa || true
echo ""
echo "User Quotas Report Summary:"
repquota -a || true
