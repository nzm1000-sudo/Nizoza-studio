#!/usr/bin/env bash
# Nizoza Studio: read-only macOS build prerequisites check.
# Does not install, modify, build or launch any application.
set -u
if [[ "$(uname -s)" != "Darwin" ]]; then
  echo "ERROR: this preflight must run on macOS." >&2
  exit 2
fi
fail=0
check() {
  local name="$1" cmd="$2"
  if command -v "$cmd" >/dev/null 2>&1; then
    printf 'OK   %-12s %s\n' "$name" "$(command -v "$cmd")"
  else
    printf 'MISS %-12s (not found)\n' "$name"
    fail=1
  fi
}
echo "Nizoza Studio macOS preflight (read-only)"
sw_vers -productVersion
uname -m
check git git
check xcodebuild xcodebuild
check cmake cmake
check ninja ninja
check dotnet dotnet
check node node
echo
if command -v xcodebuild >/dev/null 2>&1; then xcodebuild -version 2>&1 || fail=1; fi
if command -v cmake >/dev/null 2>&1; then cmake --version | head -n 1; fi
if command -v dotnet >/dev/null 2>&1; then dotnet --version; fi
if command -v node >/dev/null 2>&1; then node --version; fi
echo
if [[ "$fail" -eq 0 ]]; then
  echo "Tools found. Version compatibility and actual build are NOT verified."
else
  echo "Missing tools or Xcode issue. No changes were made."
fi
exit "$fail"
