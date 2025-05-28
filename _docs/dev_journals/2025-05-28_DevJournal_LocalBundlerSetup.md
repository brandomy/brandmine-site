# Dev Journal — Local Bundler Setup for Jekyll Development

## 🧩 Problem Statement

After aligning the GitHub Actions workflow to install gems into `vendor/bundle` and enable `deployment` mode, the local development environment encountered an error due to missing gems (`ffi`) and platform mismatches. This revealed the need to configure Bundler locally in a way that supports flexible development while maintaining compatibility with CI.

## 🛠️ Approach

Bundler was configured to:
- Install all gems in the local `vendor/bundle` directory (to match CI)
- Operate in **non-deployment mode** locally, so development changes to the Gemfile or dependencies are allowed

## ⚙️ Implementation Details

Ran the following in the project root:

```bash
bundle config set --local path vendor/bundle
bundle config set --local deployment false
bundle install --path vendor/bundle
```

Validated with:

```bash
bundle config
```

Output:
```
deployment
Set for your local app: false

path
Set for your local app: "vendor/bundle"
```

## 🧠 Decisions Made

- Set `deployment` to `false` locally to allow updates to `Gemfile.lock`
- Matched `vendor/bundle` with CI for consistency
- Kept `vendor/` in `.gitignore` to avoid pushing platform-specific gems

## 📚 Resources

- [Bundler config docs](https://bundler.io/man/bundle-config.1.html)
- [Jekyll bundler troubleshooting](https://jekyllrb.com/docs/troubleshooting/#bundler-errors)

## 💡 Insights & Learning

- Bundler’s `deployment` mode is great for CI but restrictive for development
- Always align local bundler path with CI to avoid “missing gem” errors
- Adding platform support (`bundle lock --add-platform`) is essential when developing on ARM Macs but deploying on x86_64 Linux

## 🔜 Next Actions

- Add this setup to the developer onboarding guide
- Optionally create a setup script for bootstrapping new dev environments
