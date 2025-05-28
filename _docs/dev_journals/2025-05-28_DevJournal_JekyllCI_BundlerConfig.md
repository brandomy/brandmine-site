# Dev Journal — CI Hardening with Bundler Config

## 🧩 Problem Statement

The GitHub Actions workflow for building and deploying the Jekyll site was susceptible to platform-specific dependency mismatches and inconsistent Bundler behavior across environments. While the immediate issue (missing Linux platform support) was resolved, further hardening was required to ensure reliable and reproducible CI builds.

## 🛠️ Approach

To enforce consistent behavior in the CI environment, we explicitly configured Bundler using the `bundle config` command within the GitHub Actions workflow. This configuration avoids reliance on implicit defaults and prevents unnecessary gem installations or deployment issues.

## ⚙️ Implementation Details

Added a new step before `bundle install` in `.github/workflows/jekyll.yml`:

```yaml
- name: Configure Bundler
  run: |
    bundle config set --local path vendor/bundle
    bundle config set --local deployment true
    bundle config set --local without 'development'
```

### Explanation of settings:
- `path vendor/bundle`: Installs gems locally within the repo (not system-wide)
- `deployment true`: Enforces Gemfile.lock consistency (CI fails if dependencies mismatch)
- `without 'development'`: Skips development-only gems in CI (e.g., linters, debuggers)

## 🧠 Decisions Made

- Adopted `vendor/bundle` to localize dependency installs and avoid system-wide contamination.
- Enabled `deployment` mode to mirror production behavior and prevent silent dependency mismatches.
- Skipped `development` group for a faster and leaner CI process.

## 📚 Resources

- [Bundler CLI docs](https://bundler.io/v2.3/man/bundle-config.1.html)
- [GitHub Actions Ruby setup](https://github.com/ruby/setup-ruby)
- [Peaceiris gh-pages action](https://github.com/peaceiris/actions-gh-pages)

## 💡 Insights & Learning

- Even after fixing platform mismatches, CI remains fragile unless Bundler behavior is explicitly configured.
- A lightweight but deliberate configuration step can avoid harder-to-diagnose downstream failures.

## 🔜 Next Actions

- Monitor upcoming CI runs for performance or caching issues.
- Consider setting up gem caching via `bundler-cache` or custom GitHub cache strategies if needed.
- Validate that all team environments (e.g., local dev, CI) remain in sync with the updated lockfile.
