# Nizoza Studio — Phase 0 source audit

Audit date: 2026-11-17. Evidence: upstream files on fork's develop branch. Source inspection only; no local build has run.

## Verified architecture
- ARCHITECTURE.md: C++20 engine, pure C ABI, .NET 10/Avalonia UI, MCP server, persistence and plugin host.
- src/native/nota.engine/include/nota/nota_engine.h: documented ABI boundary (path in architecture).
- src/native/nota.engine/pluginhost: JUCE-based VST3/AU hosting; scanner worker separate.
- DESIGN.md: tokenized themes in src/managed/Nota.App/Theme/Themes/*.json, dynamic brushes, automated contrast checks.
- BUILD.md: macOS 26+, Xcode 26+, CMake >=3.24, Ninja, .NET 10, Node 22; scripts/build.sh builds native + managed and runs smoke tests.
- BUILD.md: performance gate is Linux/Valgrind-based, stress test uses MCP; neither has been executed in this audit.

## Risks / unknowns
1. No arm64 build or smoke test executed on owner's Mac; environment and dependencies unverified.
2. No proof yet that the current fork's recording, plugin scan, export or recovery paths work on the target Mac.
3. Existing NI-Kod 26 studio not inspected or integrated.
4. AGPL-3.0 and third-party licenses must be reviewed before public or proprietary distribution.
5. Theme redesign needs token contrast tests and visual QA across all screens.
6. Existing Nota data paths and app identifiers must be isolated before installing a fork beside Nota.

## Next implementation tickets (in order)
- NS-001: Record current fork commit, inspect CI, inventory licenses and create a dependency/license matrix.
- NS-002: Establish reproducible macOS arm64 build; capture exact versions, smoke tests and logs.
- NS-003: Isolate Nizoza app ID, bundle name, application data directory, plugin scan cache, URL schemes and remote ports. Preserve original Nota installation and data.
- NS-004: Add Nizoza design tokens as an optional theme; do not replace the default until accessibility/visual tests pass.
- NS-005: Prototype Hebrew/RTL UI on one contained screen, without RTL mirroring timeline direction, audio meters or musical time.
- NS-006: Validate recording, edit, export and crash-recovery with disposable projects.
- NS-007: Evaluate sidechain and custom plugin integration behind feature flags.
- NS-008: Design safe AI command API with dry-run, preview, undo and explicit user approval for destructive edits.
- NS-009: Review phone remote pairing, local-network exposure and authenticated control.
- NS-010: Evaluate interoperability with NI-Kod 26 via file interchange or IPC only after source review.

## Engineering gates
No changes to audio callback, project format or install paths without tests and rollback. Every ticket must have reproducible acceptance criteria, before/after evidence and explicit license review where applicable.
