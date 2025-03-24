---
layout: styleguide-standalone
title: Color System
description: The Brandmine color palette establishes our visual identity with teal as our primary color, orange as our secondary color, and indigo as our accent color.
permalink: /en/styleguide/foundations/colors/
lang: en
---

## Primary Colors

The primary teal colors represent our main brand identity and are used for key elements like navigation, buttons, and highlighted content.

<div class="styleguide-color-grid">
  {% include styleguide/color-swatch.html 
     color="primary-50" 
     name="Primary 50" 
     hex="#E6FFFA" 
     rgb="230, 255, 250"
     usage="Very light backgrounds, hover states"
  %}
  
  {% include styleguide/color-swatch.html 
     color="primary-100" 
     name="Primary 100" 
     hex="#B2F5EA" 
     rgb="178, 245, 234"
     usage="Light backgrounds, dividers"
  %}
  
  {% include styleguide/color-swatch.html 
     color="primary-200" 
     name="Primary 200" 
     hex="#81E6D9" 
     rgb="129, 230, 217"
     usage="Light UI elements"
  %}
  
  {% include styleguide/color-swatch.html 
     color="primary-300" 
     name="Primary 300" 
     hex="#4FD1C5" 
     rgb="79, 209, 197"
     usage="Light accents, success indicators"
  %}
  
  {% include styleguide/color-swatch.html 
     color="primary-400" 
     name="Primary 400" 
     hex="#38B2AC" 
     rgb="56, 178, 172"
     usage="Primary brand color, main buttons"
  %}
  
  {% include styleguide/color-swatch.html 
     color="primary-500" 
     name="Primary 500" 
     hex="#319795" 
     rgb="49, 151, 149"
     usage="Alternate primary, deeper variation"
  %}
  
  {% include styleguide/color-swatch.html 
     color="primary-600" 
     name="Primary 600" 
     hex="#2C7A7B" 
     rgb="44, 122, 123"
     usage="Primary dark, button hover"
  %}
  
  {% include styleguide/color-swatch.html 
     color="primary-700" 
     name="Primary 700" 
     hex="#285E61" 
     rgb="40, 94, 97"
     usage="Dark accents, active states"
  %}
  
  {% include styleguide/color-swatch.html 
     color="primary-800" 
     name="Primary 800" 
     hex="#234E52" 
     rgb="35, 78, 82"
     usage="Very dark accents"
  %}
  
  {% include styleguide/color-swatch.html 
     color="primary-900" 
     name="Primary 900" 
     hex="#1D4044" 
     rgb="29, 64, 68"
     usage="Darkest brand color"
  %}
</div>

## Usage Guidelines

### Primary Color Usage

The primary teal color (`#38B2AC`, primary-400) should be used for:

* Main action buttons
* Navigation elements
* Links
* Active states
* Progress indicators

For buttons and interactive elements, use `primary-600` for hover states and `primary-700` for active/pressed states.

### Accessibility Considerations

When using text on colored backgrounds, ensure proper contrast ratios:

* Text on `primary-400` and darker: Use white text
* Text on `primary-300` and lighter: Use dark text (neutral-700 or darker)

Our primary-400 color meets WCAG AA contrast requirements when used with white text at 16px or larger.

## Additional Color Documentation

For detailed information on our other color families, see:

* [Secondary Color System](/en/styleguide/foundations/colors/secondary/)
* [Neutral Color System](/en/styleguide/foundations/colors/neutral/)
* [Accent Color System](/en/styleguide/foundations/colors/accent/)