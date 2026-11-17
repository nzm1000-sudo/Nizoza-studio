# Nizoza Studio — Development Roadmap (Draft)

Status: planning only. No production code changed.

## Product vision
Build a reliable, Hebrew-first, professional DAW for Apple Silicon, extending Nota while preserving its working audio engine and upstream history.

## Non-negotiable engineering rules
- Keep upstream attribution and AGPL-3.0 notices. Audit licenses of bundled code, JUCE, plugins, samples, fonts, and assets before distribution.
- Do not claim the fork can be redistributed as closed-source. Obtain legal review for commercial packaging and network use.
- Never replace or overwrite the existing NI-Kod 26 recording studio. Integration must be an explicitly reviewed, reversible step.
- Preserve project compatibility and audio output; no destructive migrations.
- All audio processing must remain real-time safe: avoid blocking, allocation, filesystem/network operations on the audio callback.
- Develop in isolated feature branches with tests and reproducible macOS arm64 builds.

## Phase 0 — Audit and baseline
Inventory engine, UI, plugin hosting, project format, remote control, MCP, test coverage and dependencies. Establish a clean Apple Silicon build and baseline tests. Record known crashes and performance bottlenecks.

## Phase 1 — Professional UX
Create a distinct Nizoza design system: RTL-aware Hebrew UI, accessible keyboard navigation, responsive arrangement/mixer, scalable typography, tasteful depth, resizable panels, user themes and consistent parameter controls. Keep English mode.

## Phase 2 — Recording and editing
Validate low-latency multitrack recording, punch in/out, loop recording, comping, waveform caching, non-destructive trim/split/crossfade, robust undo/redo, autosave and crash recovery.

## Phase 3 — Mixing and mastering
Improve routing, sidechain ducking, bus groups, sends, gain staging, metering, loudness analysis, export stems, offline bounce and reference-track comparison. Add presets with documented provenance.

## Phase 4 — Plugins and instruments
Audit AU/VST3 hosting, scan isolation, crash recovery and parameter automation. Add independently licensed custom audio processors and original preset packs; ensure plugin compatibility on macOS arm64.

## Phase 5 — AI assistant
Hebrew natural-language command planning, non-destructive preview, explicit confirmation for destructive operations, reproducible action log, undo, local-first optional models and strict boundaries between UI/agent and real-time DSP.

## Phase 6 — iPhone remote
Extend existing phone controller with secure pairing, transport, mixer, recording control, plugin parameter control and session state, without exposing the DAW publicly by default.

## Phase 7 — NI-Kod 26 interoperability
Document independent integration options (project export/import, IPC, external launch). Compare licensing implications before selecting an architecture. Do not merge projects by default.

## Acceptance gates
1. Clean baseline build and tests on target Mac.
2. Deterministic audio regression tests (record/playback/export).
3. Crash recovery and plugin fault isolation.
4. No loss of original project data.
5. Measured CPU/latency performance, not guessed figures.
6. Verified third-party licenses and attribution.
7. User approval before release or NI-Kod integration.

## First implementation task
Read source and CI scripts; produce an evidence-based technical architecture report and a prioritized issue list. Do not start a full redesign before the baseline is reproducible.
