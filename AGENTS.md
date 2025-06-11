# Development Guidelines for Agents

This repository contains LaTeX YASnippet files and a small Emacs Lisp
package. Contributors should follow the standards outlined below when
making automated changes.

## Commit Message Standards
- Use **Conventional Commits** (https://www.conventionalcommits.org/).
- Start the summary line with `feat:`, `fix:`, `docs:`, `chore:` or
  another valid type.
- Keep the subject line under 72 characters.
- Provide a body when the change is non-trivial.

## Commit Sequencing
- Make atomic commits that group related changes.
- Do not mix unrelated modifications in a single commit.

## Pull Request Standards
- Title should summarize the change using sentence case.
- Description must include:
  - Summary of changes
  - Testing steps taken
  - Any relevant references
- Ensure CI (if present) passes before marking ready for review.

## Code Housekeeping
- Remove unused files when identified.
- Update dependencies periodically.
- Keep `snippets.org` in sync with files under `org-mode` by tangling.

## Versioning
- This project uses **SemVer**. Update the version tag when
  backwards-incompatible changes occur or new features are added.

## CHANGELOG Maintenance
- Document user-facing changes in `CHANGELOG.md` under the Unreleased
  section. Categorize entries as Added, Changed, Fixed, etc.

## Testing Standards
- Ensure `setup-dev.sh` runs without errors.
- When adding snippets, verify tangling produces valid files in
  `org-mode/`.

## Documentation
- Keep `README.md` updated when usage or setup steps change.

