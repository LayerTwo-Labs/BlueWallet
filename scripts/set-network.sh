#!/usr/bin/env bash
# Usage: ./scripts/set-network.sh [mainnet|testnet|signet]
# Defaults to signet if no argument given.
set -euo pipefail

N="${1:-signet}"
case "$N" in mainnet|testnet|signet) ;; *) echo "Invalid network: $N" >&2; exit 1 ;; esac

DIR="$(cd "$(dirname "$0")/.." && pwd)"

# macOS sed needs -i '', GNU sed needs just -i
if sed --version 2>/dev/null | grep -q GNU; then
  I=(-i)
else
  I=(-i '')
fi

sed "${I[@]}" "s/let _networkType: NetworkType = '.*'/let _networkType: NetworkType = '$N'/" "$DIR/models/network.ts"
sed "${I[@]}" "s/let currentNetwork: NetworkType = '.*'/let currentNetwork: NetworkType = '$N'/" "$DIR/blue_modules/BlueElectrum.ts"
sed "${I[@]}" "s/networkType: '.*' as NetworkType/networkType: '$N' as NetworkType/" "$DIR/components/Context/SettingsProvider.tsx"

echo "Default network set to: $N"
