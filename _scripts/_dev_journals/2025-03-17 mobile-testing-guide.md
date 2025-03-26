# Testing Jekyll Website Changes on Mobile Devices

When developing websites with Jekyll, testing CSS changes (like form styling) on mobile devices is crucial for ensuring responsive design. This guide outlines several approaches for testing mobile compatibility without deploying directly to your production environment.

## Understanding Your GitHub Pages Setup

If you're using GitHub Pages with a custom domain (like `brandmine.io`), your setup might not automatically create preview environments for each branch. This means you need alternative strategies to test your changes safely.

## Testing Strategies

### 1. Local Network Testing (Recommended)

Test your site on real mobile devices while running Jekyll locally:

```bash
# Start Jekyll with network access enabled
bundle exec jekyll serve --host=0.0.0.0
```

Then access your site from a mobile device:

1. Find your computer's local IP address:
   - On macOS: System Preferences → Network → Your connection → IP address
   - On Windows: Command Prompt → type `ipconfig`
   - Usually looks like `192.168.1.X` or `10.0.0.X`

2. On your mobile device, open a browser and enter:
   ```
   http://YOUR_COMPUTER_IP:4000
   ```
   For example: `http://192.168.1.5:4000`

This method allows testing on real devices without affecting your production site. **Both devices must be on the same WiFi network.**

### 2. Browser Developer Tools

For quick initial testing without a physical device:

1. Open your site locally in Chrome or Firefox
2. Press F12 or right-click → Inspect to open developer tools
3. Click the mobile device icon (in Chrome) or press Ctrl+Shift+M (in Firefox)
4. Select different device presets from the dropdown menu
5. Test your site in various simulated screen sizes

While not a replacement for testing on actual devices, this provides a quick way to catch obvious responsive design issues.

### 3. Tunneling Services

If you can't connect directly to your local network, use a tunneling service:

1. Install [ngrok](https://ngrok.com/download)

2. Run your Jekyll server normally:
   ```bash
   bundle exec jekyll serve
   ```

3. In a separate terminal window, run ngrok:
   ```bash
   ngrok http 4000
   ```

4. Ngrok will generate a public URL (like `https://a1b2c3d4.ngrok.io`)

5. Access this URL from any device with internet access

This creates a secure tunnel to your local development server, accessible from anywhere with internet connection.

### 4. Temporary Branch Deployment (Use Cautiously)

If your GitHub Pages setup supports deploying from different branches:

1. Create a testing branch:
   ```bash
   git checkout -b mobile-form-fix
   git add assets/css/components/forms.css
   git commit -m "Fix Tally form container border spacing"
   git push origin mobile-form-fix
   ```

2. In your repository settings:
   - Go to Settings → Pages
   - Under "Source," select "Deploy from a branch"
   - Select your testing branch
   - Click "Save"

**Important note**: This will temporarily replace your production site with your test version. Only do this during low-traffic periods or when you're confident in your changes. Remember to switch back to your main branch after testing.

## CSS Testing Checklist

When specifically testing CSS changes on mobile devices, check these common issues:

1. **Element alignment**: Are all elements properly centered or aligned?
2. **Form inputs**: Do form fields render correctly and have appropriate tap targets?
3. **Text readability**: Is font size comfortable for reading on small screens?
4. **Container spacing**: Do containers have appropriate margins and padding?
5. **Responsive breakpoints**: Do layout changes occur at the right screen widths?
6. **Touch targets**: Are buttons and links large enough for comfortable tapping?

## Post-Testing Workflow

After confirming your changes work correctly on mobile:

1. Return to your main branch:
   ```bash
   git checkout main
   ```

2. Merge your changes:
   ```bash
   git merge mobile-form-fix
   ```

3. Push to GitHub:
   ```bash
   git push origin main
   ```

This workflow ensures your fixes are properly tested before becoming part of your production website.

## Balancing Speed with Reliability

For quick CSS fixes like form container styling:

- Start with browser developer tools for initial testing
- Use local network testing for verification on real devices
- Commit to main branch only after thorough testing
- Consider implementing a more sophisticated staging environment for future development

This balanced approach lets you fix issues efficiently while minimizing risk to your production website.
