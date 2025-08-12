# ubuntu-cli-toolbox

This image is based on Ubuntu 24.04 and bundles a set of handy CLI tools for text, data, media, and filesystem operations.

## Installed tools

- **ImageMagick (`magick`,      `convert`)**: Image processing (convert, resize, composite, identify).
- **FFmpeg (`ffmpeg`,      `ffprobe`)**: Audio/video transcoding and probing.
- **Pandoc (`pandoc`)**: Universal document converter.
- **du**: Disk usage reporting (from coreutils).
- **inotify-tools (`inotifywait`,      `inotifywatch`)**: Filesystem event monitoring.
- **file (`file`)**: File type identification.
- **p7zip-full (`7z`)**: 7-Zip archiver (compress/decompress).
- **unrar (`unrar`)**: Extract RAR archives.
- **GNU parallel (`parallel`)**: Run jobs in parallel using one or more computers.
- **rename (`rename`)**: Batch rename using Perl regular expressions.
- **rclone (`rclone`)**: Sync/backup to/from cloud object storage providers.
- **rsync (`rsync`)**: Fast incremental file transfer.
- **tree (`tree`)**: Directory listings in a tree-like format.
- **eza (`eza`, alias: `exa`)**: Modern replacement for `ls` with colors and icons.
- **jq (`jq`)**: Command-line JSON processor.
- **yq (`yq`)**: Command-line YAML processor (mikefarah v4 series).
- **The Silver Searcher (`ag`)**: Code/search tool similar to `ack` but faster.
- **fzf (`fzf`)**: General-purpose command-line fuzzy finder.
- **bat (`bat`, upstream binary: `batcat`)**: `cat` clone with syntax highlighting and Git integration.
- **fd (`fd`, upstream binary: `fdfind`)**: Simple, fast, user-friendly alternative to `find`.
- **ripgrep (`rg`)**: Line-oriented search tool that recursively searches directories.
- **curl (`curl`) / wget (`wget`)**: HTTP(S) downloaders.
- **GnuPG (`gpg`)**: OpenPGP encryption and signing.
- **ca-certificates**: System CA bundle.

## Python utilities

- **Python 3 (`python3`)** and **pipx (`pipx`)**: Isolated Python app management following PEP 668.
- **markitdown (`markitdown`)**: Markdown conversion CLI installed via `pipx`.

## Command name compatibility

Some Debian/Ubuntu packages ship binaries under different names. Convenience symlinks are provided:

- `bat` → upstream binary `batcat`
- `fd` → upstream binary `fdfind`
- `exa` → provided by `eza`

`yq` (mikefarah) is installed into `/usr/local/bin` and is available as `yq` directly.

## Quick checks

- Print versions:
  - `magick -version`,      `ffmpeg -version`,      `pandoc --version`,      `jq --version`,      `yq --version`,      `rg --version`,      `ag --version`,      `fzf --version`,      `bat --version`,      `fd --version`,      `eza --version`.
- Verify Python apps:
  - `python3 --version`,      `pipx --version`,      `markitdown --help`.

## Notes

- `du` is part of `coreutils` and is installed implicitly.
- `unrar` may be non-free in some environments; if unavailable, consider `unar` as a fallback.
