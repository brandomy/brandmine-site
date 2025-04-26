#!/bin/bash

# Script to update HTML and Liquid references

sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./index.html
sed -i '' 's/site.tags/site.dimensions/g' ./index.html
sed -i '' 's/page.tags/page.dimensions/g' ./index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./404.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./404.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./404.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./404.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./404.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./404.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./404.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./404.html
sed -i '' 's/site.tags/site.dimensions/g' ./404.html
sed -i '' 's/page.tags/page.dimensions/g' ./404.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./404.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./CLAUDE.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./CLAUDE.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./CLAUDE.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./CLAUDE.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./CLAUDE.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./CLAUDE.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./CLAUDE.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./CLAUDE.md
sed -i '' 's/site.tags/site.dimensions/g' ./CLAUDE.md
sed -i '' 's/page.tags/page.dimensions/g' ./CLAUDE.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./CLAUDE.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_includes/layout/footer.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_includes/layout/footer.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_includes/layout/footer.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_includes/layout/footer.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_includes/layout/footer.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_includes/layout/footer.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_includes/layout/footer.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_includes/layout/footer.html
sed -i '' 's/site.tags/site.dimensions/g' ./_includes/layout/footer.html
sed -i '' 's/page.tags/page.dimensions/g' ./_includes/layout/footer.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_includes/layout/footer.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_includes/layout/header.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_includes/layout/header.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_includes/layout/header.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_includes/layout/header.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_includes/layout/header.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_includes/layout/header.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_includes/layout/header.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_includes/layout/header.html
sed -i '' 's/site.tags/site.dimensions/g' ./_includes/layout/header.html
sed -i '' 's/page.tags/page.dimensions/g' ./_includes/layout/header.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_includes/layout/header.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_includes/utilities/google-analytics.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_includes/utilities/google-analytics.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_includes/utilities/google-analytics.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_includes/utilities/google-analytics.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_includes/utilities/google-analytics.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_includes/utilities/google-analytics.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_includes/utilities/google-analytics.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_includes/utilities/google-analytics.html
sed -i '' 's/site.tags/site.dimensions/g' ./_includes/utilities/google-analytics.html
sed -i '' 's/page.tags/page.dimensions/g' ./_includes/utilities/google-analytics.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_includes/utilities/google-analytics.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_includes/components/maps/map.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_includes/components/maps/map.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_includes/components/maps/map.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_includes/components/maps/map.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_includes/components/maps/map.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_includes/components/maps/map.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_includes/components/maps/map.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_includes/components/maps/map.html
sed -i '' 's/site.tags/site.dimensions/g' ./_includes/components/maps/map.html
sed -i '' 's/page.tags/page.dimensions/g' ./_includes/components/maps/map.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_includes/components/maps/map.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_includes/components/maps/markets-map.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_includes/components/maps/markets-map.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_includes/components/maps/markets-map.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_includes/components/maps/markets-map.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_includes/components/maps/markets-map.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_includes/components/maps/markets-map.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_includes/components/maps/markets-map.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_includes/components/maps/markets-map.html
sed -i '' 's/site.tags/site.dimensions/g' ./_includes/components/maps/markets-map.html
sed -i '' 's/page.tags/page.dimensions/g' ./_includes/components/maps/markets-map.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_includes/components/maps/markets-map.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_includes/components/carousels/featured-brands-carousel.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_includes/components/carousels/featured-brands-carousel.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_includes/components/carousels/featured-brands-carousel.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_includes/components/carousels/featured-brands-carousel.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_includes/components/carousels/featured-brands-carousel.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_includes/components/carousels/featured-brands-carousel.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_includes/components/carousels/featured-brands-carousel.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_includes/components/carousels/featured-brands-carousel.html
sed -i '' 's/site.tags/site.dimensions/g' ./_includes/components/carousels/featured-brands-carousel.html
sed -i '' 's/page.tags/page.dimensions/g' ./_includes/components/carousels/featured-brands-carousel.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_includes/components/carousels/featured-brands-carousel.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_includes/components/forms/form.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_includes/components/forms/form.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_includes/components/forms/form.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_includes/components/forms/form.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_includes/components/forms/form.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_includes/components/forms/form.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_includes/components/forms/form.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_includes/components/forms/form.html
sed -i '' 's/site.tags/site.dimensions/g' ./_includes/components/forms/form.html
sed -i '' 's/page.tags/page.dimensions/g' ./_includes/components/forms/form.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_includes/components/forms/form.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_includes/components/buttons/button.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_includes/components/buttons/button.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_includes/components/buttons/button.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_includes/components/buttons/button.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_includes/components/buttons/button.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_includes/components/buttons/button.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_includes/components/buttons/button.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_includes/components/buttons/button.html
sed -i '' 's/site.tags/site.dimensions/g' ./_includes/components/buttons/button.html
sed -i '' 's/page.tags/page.dimensions/g' ./_includes/components/buttons/button.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_includes/components/buttons/button.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_includes/components/images/brand-image.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_includes/components/images/brand-image.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_includes/components/images/brand-image.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_includes/components/images/brand-image.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_includes/components/images/brand-image.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_includes/components/images/brand-image.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_includes/components/images/brand-image.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_includes/components/images/brand-image.html
sed -i '' 's/site.tags/site.dimensions/g' ./_includes/components/images/brand-image.html
sed -i '' 's/page.tags/page.dimensions/g' ./_includes/components/images/brand-image.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_includes/components/images/brand-image.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_includes/components/images/responsive-image.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_includes/components/images/responsive-image.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_includes/components/images/responsive-image.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_includes/components/images/responsive-image.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_includes/components/images/responsive-image.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_includes/components/images/responsive-image.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_includes/components/images/responsive-image.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_includes/components/images/responsive-image.html
sed -i '' 's/site.tags/site.dimensions/g' ./_includes/components/images/responsive-image.html
sed -i '' 's/page.tags/page.dimensions/g' ./_includes/components/images/responsive-image.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_includes/components/images/responsive-image.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_includes/components/images/image-attribution.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_includes/components/images/image-attribution.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_includes/components/images/image-attribution.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_includes/components/images/image-attribution.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_includes/components/images/image-attribution.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_includes/components/images/image-attribution.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_includes/components/images/image-attribution.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_includes/components/images/image-attribution.html
sed -i '' 's/site.tags/site.dimensions/g' ./_includes/components/images/image-attribution.html
sed -i '' 's/page.tags/page.dimensions/g' ./_includes/components/images/image-attribution.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_includes/components/images/image-attribution.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_includes/components/images/site-image.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_includes/components/images/site-image.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_includes/components/images/site-image.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_includes/components/images/site-image.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_includes/components/images/site-image.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_includes/components/images/site-image.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_includes/components/images/site-image.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_includes/components/images/site-image.html
sed -i '' 's/site.tags/site.dimensions/g' ./_includes/components/images/site-image.html
sed -i '' 's/page.tags/page.dimensions/g' ./_includes/components/images/site-image.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_includes/components/images/site-image.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_includes/components/indicators/content-type-indicator.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_includes/components/indicators/content-type-indicator.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_includes/components/indicators/content-type-indicator.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_includes/components/indicators/content-type-indicator.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_includes/components/indicators/content-type-indicator.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_includes/components/indicators/content-type-indicator.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_includes/components/indicators/content-type-indicator.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_includes/components/indicators/content-type-indicator.html
sed -i '' 's/site.tags/site.dimensions/g' ./_includes/components/indicators/content-type-indicator.html
sed -i '' 's/page.tags/page.dimensions/g' ./_includes/components/indicators/content-type-indicator.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_includes/components/indicators/content-type-indicator.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_includes/components/cards/brand-card.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_includes/components/cards/brand-card.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_includes/components/cards/brand-card.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_includes/components/cards/brand-card.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_includes/components/cards/brand-card.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_includes/components/cards/brand-card.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_includes/components/cards/brand-card.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_includes/components/cards/brand-card.html
sed -i '' 's/site.tags/site.dimensions/g' ./_includes/components/cards/brand-card.html
sed -i '' 's/page.tags/page.dimensions/g' ./_includes/components/cards/brand-card.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_includes/components/cards/brand-card.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_includes/components/cards/featured-brand.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_includes/components/cards/featured-brand.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_includes/components/cards/featured-brand.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_includes/components/cards/featured-brand.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_includes/components/cards/featured-brand.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_includes/components/cards/featured-brand.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_includes/components/cards/featured-brand.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_includes/components/cards/featured-brand.html
sed -i '' 's/site.tags/site.dimensions/g' ./_includes/components/cards/featured-brand.html
sed -i '' 's/page.tags/page.dimensions/g' ./_includes/components/cards/featured-brand.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_includes/components/cards/featured-brand.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_includes/components/cards/insight-card.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_includes/components/cards/insight-card.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_includes/components/cards/insight-card.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_includes/components/cards/insight-card.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_includes/components/cards/insight-card.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_includes/components/cards/insight-card.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_includes/components/cards/insight-card.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_includes/components/cards/insight-card.html
sed -i '' 's/site.tags/site.dimensions/g' ./_includes/components/cards/insight-card.html
sed -i '' 's/page.tags/page.dimensions/g' ./_includes/components/cards/insight-card.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_includes/components/cards/insight-card.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_includes/components/navigation/pagination.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_includes/components/navigation/pagination.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_includes/components/navigation/pagination.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_includes/components/navigation/pagination.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_includes/components/navigation/pagination.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_includes/components/navigation/pagination.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_includes/components/navigation/pagination.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_includes/components/navigation/pagination.html
sed -i '' 's/site.tags/site.dimensions/g' ./_includes/components/navigation/pagination.html
sed -i '' 's/page.tags/page.dimensions/g' ./_includes/components/navigation/pagination.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_includes/components/navigation/pagination.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_includes/components/navigation/language-selector.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_includes/components/navigation/language-selector.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_includes/components/navigation/language-selector.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_includes/components/navigation/language-selector.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_includes/components/navigation/language-selector.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_includes/components/navigation/language-selector.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_includes/components/navigation/language-selector.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_includes/components/navigation/language-selector.html
sed -i '' 's/site.tags/site.dimensions/g' ./_includes/components/navigation/language-selector.html
sed -i '' 's/page.tags/page.dimensions/g' ./_includes/components/navigation/language-selector.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_includes/components/navigation/language-selector.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_includes/components/navigation/navigation.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_includes/components/navigation/navigation.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_includes/components/navigation/navigation.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_includes/components/navigation/navigation.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_includes/components/navigation/navigation.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_includes/components/navigation/navigation.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_includes/components/navigation/navigation.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_includes/components/navigation/navigation.html
sed -i '' 's/site.tags/site.dimensions/g' ./_includes/components/navigation/navigation.html
sed -i '' 's/page.tags/page.dimensions/g' ./_includes/components/navigation/navigation.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_includes/components/navigation/navigation.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_includes/components/content/featured-content.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_includes/components/content/featured-content.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_includes/components/content/featured-content.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_includes/components/content/featured-content.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_includes/components/content/featured-content.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_includes/components/content/featured-content.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_includes/components/content/featured-content.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_includes/components/content/featured-content.html
sed -i '' 's/site.tags/site.dimensions/g' ./_includes/components/content/featured-content.html
sed -i '' 's/page.tags/page.dimensions/g' ./_includes/components/content/featured-content.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_includes/components/content/featured-content.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_includes/components/search/search-filter.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_includes/components/search/search-filter.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_includes/components/search/search-filter.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_includes/components/search/search-filter.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_includes/components/search/search-filter.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_includes/components/search/search-filter.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_includes/components/search/search-filter.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_includes/components/search/search-filter.html
sed -i '' 's/site.tags/site.dimensions/g' ./_includes/components/search/search-filter.html
sed -i '' 's/page.tags/page.dimensions/g' ./_includes/components/search/search-filter.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_includes/components/search/search-filter.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_includes/components/search/simple-search.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_includes/components/search/simple-search.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_includes/components/search/simple-search.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_includes/components/search/simple-search.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_includes/components/search/simple-search.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_includes/components/search/simple-search.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_includes/components/search/simple-search.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_includes/components/search/simple-search.html
sed -i '' 's/site.tags/site.dimensions/g' ./_includes/components/search/simple-search.html
sed -i '' 's/page.tags/page.dimensions/g' ./_includes/components/search/simple-search.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_includes/components/search/simple-search.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_includes/components/icons/icon.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_includes/components/icons/icon.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_includes/components/icons/icon.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_includes/components/icons/icon.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_includes/components/icons/icon.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_includes/components/icons/icon.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_includes/components/icons/icon.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_includes/components/icons/icon.html
sed -i '' 's/site.tags/site.dimensions/g' ./_includes/components/icons/icon.html
sed -i '' 's/page.tags/page.dimensions/g' ./_includes/components/icons/icon.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_includes/components/icons/icon.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_includes/styleguide/code-example.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_includes/styleguide/code-example.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_includes/styleguide/code-example.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_includes/styleguide/code-example.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_includes/styleguide/code-example.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_includes/styleguide/code-example.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_includes/styleguide/code-example.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_includes/styleguide/code-example.html
sed -i '' 's/site.tags/site.dimensions/g' ./_includes/styleguide/code-example.html
sed -i '' 's/page.tags/page.dimensions/g' ./_includes/styleguide/code-example.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_includes/styleguide/code-example.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_includes/styleguide/type-sample.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_includes/styleguide/type-sample.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_includes/styleguide/type-sample.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_includes/styleguide/type-sample.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_includes/styleguide/type-sample.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_includes/styleguide/type-sample.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_includes/styleguide/type-sample.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_includes/styleguide/type-sample.html
sed -i '' 's/site.tags/site.dimensions/g' ./_includes/styleguide/type-sample.html
sed -i '' 's/page.tags/page.dimensions/g' ./_includes/styleguide/type-sample.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_includes/styleguide/type-sample.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_includes/styleguide/color-swatch.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_includes/styleguide/color-swatch.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_includes/styleguide/color-swatch.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_includes/styleguide/color-swatch.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_includes/styleguide/color-swatch.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_includes/styleguide/color-swatch.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_includes/styleguide/color-swatch.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_includes/styleguide/color-swatch.html
sed -i '' 's/site.tags/site.dimensions/g' ./_includes/styleguide/color-swatch.html
sed -i '' 's/page.tags/page.dimensions/g' ./_includes/styleguide/color-swatch.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_includes/styleguide/color-swatch.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_includes/icons/icon.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_includes/icons/icon.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_includes/icons/icon.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_includes/icons/icon.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_includes/icons/icon.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_includes/icons/icon.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_includes/icons/icon.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_includes/icons/icon.html
sed -i '' 's/site.tags/site.dimensions/g' ./_includes/icons/icon.html
sed -i '' 's/page.tags/page.dimensions/g' ./_includes/icons/icon.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_includes/icons/icon.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_includes/collections/insights/insights-feed.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_includes/collections/insights/insights-feed.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_includes/collections/insights/insights-feed.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_includes/collections/insights/insights-feed.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_includes/collections/insights/insights-feed.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_includes/collections/insights/insights-feed.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_includes/collections/insights/insights-feed.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_includes/collections/insights/insights-feed.html
sed -i '' 's/site.tags/site.dimensions/g' ./_includes/collections/insights/insights-feed.html
sed -i '' 's/page.tags/page.dimensions/g' ./_includes/collections/insights/insights-feed.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_includes/collections/insights/insights-feed.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_includes/collections/insights/latest-insights-grid.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_includes/collections/insights/latest-insights-grid.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_includes/collections/insights/latest-insights-grid.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_includes/collections/insights/latest-insights-grid.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_includes/collections/insights/latest-insights-grid.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_includes/collections/insights/latest-insights-grid.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_includes/collections/insights/latest-insights-grid.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_includes/collections/insights/latest-insights-grid.html
sed -i '' 's/site.tags/site.dimensions/g' ./_includes/collections/insights/latest-insights-grid.html
sed -i '' 's/page.tags/page.dimensions/g' ./_includes/collections/insights/latest-insights-grid.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_includes/collections/insights/latest-insights-grid.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_includes/collections/brands/related-brands-list.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_includes/collections/brands/related-brands-list.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_includes/collections/brands/related-brands-list.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_includes/collections/brands/related-brands-list.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_includes/collections/brands/related-brands-list.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_includes/collections/brands/related-brands-list.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_includes/collections/brands/related-brands-list.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_includes/collections/brands/related-brands-list.html
sed -i '' 's/site.tags/site.dimensions/g' ./_includes/collections/brands/related-brands-list.html
sed -i '' 's/page.tags/page.dimensions/g' ./_includes/collections/brands/related-brands-list.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_includes/collections/brands/related-brands-list.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_includes/collections/dimensions/discovery-dimensions-grid.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_includes/collections/dimensions/discovery-dimensions-grid.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_includes/collections/dimensions/discovery-dimensions-grid.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_includes/collections/dimensions/discovery-dimensions-grid.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_includes/collections/dimensions/discovery-dimensions-grid.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_includes/collections/dimensions/discovery-dimensions-grid.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_includes/collections/dimensions/discovery-dimensions-grid.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_includes/collections/dimensions/discovery-dimensions-grid.html
sed -i '' 's/site.tags/site.dimensions/g' ./_includes/collections/dimensions/discovery-dimensions-grid.html
sed -i '' 's/page.tags/page.dimensions/g' ./_includes/collections/dimensions/discovery-dimensions-grid.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_includes/collections/dimensions/discovery-dimensions-grid.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_includes/collections/dimensions/dimension-cloud.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_includes/collections/dimensions/dimension-cloud.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_includes/collections/dimensions/dimension-cloud.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_includes/collections/dimensions/dimension-cloud.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_includes/collections/dimensions/dimension-cloud.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_includes/collections/dimensions/dimension-cloud.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_includes/collections/dimensions/dimension-cloud.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_includes/collections/dimensions/dimension-cloud.html
sed -i '' 's/site.tags/site.dimensions/g' ./_includes/collections/dimensions/dimension-cloud.html
sed -i '' 's/page.tags/page.dimensions/g' ./_includes/collections/dimensions/dimension-cloud.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_includes/collections/dimensions/dimension-cloud.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_includes/collections/dimensions/discovery-navigation.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_includes/collections/dimensions/discovery-navigation.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_includes/collections/dimensions/discovery-navigation.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_includes/collections/dimensions/discovery-navigation.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_includes/collections/dimensions/discovery-navigation.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_includes/collections/dimensions/discovery-navigation.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_includes/collections/dimensions/discovery-navigation.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_includes/collections/dimensions/discovery-navigation.html
sed -i '' 's/site.tags/site.dimensions/g' ./_includes/collections/dimensions/discovery-navigation.html
sed -i '' 's/page.tags/page.dimensions/g' ./_includes/collections/dimensions/discovery-navigation.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_includes/collections/dimensions/discovery-navigation.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_includes/collections/dimensions/dimension-list.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_includes/collections/dimensions/dimension-list.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_includes/collections/dimensions/dimension-list.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_includes/collections/dimensions/dimension-list.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_includes/collections/dimensions/dimension-list.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_includes/collections/dimensions/dimension-list.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_includes/collections/dimensions/dimension-list.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_includes/collections/dimensions/dimension-list.html
sed -i '' 's/site.tags/site.dimensions/g' ./_includes/collections/dimensions/dimension-list.html
sed -i '' 's/page.tags/page.dimensions/g' ./_includes/collections/dimensions/dimension-list.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_includes/collections/dimensions/dimension-list.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_scripts/_context_snippets/translation_workflow.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_scripts/_context_snippets/translation_workflow.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_scripts/_context_snippets/translation_workflow.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_scripts/_context_snippets/translation_workflow.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_scripts/_context_snippets/translation_workflow.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_scripts/_context_snippets/translation_workflow.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_scripts/_context_snippets/translation_workflow.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_scripts/_context_snippets/translation_workflow.md
sed -i '' 's/site.tags/site.dimensions/g' ./_scripts/_context_snippets/translation_workflow.md
sed -i '' 's/page.tags/page.dimensions/g' ./_scripts/_context_snippets/translation_workflow.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_scripts/_context_snippets/translation_workflow.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_scripts/_context_snippets/css_architecture.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_scripts/_context_snippets/css_architecture.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_scripts/_context_snippets/css_architecture.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_scripts/_context_snippets/css_architecture.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_scripts/_context_snippets/css_architecture.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_scripts/_context_snippets/css_architecture.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_scripts/_context_snippets/css_architecture.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_scripts/_context_snippets/css_architecture.md
sed -i '' 's/site.tags/site.dimensions/g' ./_scripts/_context_snippets/css_architecture.md
sed -i '' 's/page.tags/page.dimensions/g' ./_scripts/_context_snippets/css_architecture.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_scripts/_context_snippets/css_architecture.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_scripts/_context_snippets/progressive_context.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_scripts/_context_snippets/progressive_context.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_scripts/_context_snippets/progressive_context.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_scripts/_context_snippets/progressive_context.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_scripts/_context_snippets/progressive_context.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_scripts/_context_snippets/progressive_context.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_scripts/_context_snippets/progressive_context.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_scripts/_context_snippets/progressive_context.md
sed -i '' 's/site.tags/site.dimensions/g' ./_scripts/_context_snippets/progressive_context.md
sed -i '' 's/page.tags/page.dimensions/g' ./_scripts/_context_snippets/progressive_context.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_scripts/_context_snippets/progressive_context.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_scripts/_context_snippets/development_workflow.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_scripts/_context_snippets/development_workflow.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_scripts/_context_snippets/development_workflow.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_scripts/_context_snippets/development_workflow.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_scripts/_context_snippets/development_workflow.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_scripts/_context_snippets/development_workflow.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_scripts/_context_snippets/development_workflow.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_scripts/_context_snippets/development_workflow.md
sed -i '' 's/site.tags/site.dimensions/g' ./_scripts/_context_snippets/development_workflow.md
sed -i '' 's/page.tags/page.dimensions/g' ./_scripts/_context_snippets/development_workflow.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_scripts/_context_snippets/development_workflow.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_scripts/_context_snippets/site_structure.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_scripts/_context_snippets/site_structure.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_scripts/_context_snippets/site_structure.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_scripts/_context_snippets/site_structure.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_scripts/_context_snippets/site_structure.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_scripts/_context_snippets/site_structure.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_scripts/_context_snippets/site_structure.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_scripts/_context_snippets/site_structure.md
sed -i '' 's/site.tags/site.dimensions/g' ./_scripts/_context_snippets/site_structure.md
sed -i '' 's/page.tags/page.dimensions/g' ./_scripts/_context_snippets/site_structure.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_scripts/_context_snippets/site_structure.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_scripts/_context_snippets/component_examples.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_scripts/_context_snippets/component_examples.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_scripts/_context_snippets/component_examples.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_scripts/_context_snippets/component_examples.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_scripts/_context_snippets/component_examples.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_scripts/_context_snippets/component_examples.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_scripts/_context_snippets/component_examples.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_scripts/_context_snippets/component_examples.md
sed -i '' 's/site.tags/site.dimensions/g' ./_scripts/_context_snippets/component_examples.md
sed -i '' 's/page.tags/page.dimensions/g' ./_scripts/_context_snippets/component_examples.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_scripts/_context_snippets/component_examples.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_scripts/_context_snippets/navigation_structure.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_scripts/_context_snippets/navigation_structure.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_scripts/_context_snippets/navigation_structure.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_scripts/_context_snippets/navigation_structure.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_scripts/_context_snippets/navigation_structure.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_scripts/_context_snippets/navigation_structure.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_scripts/_context_snippets/navigation_structure.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_scripts/_context_snippets/navigation_structure.md
sed -i '' 's/site.tags/site.dimensions/g' ./_scripts/_context_snippets/navigation_structure.md
sed -i '' 's/page.tags/page.dimensions/g' ./_scripts/_context_snippets/navigation_structure.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_scripts/_context_snippets/navigation_structure.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_scripts/_context_snippets/layout_system.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_scripts/_context_snippets/layout_system.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_scripts/_context_snippets/layout_system.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_scripts/_context_snippets/layout_system.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_scripts/_context_snippets/layout_system.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_scripts/_context_snippets/layout_system.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_scripts/_context_snippets/layout_system.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_scripts/_context_snippets/layout_system.md
sed -i '' 's/site.tags/site.dimensions/g' ./_scripts/_context_snippets/layout_system.md
sed -i '' 's/page.tags/page.dimensions/g' ./_scripts/_context_snippets/layout_system.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_scripts/_context_snippets/layout_system.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_scripts/_context_snippets/multilingual_system.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_scripts/_context_snippets/multilingual_system.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_scripts/_context_snippets/multilingual_system.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_scripts/_context_snippets/multilingual_system.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_scripts/_context_snippets/multilingual_system.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_scripts/_context_snippets/multilingual_system.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_scripts/_context_snippets/multilingual_system.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_scripts/_context_snippets/multilingual_system.md
sed -i '' 's/site.tags/site.dimensions/g' ./_scripts/_context_snippets/multilingual_system.md
sed -i '' 's/page.tags/page.dimensions/g' ./_scripts/_context_snippets/multilingual_system.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_scripts/_context_snippets/multilingual_system.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_scripts/_context_snippets/jekyll_config.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_scripts/_context_snippets/jekyll_config.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_scripts/_context_snippets/jekyll_config.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_scripts/_context_snippets/jekyll_config.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_scripts/_context_snippets/jekyll_config.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_scripts/_context_snippets/jekyll_config.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_scripts/_context_snippets/jekyll_config.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_scripts/_context_snippets/jekyll_config.md
sed -i '' 's/site.tags/site.dimensions/g' ./_scripts/_context_snippets/jekyll_config.md
sed -i '' 's/page.tags/page.dimensions/g' ./_scripts/_context_snippets/jekyll_config.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_scripts/_context_snippets/jekyll_config.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_scripts/_context_snippets/tag_system.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_scripts/_context_snippets/tag_system.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_scripts/_context_snippets/tag_system.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_scripts/_context_snippets/tag_system.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_scripts/_context_snippets/tag_system.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_scripts/_context_snippets/tag_system.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_scripts/_context_snippets/tag_system.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_scripts/_context_snippets/tag_system.md
sed -i '' 's/site.tags/site.dimensions/g' ./_scripts/_context_snippets/tag_system.md
sed -i '' 's/page.tags/page.dimensions/g' ./_scripts/_context_snippets/tag_system.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_scripts/_context_snippets/tag_system.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_scripts/_context_snippets/design_tokens.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_scripts/_context_snippets/design_tokens.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_scripts/_context_snippets/design_tokens.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_scripts/_context_snippets/design_tokens.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_scripts/_context_snippets/design_tokens.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_scripts/_context_snippets/design_tokens.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_scripts/_context_snippets/design_tokens.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_scripts/_context_snippets/design_tokens.md
sed -i '' 's/site.tags/site.dimensions/g' ./_scripts/_context_snippets/design_tokens.md
sed -i '' 's/page.tags/page.dimensions/g' ./_scripts/_context_snippets/design_tokens.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_scripts/_context_snippets/design_tokens.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_scripts/_dev_journals/2025-03-13 carousel-implementation.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_scripts/_dev_journals/2025-03-13 carousel-implementation.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_scripts/_dev_journals/2025-03-13 carousel-implementation.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_scripts/_dev_journals/2025-03-13 carousel-implementation.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_scripts/_dev_journals/2025-03-13 carousel-implementation.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_scripts/_dev_journals/2025-03-13 carousel-implementation.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_scripts/_dev_journals/2025-03-13 carousel-implementation.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_scripts/_dev_journals/2025-03-13 carousel-implementation.md
sed -i '' 's/site.tags/site.dimensions/g' ./_scripts/_dev_journals/2025-03-13 carousel-implementation.md
sed -i '' 's/page.tags/page.dimensions/g' ./_scripts/_dev_journals/2025-03-13 carousel-implementation.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_scripts/_dev_journals/2025-03-13 carousel-implementation.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_scripts/_dev_journals/2025-03-16 brandmine-tag-system.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_scripts/_dev_journals/2025-03-16 brandmine-tag-system.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_scripts/_dev_journals/2025-03-16 brandmine-tag-system.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_scripts/_dev_journals/2025-03-16 brandmine-tag-system.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_scripts/_dev_journals/2025-03-16 brandmine-tag-system.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_scripts/_dev_journals/2025-03-16 brandmine-tag-system.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_scripts/_dev_journals/2025-03-16 brandmine-tag-system.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_scripts/_dev_journals/2025-03-16 brandmine-tag-system.md
sed -i '' 's/site.tags/site.dimensions/g' ./_scripts/_dev_journals/2025-03-16 brandmine-tag-system.md
sed -i '' 's/page.tags/page.dimensions/g' ./_scripts/_dev_journals/2025-03-16 brandmine-tag-system.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_scripts/_dev_journals/2025-03-16 brandmine-tag-system.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_scripts/_dev_journals/2025-04-02 dev-journal-css-assets.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_scripts/_dev_journals/2025-04-02 dev-journal-css-assets.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_scripts/_dev_journals/2025-04-02 dev-journal-css-assets.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_scripts/_dev_journals/2025-04-02 dev-journal-css-assets.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_scripts/_dev_journals/2025-04-02 dev-journal-css-assets.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_scripts/_dev_journals/2025-04-02 dev-journal-css-assets.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_scripts/_dev_journals/2025-04-02 dev-journal-css-assets.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_scripts/_dev_journals/2025-04-02 dev-journal-css-assets.md
sed -i '' 's/site.tags/site.dimensions/g' ./_scripts/_dev_journals/2025-04-02 dev-journal-css-assets.md
sed -i '' 's/page.tags/page.dimensions/g' ./_scripts/_dev_journals/2025-04-02 dev-journal-css-assets.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_scripts/_dev_journals/2025-04-02 dev-journal-css-assets.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_scripts/_dev_journals/2025-02-24 hero panel implementation-guide.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_scripts/_dev_journals/2025-02-24 hero panel implementation-guide.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_scripts/_dev_journals/2025-02-24 hero panel implementation-guide.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_scripts/_dev_journals/2025-02-24 hero panel implementation-guide.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_scripts/_dev_journals/2025-02-24 hero panel implementation-guide.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_scripts/_dev_journals/2025-02-24 hero panel implementation-guide.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_scripts/_dev_journals/2025-02-24 hero panel implementation-guide.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_scripts/_dev_journals/2025-02-24 hero panel implementation-guide.md
sed -i '' 's/site.tags/site.dimensions/g' ./_scripts/_dev_journals/2025-02-24 hero panel implementation-guide.md
sed -i '' 's/page.tags/page.dimensions/g' ./_scripts/_dev_journals/2025-02-24 hero panel implementation-guide.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_scripts/_dev_journals/2025-02-24 hero panel implementation-guide.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_scripts/_dev_journals/2025-03-18-Mobile-Responsive-Design-Fixes.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_scripts/_dev_journals/2025-03-18-Mobile-Responsive-Design-Fixes.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_scripts/_dev_journals/2025-03-18-Mobile-Responsive-Design-Fixes.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_scripts/_dev_journals/2025-03-18-Mobile-Responsive-Design-Fixes.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_scripts/_dev_journals/2025-03-18-Mobile-Responsive-Design-Fixes.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_scripts/_dev_journals/2025-03-18-Mobile-Responsive-Design-Fixes.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_scripts/_dev_journals/2025-03-18-Mobile-Responsive-Design-Fixes.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_scripts/_dev_journals/2025-03-18-Mobile-Responsive-Design-Fixes.md
sed -i '' 's/site.tags/site.dimensions/g' ./_scripts/_dev_journals/2025-03-18-Mobile-Responsive-Design-Fixes.md
sed -i '' 's/page.tags/page.dimensions/g' ./_scripts/_dev_journals/2025-03-18-Mobile-Responsive-Design-Fixes.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_scripts/_dev_journals/2025-03-18-Mobile-Responsive-Design-Fixes.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_scripts/_dev_journals/2025-03-12 Multilingual tally-form-integration.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_scripts/_dev_journals/2025-03-12 Multilingual tally-form-integration.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_scripts/_dev_journals/2025-03-12 Multilingual tally-form-integration.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_scripts/_dev_journals/2025-03-12 Multilingual tally-form-integration.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_scripts/_dev_journals/2025-03-12 Multilingual tally-form-integration.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_scripts/_dev_journals/2025-03-12 Multilingual tally-form-integration.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_scripts/_dev_journals/2025-03-12 Multilingual tally-form-integration.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_scripts/_dev_journals/2025-03-12 Multilingual tally-form-integration.md
sed -i '' 's/site.tags/site.dimensions/g' ./_scripts/_dev_journals/2025-03-12 Multilingual tally-form-integration.md
sed -i '' 's/page.tags/page.dimensions/g' ./_scripts/_dev_journals/2025-03-12 Multilingual tally-form-integration.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_scripts/_dev_journals/2025-03-12 Multilingual tally-form-integration.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_scripts/_dev_journals/2025-03-25_DevJournal_CSS_Grid_Styleguide.md.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_scripts/_dev_journals/2025-03-25_DevJournal_CSS_Grid_Styleguide.md.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_scripts/_dev_journals/2025-03-25_DevJournal_CSS_Grid_Styleguide.md.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_scripts/_dev_journals/2025-03-25_DevJournal_CSS_Grid_Styleguide.md.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_scripts/_dev_journals/2025-03-25_DevJournal_CSS_Grid_Styleguide.md.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_scripts/_dev_journals/2025-03-25_DevJournal_CSS_Grid_Styleguide.md.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_scripts/_dev_journals/2025-03-25_DevJournal_CSS_Grid_Styleguide.md.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_scripts/_dev_journals/2025-03-25_DevJournal_CSS_Grid_Styleguide.md.md
sed -i '' 's/site.tags/site.dimensions/g' ./_scripts/_dev_journals/2025-03-25_DevJournal_CSS_Grid_Styleguide.md.md
sed -i '' 's/page.tags/page.dimensions/g' ./_scripts/_dev_journals/2025-03-25_DevJournal_CSS_Grid_Styleguide.md.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_scripts/_dev_journals/2025-03-25_DevJournal_CSS_Grid_Styleguide.md.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_scripts/_dev_journals/2025-03-28_DevJournal_HomePageRedesign.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_scripts/_dev_journals/2025-03-28_DevJournal_HomePageRedesign.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_scripts/_dev_journals/2025-03-28_DevJournal_HomePageRedesign.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_scripts/_dev_journals/2025-03-28_DevJournal_HomePageRedesign.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_scripts/_dev_journals/2025-03-28_DevJournal_HomePageRedesign.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_scripts/_dev_journals/2025-03-28_DevJournal_HomePageRedesign.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_scripts/_dev_journals/2025-03-28_DevJournal_HomePageRedesign.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_scripts/_dev_journals/2025-03-28_DevJournal_HomePageRedesign.md
sed -i '' 's/site.tags/site.dimensions/g' ./_scripts/_dev_journals/2025-03-28_DevJournal_HomePageRedesign.md
sed -i '' 's/page.tags/page.dimensions/g' ./_scripts/_dev_journals/2025-03-28_DevJournal_HomePageRedesign.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_scripts/_dev_journals/2025-03-28_DevJournal_HomePageRedesign.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_scripts/_dev_journals/2025-03-21 personal blog jekyll-development-journal.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_scripts/_dev_journals/2025-03-21 personal blog jekyll-development-journal.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_scripts/_dev_journals/2025-03-21 personal blog jekyll-development-journal.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_scripts/_dev_journals/2025-03-21 personal blog jekyll-development-journal.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_scripts/_dev_journals/2025-03-21 personal blog jekyll-development-journal.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_scripts/_dev_journals/2025-03-21 personal blog jekyll-development-journal.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_scripts/_dev_journals/2025-03-21 personal blog jekyll-development-journal.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_scripts/_dev_journals/2025-03-21 personal blog jekyll-development-journal.md
sed -i '' 's/site.tags/site.dimensions/g' ./_scripts/_dev_journals/2025-03-21 personal blog jekyll-development-journal.md
sed -i '' 's/page.tags/page.dimensions/g' ./_scripts/_dev_journals/2025-03-21 personal blog jekyll-development-journal.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_scripts/_dev_journals/2025-03-21 personal blog jekyll-development-journal.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_scripts/_dev_journals/2025-03-25 brandmine-site-strategy.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_scripts/_dev_journals/2025-03-25 brandmine-site-strategy.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_scripts/_dev_journals/2025-03-25 brandmine-site-strategy.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_scripts/_dev_journals/2025-03-25 brandmine-site-strategy.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_scripts/_dev_journals/2025-03-25 brandmine-site-strategy.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_scripts/_dev_journals/2025-03-25 brandmine-site-strategy.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_scripts/_dev_journals/2025-03-25 brandmine-site-strategy.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_scripts/_dev_journals/2025-03-25 brandmine-site-strategy.md
sed -i '' 's/site.tags/site.dimensions/g' ./_scripts/_dev_journals/2025-03-25 brandmine-site-strategy.md
sed -i '' 's/page.tags/page.dimensions/g' ./_scripts/_dev_journals/2025-03-25 brandmine-site-strategy.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_scripts/_dev_journals/2025-03-25 brandmine-site-strategy.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_scripts/_dev_journals/2025-03-24_DevJournal_StyleGuide.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_scripts/_dev_journals/2025-03-24_DevJournal_StyleGuide.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_scripts/_dev_journals/2025-03-24_DevJournal_StyleGuide.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_scripts/_dev_journals/2025-03-24_DevJournal_StyleGuide.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_scripts/_dev_journals/2025-03-24_DevJournal_StyleGuide.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_scripts/_dev_journals/2025-03-24_DevJournal_StyleGuide.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_scripts/_dev_journals/2025-03-24_DevJournal_StyleGuide.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_scripts/_dev_journals/2025-03-24_DevJournal_StyleGuide.md
sed -i '' 's/site.tags/site.dimensions/g' ./_scripts/_dev_journals/2025-03-24_DevJournal_StyleGuide.md
sed -i '' 's/page.tags/page.dimensions/g' ./_scripts/_dev_journals/2025-03-24_DevJournal_StyleGuide.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_scripts/_dev_journals/2025-03-24_DevJournal_StyleGuide.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_scripts/_dev_journals/2025-03-16 brandmine-blog-structure-summary.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_scripts/_dev_journals/2025-03-16 brandmine-blog-structure-summary.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_scripts/_dev_journals/2025-03-16 brandmine-blog-structure-summary.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_scripts/_dev_journals/2025-03-16 brandmine-blog-structure-summary.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_scripts/_dev_journals/2025-03-16 brandmine-blog-structure-summary.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_scripts/_dev_journals/2025-03-16 brandmine-blog-structure-summary.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_scripts/_dev_journals/2025-03-16 brandmine-blog-structure-summary.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_scripts/_dev_journals/2025-03-16 brandmine-blog-structure-summary.md
sed -i '' 's/site.tags/site.dimensions/g' ./_scripts/_dev_journals/2025-03-16 brandmine-blog-structure-summary.md
sed -i '' 's/page.tags/page.dimensions/g' ./_scripts/_dev_journals/2025-03-16 brandmine-blog-structure-summary.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_scripts/_dev_journals/2025-03-16 brandmine-blog-structure-summary.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_scripts/_dev_journals/2025-03-14 css-reorganization-journal.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_scripts/_dev_journals/2025-03-14 css-reorganization-journal.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_scripts/_dev_journals/2025-03-14 css-reorganization-journal.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_scripts/_dev_journals/2025-03-14 css-reorganization-journal.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_scripts/_dev_journals/2025-03-14 css-reorganization-journal.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_scripts/_dev_journals/2025-03-14 css-reorganization-journal.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_scripts/_dev_journals/2025-03-14 css-reorganization-journal.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_scripts/_dev_journals/2025-03-14 css-reorganization-journal.md
sed -i '' 's/site.tags/site.dimensions/g' ./_scripts/_dev_journals/2025-03-14 css-reorganization-journal.md
sed -i '' 's/page.tags/page.dimensions/g' ./_scripts/_dev_journals/2025-03-14 css-reorganization-journal.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_scripts/_dev_journals/2025-03-14 css-reorganization-journal.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_scripts/_dev_journals/2025-03-17 brandmine-mobile-fixes-journal.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_scripts/_dev_journals/2025-03-17 brandmine-mobile-fixes-journal.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_scripts/_dev_journals/2025-03-17 brandmine-mobile-fixes-journal.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_scripts/_dev_journals/2025-03-17 brandmine-mobile-fixes-journal.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_scripts/_dev_journals/2025-03-17 brandmine-mobile-fixes-journal.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_scripts/_dev_journals/2025-03-17 brandmine-mobile-fixes-journal.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_scripts/_dev_journals/2025-03-17 brandmine-mobile-fixes-journal.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_scripts/_dev_journals/2025-03-17 brandmine-mobile-fixes-journal.md
sed -i '' 's/site.tags/site.dimensions/g' ./_scripts/_dev_journals/2025-03-17 brandmine-mobile-fixes-journal.md
sed -i '' 's/page.tags/page.dimensions/g' ./_scripts/_dev_journals/2025-03-17 brandmine-mobile-fixes-journal.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_scripts/_dev_journals/2025-03-17 brandmine-mobile-fixes-journal.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_scripts/_dev_journals/2025-04-08_DevJournal_About_Page_Styling.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_scripts/_dev_journals/2025-04-08_DevJournal_About_Page_Styling.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_scripts/_dev_journals/2025-04-08_DevJournal_About_Page_Styling.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_scripts/_dev_journals/2025-04-08_DevJournal_About_Page_Styling.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_scripts/_dev_journals/2025-04-08_DevJournal_About_Page_Styling.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_scripts/_dev_journals/2025-04-08_DevJournal_About_Page_Styling.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_scripts/_dev_journals/2025-04-08_DevJournal_About_Page_Styling.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_scripts/_dev_journals/2025-04-08_DevJournal_About_Page_Styling.md
sed -i '' 's/site.tags/site.dimensions/g' ./_scripts/_dev_journals/2025-04-08_DevJournal_About_Page_Styling.md
sed -i '' 's/page.tags/page.dimensions/g' ./_scripts/_dev_journals/2025-04-08_DevJournal_About_Page_Styling.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_scripts/_dev_journals/2025-04-08_DevJournal_About_Page_Styling.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_scripts/_dev_journals/2025-03-27 dev-journal-styleguide-fixes.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_scripts/_dev_journals/2025-03-27 dev-journal-styleguide-fixes.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_scripts/_dev_journals/2025-03-27 dev-journal-styleguide-fixes.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_scripts/_dev_journals/2025-03-27 dev-journal-styleguide-fixes.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_scripts/_dev_journals/2025-03-27 dev-journal-styleguide-fixes.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_scripts/_dev_journals/2025-03-27 dev-journal-styleguide-fixes.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_scripts/_dev_journals/2025-03-27 dev-journal-styleguide-fixes.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_scripts/_dev_journals/2025-03-27 dev-journal-styleguide-fixes.md
sed -i '' 's/site.tags/site.dimensions/g' ./_scripts/_dev_journals/2025-03-27 dev-journal-styleguide-fixes.md
sed -i '' 's/page.tags/page.dimensions/g' ./_scripts/_dev_journals/2025-03-27 dev-journal-styleguide-fixes.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_scripts/_dev_journals/2025-03-27 dev-journal-styleguide-fixes.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_scripts/_dev_journals/2025-04-02 technical-context v2.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_scripts/_dev_journals/2025-04-02 technical-context v2.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_scripts/_dev_journals/2025-04-02 technical-context v2.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_scripts/_dev_journals/2025-04-02 technical-context v2.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_scripts/_dev_journals/2025-04-02 technical-context v2.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_scripts/_dev_journals/2025-04-02 technical-context v2.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_scripts/_dev_journals/2025-04-02 technical-context v2.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_scripts/_dev_journals/2025-04-02 technical-context v2.md
sed -i '' 's/site.tags/site.dimensions/g' ./_scripts/_dev_journals/2025-04-02 technical-context v2.md
sed -i '' 's/page.tags/page.dimensions/g' ./_scripts/_dev_journals/2025-04-02 technical-context v2.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_scripts/_dev_journals/2025-04-02 technical-context v2.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_scripts/_dev_journals/2025-03-16 brandmine-blog-implementation.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_scripts/_dev_journals/2025-03-16 brandmine-blog-implementation.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_scripts/_dev_journals/2025-03-16 brandmine-blog-implementation.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_scripts/_dev_journals/2025-03-16 brandmine-blog-implementation.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_scripts/_dev_journals/2025-03-16 brandmine-blog-implementation.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_scripts/_dev_journals/2025-03-16 brandmine-blog-implementation.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_scripts/_dev_journals/2025-03-16 brandmine-blog-implementation.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_scripts/_dev_journals/2025-03-16 brandmine-blog-implementation.md
sed -i '' 's/site.tags/site.dimensions/g' ./_scripts/_dev_journals/2025-03-16 brandmine-blog-implementation.md
sed -i '' 's/page.tags/page.dimensions/g' ./_scripts/_dev_journals/2025-03-16 brandmine-blog-implementation.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_scripts/_dev_journals/2025-03-16 brandmine-blog-implementation.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_scripts/_dev_journals/2025-04-19 dev-journal image processing scripts.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_scripts/_dev_journals/2025-04-19 dev-journal image processing scripts.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_scripts/_dev_journals/2025-04-19 dev-journal image processing scripts.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_scripts/_dev_journals/2025-04-19 dev-journal image processing scripts.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_scripts/_dev_journals/2025-04-19 dev-journal image processing scripts.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_scripts/_dev_journals/2025-04-19 dev-journal image processing scripts.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_scripts/_dev_journals/2025-04-19 dev-journal image processing scripts.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_scripts/_dev_journals/2025-04-19 dev-journal image processing scripts.md
sed -i '' 's/site.tags/site.dimensions/g' ./_scripts/_dev_journals/2025-04-19 dev-journal image processing scripts.md
sed -i '' 's/page.tags/page.dimensions/g' ./_scripts/_dev_journals/2025-04-19 dev-journal image processing scripts.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_scripts/_dev_journals/2025-04-19 dev-journal image processing scripts.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_scripts/_dev_journals/2025-04-10 dev-journal-brandmine-strategy.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_scripts/_dev_journals/2025-04-10 dev-journal-brandmine-strategy.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_scripts/_dev_journals/2025-04-10 dev-journal-brandmine-strategy.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_scripts/_dev_journals/2025-04-10 dev-journal-brandmine-strategy.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_scripts/_dev_journals/2025-04-10 dev-journal-brandmine-strategy.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_scripts/_dev_journals/2025-04-10 dev-journal-brandmine-strategy.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_scripts/_dev_journals/2025-04-10 dev-journal-brandmine-strategy.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_scripts/_dev_journals/2025-04-10 dev-journal-brandmine-strategy.md
sed -i '' 's/site.tags/site.dimensions/g' ./_scripts/_dev_journals/2025-04-10 dev-journal-brandmine-strategy.md
sed -i '' 's/page.tags/page.dimensions/g' ./_scripts/_dev_journals/2025-04-10 dev-journal-brandmine-strategy.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_scripts/_dev_journals/2025-04-10 dev-journal-brandmine-strategy.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_scripts/_dev_journals/2025-03-13 homepage panel conversion and hero image.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_scripts/_dev_journals/2025-03-13 homepage panel conversion and hero image.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_scripts/_dev_journals/2025-03-13 homepage panel conversion and hero image.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_scripts/_dev_journals/2025-03-13 homepage panel conversion and hero image.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_scripts/_dev_journals/2025-03-13 homepage panel conversion and hero image.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_scripts/_dev_journals/2025-03-13 homepage panel conversion and hero image.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_scripts/_dev_journals/2025-03-13 homepage panel conversion and hero image.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_scripts/_dev_journals/2025-03-13 homepage panel conversion and hero image.md
sed -i '' 's/site.tags/site.dimensions/g' ./_scripts/_dev_journals/2025-03-13 homepage panel conversion and hero image.md
sed -i '' 's/page.tags/page.dimensions/g' ./_scripts/_dev_journals/2025-03-13 homepage panel conversion and hero image.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_scripts/_dev_journals/2025-03-13 homepage panel conversion and hero image.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_scripts/_dev_journals/2025-03-18-hamburger-menu-implementation.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_scripts/_dev_journals/2025-03-18-hamburger-menu-implementation.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_scripts/_dev_journals/2025-03-18-hamburger-menu-implementation.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_scripts/_dev_journals/2025-03-18-hamburger-menu-implementation.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_scripts/_dev_journals/2025-03-18-hamburger-menu-implementation.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_scripts/_dev_journals/2025-03-18-hamburger-menu-implementation.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_scripts/_dev_journals/2025-03-18-hamburger-menu-implementation.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_scripts/_dev_journals/2025-03-18-hamburger-menu-implementation.md
sed -i '' 's/site.tags/site.dimensions/g' ./_scripts/_dev_journals/2025-03-18-hamburger-menu-implementation.md
sed -i '' 's/page.tags/page.dimensions/g' ./_scripts/_dev_journals/2025-03-18-hamburger-menu-implementation.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_scripts/_dev_journals/2025-03-18-hamburger-menu-implementation.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_scripts/_dev_journals/2025-03-21 brandmine-tagging-strategy and implementation.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_scripts/_dev_journals/2025-03-21 brandmine-tagging-strategy and implementation.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_scripts/_dev_journals/2025-03-21 brandmine-tagging-strategy and implementation.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_scripts/_dev_journals/2025-03-21 brandmine-tagging-strategy and implementation.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_scripts/_dev_journals/2025-03-21 brandmine-tagging-strategy and implementation.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_scripts/_dev_journals/2025-03-21 brandmine-tagging-strategy and implementation.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_scripts/_dev_journals/2025-03-21 brandmine-tagging-strategy and implementation.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_scripts/_dev_journals/2025-03-21 brandmine-tagging-strategy and implementation.md
sed -i '' 's/site.tags/site.dimensions/g' ./_scripts/_dev_journals/2025-03-21 brandmine-tagging-strategy and implementation.md
sed -i '' 's/page.tags/page.dimensions/g' ./_scripts/_dev_journals/2025-03-21 brandmine-tagging-strategy and implementation.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_scripts/_dev_journals/2025-03-21 brandmine-tagging-strategy and implementation.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_scripts/_dev_journals/2025-03-22 development-journal-entry.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_scripts/_dev_journals/2025-03-22 development-journal-entry.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_scripts/_dev_journals/2025-03-22 development-journal-entry.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_scripts/_dev_journals/2025-03-22 development-journal-entry.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_scripts/_dev_journals/2025-03-22 development-journal-entry.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_scripts/_dev_journals/2025-03-22 development-journal-entry.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_scripts/_dev_journals/2025-03-22 development-journal-entry.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_scripts/_dev_journals/2025-03-22 development-journal-entry.md
sed -i '' 's/site.tags/site.dimensions/g' ./_scripts/_dev_journals/2025-03-22 development-journal-entry.md
sed -i '' 's/page.tags/page.dimensions/g' ./_scripts/_dev_journals/2025-03-22 development-journal-entry.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_scripts/_dev_journals/2025-03-22 development-journal-entry.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_scripts/_dev_journals/2025-04-08-multilingual-navigation-implementation.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_scripts/_dev_journals/2025-04-08-multilingual-navigation-implementation.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_scripts/_dev_journals/2025-04-08-multilingual-navigation-implementation.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_scripts/_dev_journals/2025-04-08-multilingual-navigation-implementation.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_scripts/_dev_journals/2025-04-08-multilingual-navigation-implementation.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_scripts/_dev_journals/2025-04-08-multilingual-navigation-implementation.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_scripts/_dev_journals/2025-04-08-multilingual-navigation-implementation.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_scripts/_dev_journals/2025-04-08-multilingual-navigation-implementation.md
sed -i '' 's/site.tags/site.dimensions/g' ./_scripts/_dev_journals/2025-04-08-multilingual-navigation-implementation.md
sed -i '' 's/page.tags/page.dimensions/g' ./_scripts/_dev_journals/2025-04-08-multilingual-navigation-implementation.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_scripts/_dev_journals/2025-04-08-multilingual-navigation-implementation.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_scripts/_dev_journals/2025-03-12 multilingual-tally-form-integration.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_scripts/_dev_journals/2025-03-12 multilingual-tally-form-integration.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_scripts/_dev_journals/2025-03-12 multilingual-tally-form-integration.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_scripts/_dev_journals/2025-03-12 multilingual-tally-form-integration.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_scripts/_dev_journals/2025-03-12 multilingual-tally-form-integration.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_scripts/_dev_journals/2025-03-12 multilingual-tally-form-integration.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_scripts/_dev_journals/2025-03-12 multilingual-tally-form-integration.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_scripts/_dev_journals/2025-03-12 multilingual-tally-form-integration.md
sed -i '' 's/site.tags/site.dimensions/g' ./_scripts/_dev_journals/2025-03-12 multilingual-tally-form-integration.md
sed -i '' 's/page.tags/page.dimensions/g' ./_scripts/_dev_journals/2025-03-12 multilingual-tally-form-integration.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_scripts/_dev_journals/2025-03-12 multilingual-tally-form-integration.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_scripts/_dev_journals/2025-03-27_DevJournal_Brand_Relationship_Terminology_Changes.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_scripts/_dev_journals/2025-03-27_DevJournal_Brand_Relationship_Terminology_Changes.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_scripts/_dev_journals/2025-03-27_DevJournal_Brand_Relationship_Terminology_Changes.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_scripts/_dev_journals/2025-03-27_DevJournal_Brand_Relationship_Terminology_Changes.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_scripts/_dev_journals/2025-03-27_DevJournal_Brand_Relationship_Terminology_Changes.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_scripts/_dev_journals/2025-03-27_DevJournal_Brand_Relationship_Terminology_Changes.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_scripts/_dev_journals/2025-03-27_DevJournal_Brand_Relationship_Terminology_Changes.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_scripts/_dev_journals/2025-03-27_DevJournal_Brand_Relationship_Terminology_Changes.md
sed -i '' 's/site.tags/site.dimensions/g' ./_scripts/_dev_journals/2025-03-27_DevJournal_Brand_Relationship_Terminology_Changes.md
sed -i '' 's/page.tags/page.dimensions/g' ./_scripts/_dev_journals/2025-03-27_DevJournal_Brand_Relationship_Terminology_Changes.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_scripts/_dev_journals/2025-03-27_DevJournal_Brand_Relationship_Terminology_Changes.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_scripts/_dev_journals/2025-03-23 Technical Briefing for Brandmine Implementation.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_scripts/_dev_journals/2025-03-23 Technical Briefing for Brandmine Implementation.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_scripts/_dev_journals/2025-03-23 Technical Briefing for Brandmine Implementation.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_scripts/_dev_journals/2025-03-23 Technical Briefing for Brandmine Implementation.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_scripts/_dev_journals/2025-03-23 Technical Briefing for Brandmine Implementation.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_scripts/_dev_journals/2025-03-23 Technical Briefing for Brandmine Implementation.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_scripts/_dev_journals/2025-03-23 Technical Briefing for Brandmine Implementation.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_scripts/_dev_journals/2025-03-23 Technical Briefing for Brandmine Implementation.md
sed -i '' 's/site.tags/site.dimensions/g' ./_scripts/_dev_journals/2025-03-23 Technical Briefing for Brandmine Implementation.md
sed -i '' 's/page.tags/page.dimensions/g' ./_scripts/_dev_journals/2025-03-23 Technical Briefing for Brandmine Implementation.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_scripts/_dev_journals/2025-03-23 Technical Briefing for Brandmine Implementation.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_scripts/_dev_journals/2025-03-14-about-page-styling-improvements.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_scripts/_dev_journals/2025-03-14-about-page-styling-improvements.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_scripts/_dev_journals/2025-03-14-about-page-styling-improvements.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_scripts/_dev_journals/2025-03-14-about-page-styling-improvements.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_scripts/_dev_journals/2025-03-14-about-page-styling-improvements.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_scripts/_dev_journals/2025-03-14-about-page-styling-improvements.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_scripts/_dev_journals/2025-03-14-about-page-styling-improvements.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_scripts/_dev_journals/2025-03-14-about-page-styling-improvements.md
sed -i '' 's/site.tags/site.dimensions/g' ./_scripts/_dev_journals/2025-03-14-about-page-styling-improvements.md
sed -i '' 's/page.tags/page.dimensions/g' ./_scripts/_dev_journals/2025-03-14-about-page-styling-improvements.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_scripts/_dev_journals/2025-03-14-about-page-styling-improvements.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_scripts/_dev_journals/2025-03-24 context snippets.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_scripts/_dev_journals/2025-03-24 context snippets.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_scripts/_dev_journals/2025-03-24 context snippets.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_scripts/_dev_journals/2025-03-24 context snippets.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_scripts/_dev_journals/2025-03-24 context snippets.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_scripts/_dev_journals/2025-03-24 context snippets.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_scripts/_dev_journals/2025-03-24 context snippets.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_scripts/_dev_journals/2025-03-24 context snippets.md
sed -i '' 's/site.tags/site.dimensions/g' ./_scripts/_dev_journals/2025-03-24 context snippets.md
sed -i '' 's/page.tags/page.dimensions/g' ./_scripts/_dev_journals/2025-03-24 context snippets.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_scripts/_dev_journals/2025-03-24 context snippets.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_scripts/_dev_journals/2025-03-13 vscode and test server.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_scripts/_dev_journals/2025-03-13 vscode and test server.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_scripts/_dev_journals/2025-03-13 vscode and test server.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_scripts/_dev_journals/2025-03-13 vscode and test server.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_scripts/_dev_journals/2025-03-13 vscode and test server.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_scripts/_dev_journals/2025-03-13 vscode and test server.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_scripts/_dev_journals/2025-03-13 vscode and test server.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_scripts/_dev_journals/2025-03-13 vscode and test server.md
sed -i '' 's/site.tags/site.dimensions/g' ./_scripts/_dev_journals/2025-03-13 vscode and test server.md
sed -i '' 's/page.tags/page.dimensions/g' ./_scripts/_dev_journals/2025-03-13 vscode and test server.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_scripts/_dev_journals/2025-03-13 vscode and test server.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_scripts/_dev_journals/2025-03-23 updated-implementation-guide-for-insights.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_scripts/_dev_journals/2025-03-23 updated-implementation-guide-for-insights.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_scripts/_dev_journals/2025-03-23 updated-implementation-guide-for-insights.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_scripts/_dev_journals/2025-03-23 updated-implementation-guide-for-insights.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_scripts/_dev_journals/2025-03-23 updated-implementation-guide-for-insights.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_scripts/_dev_journals/2025-03-23 updated-implementation-guide-for-insights.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_scripts/_dev_journals/2025-03-23 updated-implementation-guide-for-insights.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_scripts/_dev_journals/2025-03-23 updated-implementation-guide-for-insights.md
sed -i '' 's/site.tags/site.dimensions/g' ./_scripts/_dev_journals/2025-03-23 updated-implementation-guide-for-insights.md
sed -i '' 's/page.tags/page.dimensions/g' ./_scripts/_dev_journals/2025-03-23 updated-implementation-guide-for-insights.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_scripts/_dev_journals/2025-03-23 updated-implementation-guide-for-insights.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_scripts/_dev_journals/2025-04-10 brand profiles trilingual.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_scripts/_dev_journals/2025-04-10 brand profiles trilingual.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_scripts/_dev_journals/2025-04-10 brand profiles trilingual.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_scripts/_dev_journals/2025-04-10 brand profiles trilingual.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_scripts/_dev_journals/2025-04-10 brand profiles trilingual.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_scripts/_dev_journals/2025-04-10 brand profiles trilingual.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_scripts/_dev_journals/2025-04-10 brand profiles trilingual.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_scripts/_dev_journals/2025-04-10 brand profiles trilingual.md
sed -i '' 's/site.tags/site.dimensions/g' ./_scripts/_dev_journals/2025-04-10 brand profiles trilingual.md
sed -i '' 's/page.tags/page.dimensions/g' ./_scripts/_dev_journals/2025-04-10 brand profiles trilingual.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_scripts/_dev_journals/2025-04-10 brand profiles trilingual.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_scripts/_dev_journals/image-strategy.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_scripts/_dev_journals/image-strategy.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_scripts/_dev_journals/image-strategy.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_scripts/_dev_journals/image-strategy.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_scripts/_dev_journals/image-strategy.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_scripts/_dev_journals/image-strategy.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_scripts/_dev_journals/image-strategy.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_scripts/_dev_journals/image-strategy.md
sed -i '' 's/site.tags/site.dimensions/g' ./_scripts/_dev_journals/image-strategy.md
sed -i '' 's/page.tags/page.dimensions/g' ./_scripts/_dev_journals/image-strategy.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_scripts/_dev_journals/image-strategy.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_scripts/_dev_journals/2025-03-07 summary 1.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_scripts/_dev_journals/2025-03-07 summary 1.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_scripts/_dev_journals/2025-03-07 summary 1.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_scripts/_dev_journals/2025-03-07 summary 1.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_scripts/_dev_journals/2025-03-07 summary 1.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_scripts/_dev_journals/2025-03-07 summary 1.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_scripts/_dev_journals/2025-03-07 summary 1.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_scripts/_dev_journals/2025-03-07 summary 1.md
sed -i '' 's/site.tags/site.dimensions/g' ./_scripts/_dev_journals/2025-03-07 summary 1.md
sed -i '' 's/page.tags/page.dimensions/g' ./_scripts/_dev_journals/2025-03-07 summary 1.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_scripts/_dev_journals/2025-03-07 summary 1.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_scripts/_dev_journals/2025-03-24 dev-journal-styleguide-navigation.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_scripts/_dev_journals/2025-03-24 dev-journal-styleguide-navigation.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_scripts/_dev_journals/2025-03-24 dev-journal-styleguide-navigation.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_scripts/_dev_journals/2025-03-24 dev-journal-styleguide-navigation.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_scripts/_dev_journals/2025-03-24 dev-journal-styleguide-navigation.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_scripts/_dev_journals/2025-03-24 dev-journal-styleguide-navigation.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_scripts/_dev_journals/2025-03-24 dev-journal-styleguide-navigation.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_scripts/_dev_journals/2025-03-24 dev-journal-styleguide-navigation.md
sed -i '' 's/site.tags/site.dimensions/g' ./_scripts/_dev_journals/2025-03-24 dev-journal-styleguide-navigation.md
sed -i '' 's/page.tags/page.dimensions/g' ./_scripts/_dev_journals/2025-03-24 dev-journal-styleguide-navigation.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_scripts/_dev_journals/2025-03-24 dev-journal-styleguide-navigation.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_scripts/_dev_journals/2025-03-18 context-workflow.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_scripts/_dev_journals/2025-03-18 context-workflow.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_scripts/_dev_journals/2025-03-18 context-workflow.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_scripts/_dev_journals/2025-03-18 context-workflow.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_scripts/_dev_journals/2025-03-18 context-workflow.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_scripts/_dev_journals/2025-03-18 context-workflow.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_scripts/_dev_journals/2025-03-18 context-workflow.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_scripts/_dev_journals/2025-03-18 context-workflow.md
sed -i '' 's/site.tags/site.dimensions/g' ./_scripts/_dev_journals/2025-03-18 context-workflow.md
sed -i '' 's/page.tags/page.dimensions/g' ./_scripts/_dev_journals/2025-03-18 context-workflow.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_scripts/_dev_journals/2025-03-18 context-workflow.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_scripts/_dev_journals/2025-03-19-sector-prioritization-and-implementation.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_scripts/_dev_journals/2025-03-19-sector-prioritization-and-implementation.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_scripts/_dev_journals/2025-03-19-sector-prioritization-and-implementation.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_scripts/_dev_journals/2025-03-19-sector-prioritization-and-implementation.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_scripts/_dev_journals/2025-03-19-sector-prioritization-and-implementation.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_scripts/_dev_journals/2025-03-19-sector-prioritization-and-implementation.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_scripts/_dev_journals/2025-03-19-sector-prioritization-and-implementation.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_scripts/_dev_journals/2025-03-19-sector-prioritization-and-implementation.md
sed -i '' 's/site.tags/site.dimensions/g' ./_scripts/_dev_journals/2025-03-19-sector-prioritization-and-implementation.md
sed -i '' 's/page.tags/page.dimensions/g' ./_scripts/_dev_journals/2025-03-19-sector-prioritization-and-implementation.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_scripts/_dev_journals/2025-03-19-sector-prioritization-and-implementation.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_scripts/_dev_journals/2025-03-14 brandmine-css-analysis.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_scripts/_dev_journals/2025-03-14 brandmine-css-analysis.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_scripts/_dev_journals/2025-03-14 brandmine-css-analysis.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_scripts/_dev_journals/2025-03-14 brandmine-css-analysis.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_scripts/_dev_journals/2025-03-14 brandmine-css-analysis.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_scripts/_dev_journals/2025-03-14 brandmine-css-analysis.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_scripts/_dev_journals/2025-03-14 brandmine-css-analysis.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_scripts/_dev_journals/2025-03-14 brandmine-css-analysis.md
sed -i '' 's/site.tags/site.dimensions/g' ./_scripts/_dev_journals/2025-03-14 brandmine-css-analysis.md
sed -i '' 's/page.tags/page.dimensions/g' ./_scripts/_dev_journals/2025-03-14 brandmine-css-analysis.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_scripts/_dev_journals/2025-03-14 brandmine-css-analysis.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_scripts/_dev_journals/2025-03-16 css-variables-refactoring.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_scripts/_dev_journals/2025-03-16 css-variables-refactoring.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_scripts/_dev_journals/2025-03-16 css-variables-refactoring.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_scripts/_dev_journals/2025-03-16 css-variables-refactoring.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_scripts/_dev_journals/2025-03-16 css-variables-refactoring.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_scripts/_dev_journals/2025-03-16 css-variables-refactoring.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_scripts/_dev_journals/2025-03-16 css-variables-refactoring.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_scripts/_dev_journals/2025-03-16 css-variables-refactoring.md
sed -i '' 's/site.tags/site.dimensions/g' ./_scripts/_dev_journals/2025-03-16 css-variables-refactoring.md
sed -i '' 's/page.tags/page.dimensions/g' ./_scripts/_dev_journals/2025-03-16 css-variables-refactoring.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_scripts/_dev_journals/2025-03-16 css-variables-refactoring.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_scripts/_dev_journals/2025-23-28 dev-journal fixing the css after consolidation of tokens.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_scripts/_dev_journals/2025-23-28 dev-journal fixing the css after consolidation of tokens.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_scripts/_dev_journals/2025-23-28 dev-journal fixing the css after consolidation of tokens.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_scripts/_dev_journals/2025-23-28 dev-journal fixing the css after consolidation of tokens.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_scripts/_dev_journals/2025-23-28 dev-journal fixing the css after consolidation of tokens.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_scripts/_dev_journals/2025-23-28 dev-journal fixing the css after consolidation of tokens.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_scripts/_dev_journals/2025-23-28 dev-journal fixing the css after consolidation of tokens.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_scripts/_dev_journals/2025-23-28 dev-journal fixing the css after consolidation of tokens.md
sed -i '' 's/site.tags/site.dimensions/g' ./_scripts/_dev_journals/2025-23-28 dev-journal fixing the css after consolidation of tokens.md
sed -i '' 's/page.tags/page.dimensions/g' ./_scripts/_dev_journals/2025-23-28 dev-journal fixing the css after consolidation of tokens.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_scripts/_dev_journals/2025-23-28 dev-journal fixing the css after consolidation of tokens.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_scripts/_dev_journals/2025-04-08-brandmine-multilingual-changes-checklist.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_scripts/_dev_journals/2025-04-08-brandmine-multilingual-changes-checklist.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_scripts/_dev_journals/2025-04-08-brandmine-multilingual-changes-checklist.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_scripts/_dev_journals/2025-04-08-brandmine-multilingual-changes-checklist.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_scripts/_dev_journals/2025-04-08-brandmine-multilingual-changes-checklist.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_scripts/_dev_journals/2025-04-08-brandmine-multilingual-changes-checklist.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_scripts/_dev_journals/2025-04-08-brandmine-multilingual-changes-checklist.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_scripts/_dev_journals/2025-04-08-brandmine-multilingual-changes-checklist.md
sed -i '' 's/site.tags/site.dimensions/g' ./_scripts/_dev_journals/2025-04-08-brandmine-multilingual-changes-checklist.md
sed -i '' 's/page.tags/page.dimensions/g' ./_scripts/_dev_journals/2025-04-08-brandmine-multilingual-changes-checklist.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_scripts/_dev_journals/2025-04-08-brandmine-multilingual-changes-checklist.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_scripts/_dev_journals/2025-03-20-brandmine-mvp-strategy-journal.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_scripts/_dev_journals/2025-03-20-brandmine-mvp-strategy-journal.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_scripts/_dev_journals/2025-03-20-brandmine-mvp-strategy-journal.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_scripts/_dev_journals/2025-03-20-brandmine-mvp-strategy-journal.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_scripts/_dev_journals/2025-03-20-brandmine-mvp-strategy-journal.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_scripts/_dev_journals/2025-03-20-brandmine-mvp-strategy-journal.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_scripts/_dev_journals/2025-03-20-brandmine-mvp-strategy-journal.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_scripts/_dev_journals/2025-03-20-brandmine-mvp-strategy-journal.md
sed -i '' 's/site.tags/site.dimensions/g' ./_scripts/_dev_journals/2025-03-20-brandmine-mvp-strategy-journal.md
sed -i '' 's/page.tags/page.dimensions/g' ./_scripts/_dev_journals/2025-03-20-brandmine-mvp-strategy-journal.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_scripts/_dev_journals/2025-03-20-brandmine-mvp-strategy-journal.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_scripts/_dev_journals/2025-04-08-brandmine-navigation-management-guide.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_scripts/_dev_journals/2025-04-08-brandmine-navigation-management-guide.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_scripts/_dev_journals/2025-04-08-brandmine-navigation-management-guide.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_scripts/_dev_journals/2025-04-08-brandmine-navigation-management-guide.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_scripts/_dev_journals/2025-04-08-brandmine-navigation-management-guide.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_scripts/_dev_journals/2025-04-08-brandmine-navigation-management-guide.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_scripts/_dev_journals/2025-04-08-brandmine-navigation-management-guide.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_scripts/_dev_journals/2025-04-08-brandmine-navigation-management-guide.md
sed -i '' 's/site.tags/site.dimensions/g' ./_scripts/_dev_journals/2025-04-08-brandmine-navigation-management-guide.md
sed -i '' 's/page.tags/page.dimensions/g' ./_scripts/_dev_journals/2025-04-08-brandmine-navigation-management-guide.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_scripts/_dev_journals/2025-04-08-brandmine-navigation-management-guide.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_scripts/_dev_journals/2025-03-25_progressive-context-guide.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_scripts/_dev_journals/2025-03-25_progressive-context-guide.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_scripts/_dev_journals/2025-03-25_progressive-context-guide.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_scripts/_dev_journals/2025-03-25_progressive-context-guide.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_scripts/_dev_journals/2025-03-25_progressive-context-guide.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_scripts/_dev_journals/2025-03-25_progressive-context-guide.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_scripts/_dev_journals/2025-03-25_progressive-context-guide.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_scripts/_dev_journals/2025-03-25_progressive-context-guide.md
sed -i '' 's/site.tags/site.dimensions/g' ./_scripts/_dev_journals/2025-03-25_progressive-context-guide.md
sed -i '' 's/page.tags/page.dimensions/g' ./_scripts/_dev_journals/2025-03-25_progressive-context-guide.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_scripts/_dev_journals/2025-03-25_progressive-context-guide.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_scripts/_dev_journals/2025-03-20 jekyll-blog-setup-journal.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_scripts/_dev_journals/2025-03-20 jekyll-blog-setup-journal.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_scripts/_dev_journals/2025-03-20 jekyll-blog-setup-journal.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_scripts/_dev_journals/2025-03-20 jekyll-blog-setup-journal.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_scripts/_dev_journals/2025-03-20 jekyll-blog-setup-journal.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_scripts/_dev_journals/2025-03-20 jekyll-blog-setup-journal.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_scripts/_dev_journals/2025-03-20 jekyll-blog-setup-journal.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_scripts/_dev_journals/2025-03-20 jekyll-blog-setup-journal.md
sed -i '' 's/site.tags/site.dimensions/g' ./_scripts/_dev_journals/2025-03-20 jekyll-blog-setup-journal.md
sed -i '' 's/page.tags/page.dimensions/g' ./_scripts/_dev_journals/2025-03-20 jekyll-blog-setup-journal.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_scripts/_dev_journals/2025-03-20 jekyll-blog-setup-journal.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_scripts/_dev_journals/2025-03-13 brandmine-css-organization-guide-v2.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_scripts/_dev_journals/2025-03-13 brandmine-css-organization-guide-v2.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_scripts/_dev_journals/2025-03-13 brandmine-css-organization-guide-v2.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_scripts/_dev_journals/2025-03-13 brandmine-css-organization-guide-v2.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_scripts/_dev_journals/2025-03-13 brandmine-css-organization-guide-v2.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_scripts/_dev_journals/2025-03-13 brandmine-css-organization-guide-v2.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_scripts/_dev_journals/2025-03-13 brandmine-css-organization-guide-v2.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_scripts/_dev_journals/2025-03-13 brandmine-css-organization-guide-v2.md
sed -i '' 's/site.tags/site.dimensions/g' ./_scripts/_dev_journals/2025-03-13 brandmine-css-organization-guide-v2.md
sed -i '' 's/page.tags/page.dimensions/g' ./_scripts/_dev_journals/2025-03-13 brandmine-css-organization-guide-v2.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_scripts/_dev_journals/2025-03-13 brandmine-css-organization-guide-v2.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_scripts/_dev_journals/2025-03-21 jekyll-tag-implementation.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_scripts/_dev_journals/2025-03-21 jekyll-tag-implementation.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_scripts/_dev_journals/2025-03-21 jekyll-tag-implementation.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_scripts/_dev_journals/2025-03-21 jekyll-tag-implementation.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_scripts/_dev_journals/2025-03-21 jekyll-tag-implementation.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_scripts/_dev_journals/2025-03-21 jekyll-tag-implementation.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_scripts/_dev_journals/2025-03-21 jekyll-tag-implementation.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_scripts/_dev_journals/2025-03-21 jekyll-tag-implementation.md
sed -i '' 's/site.tags/site.dimensions/g' ./_scripts/_dev_journals/2025-03-21 jekyll-tag-implementation.md
sed -i '' 's/page.tags/page.dimensions/g' ./_scripts/_dev_journals/2025-03-21 jekyll-tag-implementation.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_scripts/_dev_journals/2025-03-21 jekyll-tag-implementation.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_scripts/_dev_journals/2025-04-02 dev-journal-revert-to-css.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_scripts/_dev_journals/2025-04-02 dev-journal-revert-to-css.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_scripts/_dev_journals/2025-04-02 dev-journal-revert-to-css.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_scripts/_dev_journals/2025-04-02 dev-journal-revert-to-css.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_scripts/_dev_journals/2025-04-02 dev-journal-revert-to-css.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_scripts/_dev_journals/2025-04-02 dev-journal-revert-to-css.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_scripts/_dev_journals/2025-04-02 dev-journal-revert-to-css.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_scripts/_dev_journals/2025-04-02 dev-journal-revert-to-css.md
sed -i '' 's/site.tags/site.dimensions/g' ./_scripts/_dev_journals/2025-04-02 dev-journal-revert-to-css.md
sed -i '' 's/page.tags/page.dimensions/g' ./_scripts/_dev_journals/2025-04-02 dev-journal-revert-to-css.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_scripts/_dev_journals/2025-04-02 dev-journal-revert-to-css.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_scripts/_dev_journals/2025-03-22 jekyll-multilingual-tagging-system.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_scripts/_dev_journals/2025-03-22 jekyll-multilingual-tagging-system.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_scripts/_dev_journals/2025-03-22 jekyll-multilingual-tagging-system.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_scripts/_dev_journals/2025-03-22 jekyll-multilingual-tagging-system.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_scripts/_dev_journals/2025-03-22 jekyll-multilingual-tagging-system.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_scripts/_dev_journals/2025-03-22 jekyll-multilingual-tagging-system.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_scripts/_dev_journals/2025-03-22 jekyll-multilingual-tagging-system.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_scripts/_dev_journals/2025-03-22 jekyll-multilingual-tagging-system.md
sed -i '' 's/site.tags/site.dimensions/g' ./_scripts/_dev_journals/2025-03-22 jekyll-multilingual-tagging-system.md
sed -i '' 's/page.tags/page.dimensions/g' ./_scripts/_dev_journals/2025-03-22 jekyll-multilingual-tagging-system.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_scripts/_dev_journals/2025-03-22 jekyll-multilingual-tagging-system.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_scripts/_dev_journals/2025-03-07 brandmine-color-palette for Jekyll.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_scripts/_dev_journals/2025-03-07 brandmine-color-palette for Jekyll.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_scripts/_dev_journals/2025-03-07 brandmine-color-palette for Jekyll.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_scripts/_dev_journals/2025-03-07 brandmine-color-palette for Jekyll.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_scripts/_dev_journals/2025-03-07 brandmine-color-palette for Jekyll.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_scripts/_dev_journals/2025-03-07 brandmine-color-palette for Jekyll.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_scripts/_dev_journals/2025-03-07 brandmine-color-palette for Jekyll.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_scripts/_dev_journals/2025-03-07 brandmine-color-palette for Jekyll.md
sed -i '' 's/site.tags/site.dimensions/g' ./_scripts/_dev_journals/2025-03-07 brandmine-color-palette for Jekyll.md
sed -i '' 's/page.tags/page.dimensions/g' ./_scripts/_dev_journals/2025-03-07 brandmine-color-palette for Jekyll.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_scripts/_dev_journals/2025-03-07 brandmine-color-palette for Jekyll.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_scripts/_dev_journals/2025-04-01 dev-journal_homepage cleanup.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_scripts/_dev_journals/2025-04-01 dev-journal_homepage cleanup.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_scripts/_dev_journals/2025-04-01 dev-journal_homepage cleanup.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_scripts/_dev_journals/2025-04-01 dev-journal_homepage cleanup.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_scripts/_dev_journals/2025-04-01 dev-journal_homepage cleanup.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_scripts/_dev_journals/2025-04-01 dev-journal_homepage cleanup.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_scripts/_dev_journals/2025-04-01 dev-journal_homepage cleanup.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_scripts/_dev_journals/2025-04-01 dev-journal_homepage cleanup.md
sed -i '' 's/site.tags/site.dimensions/g' ./_scripts/_dev_journals/2025-04-01 dev-journal_homepage cleanup.md
sed -i '' 's/page.tags/page.dimensions/g' ./_scripts/_dev_journals/2025-04-01 dev-journal_homepage cleanup.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_scripts/_dev_journals/2025-04-01 dev-journal_homepage cleanup.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_scripts/_dev_journals/2025-03-24_Change Init to Progressive Approach.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_scripts/_dev_journals/2025-03-24_Change Init to Progressive Approach.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_scripts/_dev_journals/2025-03-24_Change Init to Progressive Approach.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_scripts/_dev_journals/2025-03-24_Change Init to Progressive Approach.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_scripts/_dev_journals/2025-03-24_Change Init to Progressive Approach.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_scripts/_dev_journals/2025-03-24_Change Init to Progressive Approach.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_scripts/_dev_journals/2025-03-24_Change Init to Progressive Approach.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_scripts/_dev_journals/2025-03-24_Change Init to Progressive Approach.md
sed -i '' 's/site.tags/site.dimensions/g' ./_scripts/_dev_journals/2025-03-24_Change Init to Progressive Approach.md
sed -i '' 's/page.tags/page.dimensions/g' ./_scripts/_dev_journals/2025-03-24_Change Init to Progressive Approach.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_scripts/_dev_journals/2025-03-24_Change Init to Progressive Approach.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_scripts/_dev_journals/2025-03-26 DevJournal Styleguide Updates.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_scripts/_dev_journals/2025-03-26 DevJournal Styleguide Updates.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_scripts/_dev_journals/2025-03-26 DevJournal Styleguide Updates.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_scripts/_dev_journals/2025-03-26 DevJournal Styleguide Updates.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_scripts/_dev_journals/2025-03-26 DevJournal Styleguide Updates.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_scripts/_dev_journals/2025-03-26 DevJournal Styleguide Updates.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_scripts/_dev_journals/2025-03-26 DevJournal Styleguide Updates.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_scripts/_dev_journals/2025-03-26 DevJournal Styleguide Updates.md
sed -i '' 's/site.tags/site.dimensions/g' ./_scripts/_dev_journals/2025-03-26 DevJournal Styleguide Updates.md
sed -i '' 's/page.tags/page.dimensions/g' ./_scripts/_dev_journals/2025-03-26 DevJournal Styleguide Updates.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_scripts/_dev_journals/2025-03-26 DevJournal Styleguide Updates.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_scripts/_dev_journals/2025-03-22 enhanced-summary-script-update.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_scripts/_dev_journals/2025-03-22 enhanced-summary-script-update.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_scripts/_dev_journals/2025-03-22 enhanced-summary-script-update.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_scripts/_dev_journals/2025-03-22 enhanced-summary-script-update.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_scripts/_dev_journals/2025-03-22 enhanced-summary-script-update.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_scripts/_dev_journals/2025-03-22 enhanced-summary-script-update.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_scripts/_dev_journals/2025-03-22 enhanced-summary-script-update.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_scripts/_dev_journals/2025-03-22 enhanced-summary-script-update.md
sed -i '' 's/site.tags/site.dimensions/g' ./_scripts/_dev_journals/2025-03-22 enhanced-summary-script-update.md
sed -i '' 's/page.tags/page.dimensions/g' ./_scripts/_dev_journals/2025-03-22 enhanced-summary-script-update.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_scripts/_dev_journals/2025-03-22 enhanced-summary-script-update.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_scripts/_dev_journals/2025-04-19 dev-journal button standardization.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_scripts/_dev_journals/2025-04-19 dev-journal button standardization.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_scripts/_dev_journals/2025-04-19 dev-journal button standardization.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_scripts/_dev_journals/2025-04-19 dev-journal button standardization.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_scripts/_dev_journals/2025-04-19 dev-journal button standardization.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_scripts/_dev_journals/2025-04-19 dev-journal button standardization.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_scripts/_dev_journals/2025-04-19 dev-journal button standardization.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_scripts/_dev_journals/2025-04-19 dev-journal button standardization.md
sed -i '' 's/site.tags/site.dimensions/g' ./_scripts/_dev_journals/2025-04-19 dev-journal button standardization.md
sed -i '' 's/page.tags/page.dimensions/g' ./_scripts/_dev_journals/2025-04-19 dev-journal button standardization.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_scripts/_dev_journals/2025-04-19 dev-journal button standardization.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_scripts/_dev_journals/2025-03-11 Multilingual Newsletter Implementation.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_scripts/_dev_journals/2025-03-11 Multilingual Newsletter Implementation.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_scripts/_dev_journals/2025-03-11 Multilingual Newsletter Implementation.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_scripts/_dev_journals/2025-03-11 Multilingual Newsletter Implementation.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_scripts/_dev_journals/2025-03-11 Multilingual Newsletter Implementation.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_scripts/_dev_journals/2025-03-11 Multilingual Newsletter Implementation.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_scripts/_dev_journals/2025-03-11 Multilingual Newsletter Implementation.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_scripts/_dev_journals/2025-03-11 Multilingual Newsletter Implementation.md
sed -i '' 's/site.tags/site.dimensions/g' ./_scripts/_dev_journals/2025-03-11 Multilingual Newsletter Implementation.md
sed -i '' 's/page.tags/page.dimensions/g' ./_scripts/_dev_journals/2025-03-11 Multilingual Newsletter Implementation.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_scripts/_dev_journals/2025-03-11 Multilingual Newsletter Implementation.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_scripts/_dev_journals/2025-03-22-country-tag-implementation-summary.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_scripts/_dev_journals/2025-03-22-country-tag-implementation-summary.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_scripts/_dev_journals/2025-03-22-country-tag-implementation-summary.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_scripts/_dev_journals/2025-03-22-country-tag-implementation-summary.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_scripts/_dev_journals/2025-03-22-country-tag-implementation-summary.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_scripts/_dev_journals/2025-03-22-country-tag-implementation-summary.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_scripts/_dev_journals/2025-03-22-country-tag-implementation-summary.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_scripts/_dev_journals/2025-03-22-country-tag-implementation-summary.md
sed -i '' 's/site.tags/site.dimensions/g' ./_scripts/_dev_journals/2025-03-22-country-tag-implementation-summary.md
sed -i '' 's/page.tags/page.dimensions/g' ./_scripts/_dev_journals/2025-03-22-country-tag-implementation-summary.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_scripts/_dev_journals/2025-03-22-country-tag-implementation-summary.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_scripts/_dev_journals/2025-04-08-multilingual-data-restructuring.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_scripts/_dev_journals/2025-04-08-multilingual-data-restructuring.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_scripts/_dev_journals/2025-04-08-multilingual-data-restructuring.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_scripts/_dev_journals/2025-04-08-multilingual-data-restructuring.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_scripts/_dev_journals/2025-04-08-multilingual-data-restructuring.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_scripts/_dev_journals/2025-04-08-multilingual-data-restructuring.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_scripts/_dev_journals/2025-04-08-multilingual-data-restructuring.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_scripts/_dev_journals/2025-04-08-multilingual-data-restructuring.md
sed -i '' 's/site.tags/site.dimensions/g' ./_scripts/_dev_journals/2025-04-08-multilingual-data-restructuring.md
sed -i '' 's/page.tags/page.dimensions/g' ./_scripts/_dev_journals/2025-04-08-multilingual-data-restructuring.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_scripts/_dev_journals/2025-04-08-multilingual-data-restructuring.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_scripts/_dev_journals/2025-03-16 brandmine-tag-priority.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_scripts/_dev_journals/2025-03-16 brandmine-tag-priority.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_scripts/_dev_journals/2025-03-16 brandmine-tag-priority.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_scripts/_dev_journals/2025-03-16 brandmine-tag-priority.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_scripts/_dev_journals/2025-03-16 brandmine-tag-priority.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_scripts/_dev_journals/2025-03-16 brandmine-tag-priority.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_scripts/_dev_journals/2025-03-16 brandmine-tag-priority.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_scripts/_dev_journals/2025-03-16 brandmine-tag-priority.md
sed -i '' 's/site.tags/site.dimensions/g' ./_scripts/_dev_journals/2025-03-16 brandmine-tag-priority.md
sed -i '' 's/page.tags/page.dimensions/g' ./_scripts/_dev_journals/2025-03-16 brandmine-tag-priority.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_scripts/_dev_journals/2025-03-16 brandmine-tag-priority.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_scripts/_dev_journals/2025-03-14 brandmine-css-guide.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_scripts/_dev_journals/2025-03-14 brandmine-css-guide.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_scripts/_dev_journals/2025-03-14 brandmine-css-guide.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_scripts/_dev_journals/2025-03-14 brandmine-css-guide.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_scripts/_dev_journals/2025-03-14 brandmine-css-guide.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_scripts/_dev_journals/2025-03-14 brandmine-css-guide.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_scripts/_dev_journals/2025-03-14 brandmine-css-guide.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_scripts/_dev_journals/2025-03-14 brandmine-css-guide.md
sed -i '' 's/site.tags/site.dimensions/g' ./_scripts/_dev_journals/2025-03-14 brandmine-css-guide.md
sed -i '' 's/page.tags/page.dimensions/g' ./_scripts/_dev_journals/2025-03-14 brandmine-css-guide.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_scripts/_dev_journals/2025-03-14 brandmine-css-guide.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_scripts/_dev_journals/2025-04-02 consolidated-strategy-updated.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_scripts/_dev_journals/2025-04-02 consolidated-strategy-updated.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_scripts/_dev_journals/2025-04-02 consolidated-strategy-updated.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_scripts/_dev_journals/2025-04-02 consolidated-strategy-updated.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_scripts/_dev_journals/2025-04-02 consolidated-strategy-updated.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_scripts/_dev_journals/2025-04-02 consolidated-strategy-updated.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_scripts/_dev_journals/2025-04-02 consolidated-strategy-updated.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_scripts/_dev_journals/2025-04-02 consolidated-strategy-updated.md
sed -i '' 's/site.tags/site.dimensions/g' ./_scripts/_dev_journals/2025-04-02 consolidated-strategy-updated.md
sed -i '' 's/page.tags/page.dimensions/g' ./_scripts/_dev_journals/2025-04-02 consolidated-strategy-updated.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_scripts/_dev_journals/2025-04-02 consolidated-strategy-updated.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_scripts/_dev_journals/2025-03-18 brandmine-font-strategy-updated.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_scripts/_dev_journals/2025-03-18 brandmine-font-strategy-updated.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_scripts/_dev_journals/2025-03-18 brandmine-font-strategy-updated.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_scripts/_dev_journals/2025-03-18 brandmine-font-strategy-updated.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_scripts/_dev_journals/2025-03-18 brandmine-font-strategy-updated.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_scripts/_dev_journals/2025-03-18 brandmine-font-strategy-updated.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_scripts/_dev_journals/2025-03-18 brandmine-font-strategy-updated.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_scripts/_dev_journals/2025-03-18 brandmine-font-strategy-updated.md
sed -i '' 's/site.tags/site.dimensions/g' ./_scripts/_dev_journals/2025-03-18 brandmine-font-strategy-updated.md
sed -i '' 's/page.tags/page.dimensions/g' ./_scripts/_dev_journals/2025-03-18 brandmine-font-strategy-updated.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_scripts/_dev_journals/2025-03-18 brandmine-font-strategy-updated.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_scripts/_dev_journals/2025-04-02 brandmine-context-package.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_scripts/_dev_journals/2025-04-02 brandmine-context-package.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_scripts/_dev_journals/2025-04-02 brandmine-context-package.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_scripts/_dev_journals/2025-04-02 brandmine-context-package.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_scripts/_dev_journals/2025-04-02 brandmine-context-package.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_scripts/_dev_journals/2025-04-02 brandmine-context-package.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_scripts/_dev_journals/2025-04-02 brandmine-context-package.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_scripts/_dev_journals/2025-04-02 brandmine-context-package.md
sed -i '' 's/site.tags/site.dimensions/g' ./_scripts/_dev_journals/2025-04-02 brandmine-context-package.md
sed -i '' 's/page.tags/page.dimensions/g' ./_scripts/_dev_journals/2025-04-02 brandmine-context-package.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_scripts/_dev_journals/2025-04-02 brandmine-context-package.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_scripts/_dev_journals/2025-03-10 Footer Newsletter Integration Summary.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_scripts/_dev_journals/2025-03-10 Footer Newsletter Integration Summary.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_scripts/_dev_journals/2025-03-10 Footer Newsletter Integration Summary.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_scripts/_dev_journals/2025-03-10 Footer Newsletter Integration Summary.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_scripts/_dev_journals/2025-03-10 Footer Newsletter Integration Summary.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_scripts/_dev_journals/2025-03-10 Footer Newsletter Integration Summary.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_scripts/_dev_journals/2025-03-10 Footer Newsletter Integration Summary.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_scripts/_dev_journals/2025-03-10 Footer Newsletter Integration Summary.md
sed -i '' 's/site.tags/site.dimensions/g' ./_scripts/_dev_journals/2025-03-10 Footer Newsletter Integration Summary.md
sed -i '' 's/page.tags/page.dimensions/g' ./_scripts/_dev_journals/2025-03-10 Footer Newsletter Integration Summary.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_scripts/_dev_journals/2025-03-10 Footer Newsletter Integration Summary.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_scripts/_dev_journals/2025-03-17 mobile-testing-guide.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_scripts/_dev_journals/2025-03-17 mobile-testing-guide.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_scripts/_dev_journals/2025-03-17 mobile-testing-guide.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_scripts/_dev_journals/2025-03-17 mobile-testing-guide.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_scripts/_dev_journals/2025-03-17 mobile-testing-guide.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_scripts/_dev_journals/2025-03-17 mobile-testing-guide.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_scripts/_dev_journals/2025-03-17 mobile-testing-guide.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_scripts/_dev_journals/2025-03-17 mobile-testing-guide.md
sed -i '' 's/site.tags/site.dimensions/g' ./_scripts/_dev_journals/2025-03-17 mobile-testing-guide.md
sed -i '' 's/page.tags/page.dimensions/g' ./_scripts/_dev_journals/2025-03-17 mobile-testing-guide.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_scripts/_dev_journals/2025-03-17 mobile-testing-guide.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_scripts/_dev_journals/2025-03-25 brandmine-updated-strategy.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_scripts/_dev_journals/2025-03-25 brandmine-updated-strategy.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_scripts/_dev_journals/2025-03-25 brandmine-updated-strategy.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_scripts/_dev_journals/2025-03-25 brandmine-updated-strategy.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_scripts/_dev_journals/2025-03-25 brandmine-updated-strategy.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_scripts/_dev_journals/2025-03-25 brandmine-updated-strategy.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_scripts/_dev_journals/2025-03-25 brandmine-updated-strategy.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_scripts/_dev_journals/2025-03-25 brandmine-updated-strategy.md
sed -i '' 's/site.tags/site.dimensions/g' ./_scripts/_dev_journals/2025-03-25 brandmine-updated-strategy.md
sed -i '' 's/page.tags/page.dimensions/g' ./_scripts/_dev_journals/2025-03-25 brandmine-updated-strategy.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_scripts/_dev_journals/2025-03-25 brandmine-updated-strategy.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_scripts/_dev_journals/2025-04-04 dev-journal brandmine-footer-debug-summary.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_scripts/_dev_journals/2025-04-04 dev-journal brandmine-footer-debug-summary.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_scripts/_dev_journals/2025-04-04 dev-journal brandmine-footer-debug-summary.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_scripts/_dev_journals/2025-04-04 dev-journal brandmine-footer-debug-summary.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_scripts/_dev_journals/2025-04-04 dev-journal brandmine-footer-debug-summary.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_scripts/_dev_journals/2025-04-04 dev-journal brandmine-footer-debug-summary.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_scripts/_dev_journals/2025-04-04 dev-journal brandmine-footer-debug-summary.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_scripts/_dev_journals/2025-04-04 dev-journal brandmine-footer-debug-summary.md
sed -i '' 's/site.tags/site.dimensions/g' ./_scripts/_dev_journals/2025-04-04 dev-journal brandmine-footer-debug-summary.md
sed -i '' 's/page.tags/page.dimensions/g' ./_scripts/_dev_journals/2025-04-04 dev-journal brandmine-footer-debug-summary.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_scripts/_dev_journals/2025-04-04 dev-journal brandmine-footer-debug-summary.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_scripts/_dev_journals/2025-03-20 brandomy blog development-journal-entry.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_scripts/_dev_journals/2025-03-20 brandomy blog development-journal-entry.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_scripts/_dev_journals/2025-03-20 brandomy blog development-journal-entry.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_scripts/_dev_journals/2025-03-20 brandomy blog development-journal-entry.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_scripts/_dev_journals/2025-03-20 brandomy blog development-journal-entry.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_scripts/_dev_journals/2025-03-20 brandomy blog development-journal-entry.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_scripts/_dev_journals/2025-03-20 brandomy blog development-journal-entry.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_scripts/_dev_journals/2025-03-20 brandomy blog development-journal-entry.md
sed -i '' 's/site.tags/site.dimensions/g' ./_scripts/_dev_journals/2025-03-20 brandomy blog development-journal-entry.md
sed -i '' 's/page.tags/page.dimensions/g' ./_scripts/_dev_journals/2025-03-20 brandomy blog development-journal-entry.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_scripts/_dev_journals/2025-03-20 brandomy blog development-journal-entry.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_docs/conventions.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_docs/conventions.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_docs/conventions.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_docs/conventions.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_docs/conventions.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_docs/conventions.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_docs/conventions.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_docs/conventions.md
sed -i '' 's/site.tags/site.dimensions/g' ./_docs/conventions.md
sed -i '' 's/page.tags/page.dimensions/g' ./_docs/conventions.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_docs/conventions.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_docs/templates/insight-brand-spotlight-en.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_docs/templates/insight-brand-spotlight-en.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_docs/templates/insight-brand-spotlight-en.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_docs/templates/insight-brand-spotlight-en.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_docs/templates/insight-brand-spotlight-en.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_docs/templates/insight-brand-spotlight-en.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_docs/templates/insight-brand-spotlight-en.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_docs/templates/insight-brand-spotlight-en.md
sed -i '' 's/site.tags/site.dimensions/g' ./_docs/templates/insight-brand-spotlight-en.md
sed -i '' 's/page.tags/page.dimensions/g' ./_docs/templates/insight-brand-spotlight-en.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_docs/templates/insight-brand-spotlight-en.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_docs/templates/tag-attribute-en.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_docs/templates/tag-attribute-en.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_docs/templates/tag-attribute-en.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_docs/templates/tag-attribute-en.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_docs/templates/tag-attribute-en.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_docs/templates/tag-attribute-en.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_docs/templates/tag-attribute-en.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_docs/templates/tag-attribute-en.md
sed -i '' 's/site.tags/site.dimensions/g' ./_docs/templates/tag-attribute-en.md
sed -i '' 's/page.tags/page.dimensions/g' ./_docs/templates/tag-attribute-en.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_docs/templates/tag-attribute-en.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_docs/templates/tag-attribute-zh.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_docs/templates/tag-attribute-zh.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_docs/templates/tag-attribute-zh.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_docs/templates/tag-attribute-zh.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_docs/templates/tag-attribute-zh.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_docs/templates/tag-attribute-zh.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_docs/templates/tag-attribute-zh.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_docs/templates/tag-attribute-zh.md
sed -i '' 's/site.tags/site.dimensions/g' ./_docs/templates/tag-attribute-zh.md
sed -i '' 's/page.tags/page.dimensions/g' ./_docs/templates/tag-attribute-zh.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_docs/templates/tag-attribute-zh.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_docs/templates/insight-brand-spotlight-zh.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_docs/templates/insight-brand-spotlight-zh.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_docs/templates/insight-brand-spotlight-zh.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_docs/templates/insight-brand-spotlight-zh.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_docs/templates/insight-brand-spotlight-zh.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_docs/templates/insight-brand-spotlight-zh.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_docs/templates/insight-brand-spotlight-zh.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_docs/templates/insight-brand-spotlight-zh.md
sed -i '' 's/site.tags/site.dimensions/g' ./_docs/templates/insight-brand-spotlight-zh.md
sed -i '' 's/page.tags/page.dimensions/g' ./_docs/templates/insight-brand-spotlight-zh.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_docs/templates/insight-brand-spotlight-zh.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_docs/templates/insight-cultural-signature-en.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_docs/templates/insight-cultural-signature-en.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_docs/templates/insight-cultural-signature-en.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_docs/templates/insight-cultural-signature-en.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_docs/templates/insight-cultural-signature-en.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_docs/templates/insight-cultural-signature-en.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_docs/templates/insight-cultural-signature-en.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_docs/templates/insight-cultural-signature-en.md
sed -i '' 's/site.tags/site.dimensions/g' ./_docs/templates/insight-cultural-signature-en.md
sed -i '' 's/page.tags/page.dimensions/g' ./_docs/templates/insight-cultural-signature-en.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_docs/templates/insight-cultural-signature-en.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_docs/templates/insight-cultural-signature-zh.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_docs/templates/insight-cultural-signature-zh.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_docs/templates/insight-cultural-signature-zh.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_docs/templates/insight-cultural-signature-zh.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_docs/templates/insight-cultural-signature-zh.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_docs/templates/insight-cultural-signature-zh.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_docs/templates/insight-cultural-signature-zh.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_docs/templates/insight-cultural-signature-zh.md
sed -i '' 's/site.tags/site.dimensions/g' ./_docs/templates/insight-cultural-signature-zh.md
sed -i '' 's/page.tags/page.dimensions/g' ./_docs/templates/insight-cultural-signature-zh.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_docs/templates/insight-cultural-signature-zh.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_docs/templates/tag-market-zh.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_docs/templates/tag-market-zh.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_docs/templates/tag-market-zh.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_docs/templates/tag-market-zh.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_docs/templates/tag-market-zh.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_docs/templates/tag-market-zh.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_docs/templates/tag-market-zh.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_docs/templates/tag-market-zh.md
sed -i '' 's/site.tags/site.dimensions/g' ./_docs/templates/tag-market-zh.md
sed -i '' 's/page.tags/page.dimensions/g' ./_docs/templates/tag-market-zh.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_docs/templates/tag-market-zh.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_docs/templates/tag-signal-en.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_docs/templates/tag-signal-en.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_docs/templates/tag-signal-en.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_docs/templates/tag-signal-en.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_docs/templates/tag-signal-en.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_docs/templates/tag-signal-en.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_docs/templates/tag-signal-en.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_docs/templates/tag-signal-en.md
sed -i '' 's/site.tags/site.dimensions/g' ./_docs/templates/tag-signal-en.md
sed -i '' 's/page.tags/page.dimensions/g' ./_docs/templates/tag-signal-en.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_docs/templates/tag-signal-en.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_docs/templates/insight-market-milestone-ru.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_docs/templates/insight-market-milestone-ru.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_docs/templates/insight-market-milestone-ru.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_docs/templates/insight-market-milestone-ru.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_docs/templates/insight-market-milestone-ru.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_docs/templates/insight-market-milestone-ru.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_docs/templates/insight-market-milestone-ru.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_docs/templates/insight-market-milestone-ru.md
sed -i '' 's/site.tags/site.dimensions/g' ./_docs/templates/insight-market-milestone-ru.md
sed -i '' 's/page.tags/page.dimensions/g' ./_docs/templates/insight-market-milestone-ru.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_docs/templates/insight-market-milestone-ru.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_docs/templates/tag-signal-zh.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_docs/templates/tag-signal-zh.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_docs/templates/tag-signal-zh.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_docs/templates/tag-signal-zh.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_docs/templates/tag-signal-zh.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_docs/templates/tag-signal-zh.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_docs/templates/tag-signal-zh.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_docs/templates/tag-signal-zh.md
sed -i '' 's/site.tags/site.dimensions/g' ./_docs/templates/tag-signal-zh.md
sed -i '' 's/page.tags/page.dimensions/g' ./_docs/templates/tag-signal-zh.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_docs/templates/tag-signal-zh.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_docs/templates/tag-market-en.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_docs/templates/tag-market-en.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_docs/templates/tag-market-en.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_docs/templates/tag-market-en.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_docs/templates/tag-market-en.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_docs/templates/tag-market-en.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_docs/templates/tag-market-en.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_docs/templates/tag-market-en.md
sed -i '' 's/site.tags/site.dimensions/g' ./_docs/templates/tag-market-en.md
sed -i '' 's/page.tags/page.dimensions/g' ./_docs/templates/tag-market-en.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_docs/templates/tag-market-en.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_docs/templates/insight-founders-journey-zh.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_docs/templates/insight-founders-journey-zh.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_docs/templates/insight-founders-journey-zh.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_docs/templates/insight-founders-journey-zh.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_docs/templates/insight-founders-journey-zh.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_docs/templates/insight-founders-journey-zh.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_docs/templates/insight-founders-journey-zh.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_docs/templates/insight-founders-journey-zh.md
sed -i '' 's/site.tags/site.dimensions/g' ./_docs/templates/insight-founders-journey-zh.md
sed -i '' 's/page.tags/page.dimensions/g' ./_docs/templates/insight-founders-journey-zh.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_docs/templates/insight-founders-journey-zh.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_docs/templates/brand-ru.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_docs/templates/brand-ru.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_docs/templates/brand-ru.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_docs/templates/brand-ru.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_docs/templates/brand-ru.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_docs/templates/brand-ru.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_docs/templates/brand-ru.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_docs/templates/brand-ru.md
sed -i '' 's/site.tags/site.dimensions/g' ./_docs/templates/brand-ru.md
sed -i '' 's/page.tags/page.dimensions/g' ./_docs/templates/brand-ru.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_docs/templates/brand-ru.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_docs/templates/insight-founders-journey-en.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_docs/templates/insight-founders-journey-en.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_docs/templates/insight-founders-journey-en.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_docs/templates/insight-founders-journey-en.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_docs/templates/insight-founders-journey-en.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_docs/templates/insight-founders-journey-en.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_docs/templates/insight-founders-journey-en.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_docs/templates/insight-founders-journey-en.md
sed -i '' 's/site.tags/site.dimensions/g' ./_docs/templates/insight-founders-journey-en.md
sed -i '' 's/page.tags/page.dimensions/g' ./_docs/templates/insight-founders-journey-en.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_docs/templates/insight-founders-journey-en.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_docs/templates/tag-sector-en.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_docs/templates/tag-sector-en.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_docs/templates/tag-sector-en.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_docs/templates/tag-sector-en.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_docs/templates/tag-sector-en.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_docs/templates/tag-sector-en.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_docs/templates/tag-sector-en.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_docs/templates/tag-sector-en.md
sed -i '' 's/site.tags/site.dimensions/g' ./_docs/templates/tag-sector-en.md
sed -i '' 's/page.tags/page.dimensions/g' ./_docs/templates/tag-sector-en.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_docs/templates/tag-sector-en.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_docs/templates/tag-sector-zh.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_docs/templates/tag-sector-zh.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_docs/templates/tag-sector-zh.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_docs/templates/tag-sector-zh.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_docs/templates/tag-sector-zh.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_docs/templates/tag-sector-zh.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_docs/templates/tag-sector-zh.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_docs/templates/tag-sector-zh.md
sed -i '' 's/site.tags/site.dimensions/g' ./_docs/templates/tag-sector-zh.md
sed -i '' 's/page.tags/page.dimensions/g' ./_docs/templates/tag-sector-zh.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_docs/templates/tag-sector-zh.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_docs/templates/insight-founders-journey-ru.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_docs/templates/insight-founders-journey-ru.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_docs/templates/insight-founders-journey-ru.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_docs/templates/insight-founders-journey-ru.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_docs/templates/insight-founders-journey-ru.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_docs/templates/insight-founders-journey-ru.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_docs/templates/insight-founders-journey-ru.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_docs/templates/insight-founders-journey-ru.md
sed -i '' 's/site.tags/site.dimensions/g' ./_docs/templates/insight-founders-journey-ru.md
sed -i '' 's/page.tags/page.dimensions/g' ./_docs/templates/insight-founders-journey-ru.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_docs/templates/insight-founders-journey-ru.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_docs/templates/brand-zh.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_docs/templates/brand-zh.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_docs/templates/brand-zh.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_docs/templates/brand-zh.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_docs/templates/brand-zh.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_docs/templates/brand-zh.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_docs/templates/brand-zh.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_docs/templates/brand-zh.md
sed -i '' 's/site.tags/site.dimensions/g' ./_docs/templates/brand-zh.md
sed -i '' 's/page.tags/page.dimensions/g' ./_docs/templates/brand-zh.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_docs/templates/brand-zh.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_docs/templates/brand-en.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_docs/templates/brand-en.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_docs/templates/brand-en.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_docs/templates/brand-en.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_docs/templates/brand-en.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_docs/templates/brand-en.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_docs/templates/brand-en.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_docs/templates/brand-en.md
sed -i '' 's/site.tags/site.dimensions/g' ./_docs/templates/brand-en.md
sed -i '' 's/page.tags/page.dimensions/g' ./_docs/templates/brand-en.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_docs/templates/brand-en.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_docs/templates/tag-sector-ru.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_docs/templates/tag-sector-ru.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_docs/templates/tag-sector-ru.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_docs/templates/tag-sector-ru.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_docs/templates/tag-sector-ru.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_docs/templates/tag-sector-ru.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_docs/templates/tag-sector-ru.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_docs/templates/tag-sector-ru.md
sed -i '' 's/site.tags/site.dimensions/g' ./_docs/templates/tag-sector-ru.md
sed -i '' 's/page.tags/page.dimensions/g' ./_docs/templates/tag-sector-ru.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_docs/templates/tag-sector-ru.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_docs/templates/tag-market-ru.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_docs/templates/tag-market-ru.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_docs/templates/tag-market-ru.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_docs/templates/tag-market-ru.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_docs/templates/tag-market-ru.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_docs/templates/tag-market-ru.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_docs/templates/tag-market-ru.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_docs/templates/tag-market-ru.md
sed -i '' 's/site.tags/site.dimensions/g' ./_docs/templates/tag-market-ru.md
sed -i '' 's/page.tags/page.dimensions/g' ./_docs/templates/tag-market-ru.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_docs/templates/tag-market-ru.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_docs/templates/insight-market-milestone-en.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_docs/templates/insight-market-milestone-en.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_docs/templates/insight-market-milestone-en.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_docs/templates/insight-market-milestone-en.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_docs/templates/insight-market-milestone-en.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_docs/templates/insight-market-milestone-en.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_docs/templates/insight-market-milestone-en.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_docs/templates/insight-market-milestone-en.md
sed -i '' 's/site.tags/site.dimensions/g' ./_docs/templates/insight-market-milestone-en.md
sed -i '' 's/page.tags/page.dimensions/g' ./_docs/templates/insight-market-milestone-en.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_docs/templates/insight-market-milestone-en.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_docs/templates/tag-signal-ru.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_docs/templates/tag-signal-ru.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_docs/templates/tag-signal-ru.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_docs/templates/tag-signal-ru.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_docs/templates/tag-signal-ru.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_docs/templates/tag-signal-ru.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_docs/templates/tag-signal-ru.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_docs/templates/tag-signal-ru.md
sed -i '' 's/site.tags/site.dimensions/g' ./_docs/templates/tag-signal-ru.md
sed -i '' 's/page.tags/page.dimensions/g' ./_docs/templates/tag-signal-ru.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_docs/templates/tag-signal-ru.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_docs/templates/insight-market-milestone-zh.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_docs/templates/insight-market-milestone-zh.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_docs/templates/insight-market-milestone-zh.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_docs/templates/insight-market-milestone-zh.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_docs/templates/insight-market-milestone-zh.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_docs/templates/insight-market-milestone-zh.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_docs/templates/insight-market-milestone-zh.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_docs/templates/insight-market-milestone-zh.md
sed -i '' 's/site.tags/site.dimensions/g' ./_docs/templates/insight-market-milestone-zh.md
sed -i '' 's/page.tags/page.dimensions/g' ./_docs/templates/insight-market-milestone-zh.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_docs/templates/insight-market-milestone-zh.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_docs/templates/tag-attribute-ru.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_docs/templates/tag-attribute-ru.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_docs/templates/tag-attribute-ru.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_docs/templates/tag-attribute-ru.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_docs/templates/tag-attribute-ru.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_docs/templates/tag-attribute-ru.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_docs/templates/tag-attribute-ru.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_docs/templates/tag-attribute-ru.md
sed -i '' 's/site.tags/site.dimensions/g' ./_docs/templates/tag-attribute-ru.md
sed -i '' 's/page.tags/page.dimensions/g' ./_docs/templates/tag-attribute-ru.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_docs/templates/tag-attribute-ru.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_docs/templates/insight-brand-spotlight-ru.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_docs/templates/insight-brand-spotlight-ru.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_docs/templates/insight-brand-spotlight-ru.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_docs/templates/insight-brand-spotlight-ru.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_docs/templates/insight-brand-spotlight-ru.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_docs/templates/insight-brand-spotlight-ru.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_docs/templates/insight-brand-spotlight-ru.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_docs/templates/insight-brand-spotlight-ru.md
sed -i '' 's/site.tags/site.dimensions/g' ./_docs/templates/insight-brand-spotlight-ru.md
sed -i '' 's/page.tags/page.dimensions/g' ./_docs/templates/insight-brand-spotlight-ru.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_docs/templates/insight-brand-spotlight-ru.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_docs/templates/insight-cultural-signature-ru.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_docs/templates/insight-cultural-signature-ru.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_docs/templates/insight-cultural-signature-ru.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_docs/templates/insight-cultural-signature-ru.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_docs/templates/insight-cultural-signature-ru.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_docs/templates/insight-cultural-signature-ru.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_docs/templates/insight-cultural-signature-ru.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_docs/templates/insight-cultural-signature-ru.md
sed -i '' 's/site.tags/site.dimensions/g' ./_docs/templates/insight-cultural-signature-ru.md
sed -i '' 's/page.tags/page.dimensions/g' ./_docs/templates/insight-cultural-signature-ru.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_docs/templates/insight-cultural-signature-ru.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_insights/ru/market-milestone-sample.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_insights/ru/market-milestone-sample.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_insights/ru/market-milestone-sample.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_insights/ru/market-milestone-sample.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_insights/ru/market-milestone-sample.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_insights/ru/market-milestone-sample.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_insights/ru/market-milestone-sample.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_insights/ru/market-milestone-sample.md
sed -i '' 's/site.tags/site.dimensions/g' ./_insights/ru/market-milestone-sample.md
sed -i '' 's/page.tags/page.dimensions/g' ./_insights/ru/market-milestone-sample.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_insights/ru/market-milestone-sample.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_insights/ru/founders-journey-sample.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_insights/ru/founders-journey-sample.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_insights/ru/founders-journey-sample.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_insights/ru/founders-journey-sample.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_insights/ru/founders-journey-sample.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_insights/ru/founders-journey-sample.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_insights/ru/founders-journey-sample.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_insights/ru/founders-journey-sample.md
sed -i '' 's/site.tags/site.dimensions/g' ./_insights/ru/founders-journey-sample.md
sed -i '' 's/page.tags/page.dimensions/g' ./_insights/ru/founders-journey-sample.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_insights/ru/founders-journey-sample.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_insights/ru/brand-spotlight-sample.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_insights/ru/brand-spotlight-sample.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_insights/ru/brand-spotlight-sample.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_insights/ru/brand-spotlight-sample.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_insights/ru/brand-spotlight-sample.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_insights/ru/brand-spotlight-sample.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_insights/ru/brand-spotlight-sample.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_insights/ru/brand-spotlight-sample.md
sed -i '' 's/site.tags/site.dimensions/g' ./_insights/ru/brand-spotlight-sample.md
sed -i '' 's/page.tags/page.dimensions/g' ./_insights/ru/brand-spotlight-sample.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_insights/ru/brand-spotlight-sample.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_insights/ru/cultural-signature-sample.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_insights/ru/cultural-signature-sample.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_insights/ru/cultural-signature-sample.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_insights/ru/cultural-signature-sample.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_insights/ru/cultural-signature-sample.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_insights/ru/cultural-signature-sample.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_insights/ru/cultural-signature-sample.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_insights/ru/cultural-signature-sample.md
sed -i '' 's/site.tags/site.dimensions/g' ./_insights/ru/cultural-signature-sample.md
sed -i '' 's/page.tags/page.dimensions/g' ./_insights/ru/cultural-signature-sample.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_insights/ru/cultural-signature-sample.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_insights/zh/market-milestone-sample.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_insights/zh/market-milestone-sample.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_insights/zh/market-milestone-sample.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_insights/zh/market-milestone-sample.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_insights/zh/market-milestone-sample.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_insights/zh/market-milestone-sample.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_insights/zh/market-milestone-sample.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_insights/zh/market-milestone-sample.md
sed -i '' 's/site.tags/site.dimensions/g' ./_insights/zh/market-milestone-sample.md
sed -i '' 's/page.tags/page.dimensions/g' ./_insights/zh/market-milestone-sample.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_insights/zh/market-milestone-sample.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_insights/zh/founders-journey-sample.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_insights/zh/founders-journey-sample.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_insights/zh/founders-journey-sample.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_insights/zh/founders-journey-sample.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_insights/zh/founders-journey-sample.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_insights/zh/founders-journey-sample.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_insights/zh/founders-journey-sample.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_insights/zh/founders-journey-sample.md
sed -i '' 's/site.tags/site.dimensions/g' ./_insights/zh/founders-journey-sample.md
sed -i '' 's/page.tags/page.dimensions/g' ./_insights/zh/founders-journey-sample.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_insights/zh/founders-journey-sample.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_insights/zh/brand-spotlight-sample.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_insights/zh/brand-spotlight-sample.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_insights/zh/brand-spotlight-sample.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_insights/zh/brand-spotlight-sample.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_insights/zh/brand-spotlight-sample.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_insights/zh/brand-spotlight-sample.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_insights/zh/brand-spotlight-sample.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_insights/zh/brand-spotlight-sample.md
sed -i '' 's/site.tags/site.dimensions/g' ./_insights/zh/brand-spotlight-sample.md
sed -i '' 's/page.tags/page.dimensions/g' ./_insights/zh/brand-spotlight-sample.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_insights/zh/brand-spotlight-sample.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_insights/zh/cultural-signature-sample.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_insights/zh/cultural-signature-sample.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_insights/zh/cultural-signature-sample.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_insights/zh/cultural-signature-sample.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_insights/zh/cultural-signature-sample.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_insights/zh/cultural-signature-sample.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_insights/zh/cultural-signature-sample.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_insights/zh/cultural-signature-sample.md
sed -i '' 's/site.tags/site.dimensions/g' ./_insights/zh/cultural-signature-sample.md
sed -i '' 's/page.tags/page.dimensions/g' ./_insights/zh/cultural-signature-sample.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_insights/zh/cultural-signature-sample.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_insights/en/market-milestone-sample.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_insights/en/market-milestone-sample.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_insights/en/market-milestone-sample.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_insights/en/market-milestone-sample.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_insights/en/market-milestone-sample.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_insights/en/market-milestone-sample.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_insights/en/market-milestone-sample.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_insights/en/market-milestone-sample.md
sed -i '' 's/site.tags/site.dimensions/g' ./_insights/en/market-milestone-sample.md
sed -i '' 's/page.tags/page.dimensions/g' ./_insights/en/market-milestone-sample.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_insights/en/market-milestone-sample.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_insights/en/founders-journey-sample.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_insights/en/founders-journey-sample.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_insights/en/founders-journey-sample.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_insights/en/founders-journey-sample.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_insights/en/founders-journey-sample.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_insights/en/founders-journey-sample.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_insights/en/founders-journey-sample.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_insights/en/founders-journey-sample.md
sed -i '' 's/site.tags/site.dimensions/g' ./_insights/en/founders-journey-sample.md
sed -i '' 's/page.tags/page.dimensions/g' ./_insights/en/founders-journey-sample.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_insights/en/founders-journey-sample.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_insights/en/brand-spotlight-sample.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_insights/en/brand-spotlight-sample.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_insights/en/brand-spotlight-sample.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_insights/en/brand-spotlight-sample.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_insights/en/brand-spotlight-sample.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_insights/en/brand-spotlight-sample.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_insights/en/brand-spotlight-sample.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_insights/en/brand-spotlight-sample.md
sed -i '' 's/site.tags/site.dimensions/g' ./_insights/en/brand-spotlight-sample.md
sed -i '' 's/page.tags/page.dimensions/g' ./_insights/en/brand-spotlight-sample.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_insights/en/brand-spotlight-sample.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_insights/en/cultural-signature-sample.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_insights/en/cultural-signature-sample.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_insights/en/cultural-signature-sample.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_insights/en/cultural-signature-sample.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_insights/en/cultural-signature-sample.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_insights/en/cultural-signature-sample.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_insights/en/cultural-signature-sample.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_insights/en/cultural-signature-sample.md
sed -i '' 's/site.tags/site.dimensions/g' ./_insights/en/cultural-signature-sample.md
sed -i '' 's/page.tags/page.dimensions/g' ./_insights/en/cultural-signature-sample.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_insights/en/cultural-signature-sample.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_layouts/default.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_layouts/default.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_layouts/default.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_layouts/default.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_layouts/default.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_layouts/default.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_layouts/default.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_layouts/default.html
sed -i '' 's/site.tags/site.dimensions/g' ./_layouts/default.html
sed -i '' 's/page.tags/page.dimensions/g' ./_layouts/default.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_layouts/default.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_layouts/brands.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_layouts/brands.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_layouts/brands.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_layouts/brands.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_layouts/brands.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_layouts/brands.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_layouts/brands.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_layouts/brands.html
sed -i '' 's/site.tags/site.dimensions/g' ./_layouts/brands.html
sed -i '' 's/page.tags/page.dimensions/g' ./_layouts/brands.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_layouts/brands.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_layouts/insight.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_layouts/insight.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_layouts/insight.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_layouts/insight.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_layouts/insight.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_layouts/insight.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_layouts/insight.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_layouts/insight.html
sed -i '' 's/site.tags/site.dimensions/g' ./_layouts/insight.html
sed -i '' 's/page.tags/page.dimensions/g' ./_layouts/insight.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_layouts/insight.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_layouts/styleguide.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_layouts/styleguide.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_layouts/styleguide.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_layouts/styleguide.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_layouts/styleguide.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_layouts/styleguide.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_layouts/styleguide.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_layouts/styleguide.html
sed -i '' 's/site.tags/site.dimensions/g' ./_layouts/styleguide.html
sed -i '' 's/page.tags/page.dimensions/g' ./_layouts/styleguide.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_layouts/styleguide.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_layouts/discovery.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_layouts/discovery.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_layouts/discovery.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_layouts/discovery.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_layouts/discovery.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_layouts/discovery.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_layouts/discovery.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_layouts/discovery.html
sed -i '' 's/site.tags/site.dimensions/g' ./_layouts/discovery.html
sed -i '' 's/page.tags/page.dimensions/g' ./_layouts/discovery.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_layouts/discovery.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_layouts/dimension.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_layouts/dimension.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_layouts/dimension.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_layouts/dimension.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_layouts/dimension.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_layouts/dimension.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_layouts/dimension.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_layouts/dimension.html
sed -i '' 's/site.tags/site.dimensions/g' ./_layouts/dimension.html
sed -i '' 's/page.tags/page.dimensions/g' ./_layouts/dimension.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_layouts/dimension.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_layouts/discover.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_layouts/discover.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_layouts/discover.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_layouts/discover.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_layouts/discover.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_layouts/discover.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_layouts/discover.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_layouts/discover.html
sed -i '' 's/site.tags/site.dimensions/g' ./_layouts/discover.html
sed -i '' 's/page.tags/page.dimensions/g' ./_layouts/discover.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_layouts/discover.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_layouts/insights.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_layouts/insights.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_layouts/insights.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_layouts/insights.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_layouts/insights.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_layouts/insights.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_layouts/insights.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_layouts/insights.html
sed -i '' 's/site.tags/site.dimensions/g' ./_layouts/insights.html
sed -i '' 's/page.tags/page.dimensions/g' ./_layouts/insights.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_layouts/insights.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_layouts/brand.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_layouts/brand.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_layouts/brand.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_layouts/brand.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_layouts/brand.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_layouts/brand.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_layouts/brand.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_layouts/brand.html
sed -i '' 's/site.tags/site.dimensions/g' ./_layouts/brand.html
sed -i '' 's/page.tags/page.dimensions/g' ./_layouts/brand.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_layouts/brand.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_layouts/dimension-specific/attributes.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_layouts/dimension-specific/attributes.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_layouts/dimension-specific/attributes.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_layouts/dimension-specific/attributes.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_layouts/dimension-specific/attributes.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_layouts/dimension-specific/attributes.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_layouts/dimension-specific/attributes.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_layouts/dimension-specific/attributes.html
sed -i '' 's/site.tags/site.dimensions/g' ./_layouts/dimension-specific/attributes.html
sed -i '' 's/page.tags/page.dimensions/g' ./_layouts/dimension-specific/attributes.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_layouts/dimension-specific/attributes.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_layouts/dimension-specific/signals.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_layouts/dimension-specific/signals.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_layouts/dimension-specific/signals.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_layouts/dimension-specific/signals.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_layouts/dimension-specific/signals.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_layouts/dimension-specific/signals.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_layouts/dimension-specific/signals.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_layouts/dimension-specific/signals.html
sed -i '' 's/site.tags/site.dimensions/g' ./_layouts/dimension-specific/signals.html
sed -i '' 's/page.tags/page.dimensions/g' ./_layouts/dimension-specific/signals.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_layouts/dimension-specific/signals.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_layouts/dimension-specific/markets.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_layouts/dimension-specific/markets.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_layouts/dimension-specific/markets.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_layouts/dimension-specific/markets.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_layouts/dimension-specific/markets.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_layouts/dimension-specific/markets.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_layouts/dimension-specific/markets.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_layouts/dimension-specific/markets.html
sed -i '' 's/site.tags/site.dimensions/g' ./_layouts/dimension-specific/markets.html
sed -i '' 's/page.tags/page.dimensions/g' ./_layouts/dimension-specific/markets.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_layouts/dimension-specific/markets.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_layouts/dimension-specific/sectors.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_layouts/dimension-specific/sectors.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_layouts/dimension-specific/sectors.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_layouts/dimension-specific/sectors.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_layouts/dimension-specific/sectors.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_layouts/dimension-specific/sectors.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_layouts/dimension-specific/sectors.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_layouts/dimension-specific/sectors.html
sed -i '' 's/site.tags/site.dimensions/g' ./_layouts/dimension-specific/sectors.html
sed -i '' 's/page.tags/page.dimensions/g' ./_layouts/dimension-specific/sectors.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_layouts/dimension-specific/sectors.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_brands/ru/teatime.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_brands/ru/teatime.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_brands/ru/teatime.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_brands/ru/teatime.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_brands/ru/teatime.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_brands/ru/teatime.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_brands/ru/teatime.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_brands/ru/teatime.md
sed -i '' 's/site.tags/site.dimensions/g' ./_brands/ru/teatime.md
sed -i '' 's/page.tags/page.dimensions/g' ./_brands/ru/teatime.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_brands/ru/teatime.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_brands/zh/teatime.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_brands/zh/teatime.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_brands/zh/teatime.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_brands/zh/teatime.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_brands/zh/teatime.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_brands/zh/teatime.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_brands/zh/teatime.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_brands/zh/teatime.md
sed -i '' 's/site.tags/site.dimensions/g' ./_brands/zh/teatime.md
sed -i '' 's/page.tags/page.dimensions/g' ./_brands/zh/teatime.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_brands/zh/teatime.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_brands/en/sojourn-hotels.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_brands/en/sojourn-hotels.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_brands/en/sojourn-hotels.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_brands/en/sojourn-hotels.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_brands/en/sojourn-hotels.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_brands/en/sojourn-hotels.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_brands/en/sojourn-hotels.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_brands/en/sojourn-hotels.md
sed -i '' 's/site.tags/site.dimensions/g' ./_brands/en/sojourn-hotels.md
sed -i '' 's/page.tags/page.dimensions/g' ./_brands/en/sojourn-hotels.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_brands/en/sojourn-hotels.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_brands/en/serra-verde.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_brands/en/serra-verde.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_brands/en/serra-verde.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_brands/en/serra-verde.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_brands/en/serra-verde.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_brands/en/serra-verde.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_brands/en/serra-verde.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_brands/en/serra-verde.md
sed -i '' 's/site.tags/site.dimensions/g' ./_brands/en/serra-verde.md
sed -i '' 's/page.tags/page.dimensions/g' ./_brands/en/serra-verde.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_brands/en/serra-verde.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_brands/en/taiga-spirits.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_brands/en/taiga-spirits.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_brands/en/taiga-spirits.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_brands/en/taiga-spirits.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_brands/en/taiga-spirits.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_brands/en/taiga-spirits.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_brands/en/taiga-spirits.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_brands/en/taiga-spirits.md
sed -i '' 's/site.tags/site.dimensions/g' ./_brands/en/taiga-spirits.md
sed -i '' 's/page.tags/page.dimensions/g' ./_brands/en/taiga-spirits.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_brands/en/taiga-spirits.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_brands/en/teatime.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_brands/en/teatime.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_brands/en/teatime.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_brands/en/teatime.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_brands/en/teatime.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_brands/en/teatime.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_brands/en/teatime.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_brands/en/teatime.md
sed -i '' 's/site.tags/site.dimensions/g' ./_brands/en/teatime.md
sed -i '' 's/page.tags/page.dimensions/g' ./_brands/en/teatime.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_brands/en/teatime.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_tags/ru/sectors/natural-beauty-products.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_tags/ru/sectors/natural-beauty-products.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_tags/ru/sectors/natural-beauty-products.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_tags/ru/sectors/natural-beauty-products.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_tags/ru/sectors/natural-beauty-products.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_tags/ru/sectors/natural-beauty-products.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_tags/ru/sectors/natural-beauty-products.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_tags/ru/sectors/natural-beauty-products.md
sed -i '' 's/site.tags/site.dimensions/g' ./_tags/ru/sectors/natural-beauty-products.md
sed -i '' 's/page.tags/page.dimensions/g' ./_tags/ru/sectors/natural-beauty-products.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_tags/ru/sectors/natural-beauty-products.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_tags/ru/sectors/natural-food-supplements.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_tags/ru/sectors/natural-food-supplements.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_tags/ru/sectors/natural-food-supplements.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_tags/ru/sectors/natural-food-supplements.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_tags/ru/sectors/natural-food-supplements.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_tags/ru/sectors/natural-food-supplements.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_tags/ru/sectors/natural-food-supplements.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_tags/ru/sectors/natural-food-supplements.md
sed -i '' 's/site.tags/site.dimensions/g' ./_tags/ru/sectors/natural-food-supplements.md
sed -i '' 's/page.tags/page.dimensions/g' ./_tags/ru/sectors/natural-food-supplements.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_tags/ru/sectors/natural-food-supplements.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_tags/ru/sectors/fashion.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_tags/ru/sectors/fashion.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_tags/ru/sectors/fashion.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_tags/ru/sectors/fashion.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_tags/ru/sectors/fashion.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_tags/ru/sectors/fashion.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_tags/ru/sectors/fashion.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_tags/ru/sectors/fashion.md
sed -i '' 's/site.tags/site.dimensions/g' ./_tags/ru/sectors/fashion.md
sed -i '' 's/page.tags/page.dimensions/g' ./_tags/ru/sectors/fashion.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_tags/ru/sectors/fashion.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_tags/ru/sectors/gourmet-foods.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_tags/ru/sectors/gourmet-foods.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_tags/ru/sectors/gourmet-foods.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_tags/ru/sectors/gourmet-foods.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_tags/ru/sectors/gourmet-foods.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_tags/ru/sectors/gourmet-foods.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_tags/ru/sectors/gourmet-foods.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_tags/ru/sectors/gourmet-foods.md
sed -i '' 's/site.tags/site.dimensions/g' ./_tags/ru/sectors/gourmet-foods.md
sed -i '' 's/page.tags/page.dimensions/g' ./_tags/ru/sectors/gourmet-foods.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_tags/ru/sectors/gourmet-foods.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_tags/ru/sectors/fermented-dairy.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_tags/ru/sectors/fermented-dairy.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_tags/ru/sectors/fermented-dairy.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_tags/ru/sectors/fermented-dairy.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_tags/ru/sectors/fermented-dairy.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_tags/ru/sectors/fermented-dairy.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_tags/ru/sectors/fermented-dairy.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_tags/ru/sectors/fermented-dairy.md
sed -i '' 's/site.tags/site.dimensions/g' ./_tags/ru/sectors/fermented-dairy.md
sed -i '' 's/page.tags/page.dimensions/g' ./_tags/ru/sectors/fermented-dairy.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_tags/ru/sectors/fermented-dairy.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_tags/ru/sectors/honey-bee-products.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_tags/ru/sectors/honey-bee-products.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_tags/ru/sectors/honey-bee-products.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_tags/ru/sectors/honey-bee-products.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_tags/ru/sectors/honey-bee-products.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_tags/ru/sectors/honey-bee-products.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_tags/ru/sectors/honey-bee-products.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_tags/ru/sectors/honey-bee-products.md
sed -i '' 's/site.tags/site.dimensions/g' ./_tags/ru/sectors/honey-bee-products.md
sed -i '' 's/page.tags/page.dimensions/g' ./_tags/ru/sectors/honey-bee-products.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_tags/ru/sectors/honey-bee-products.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_tags/ru/sectors/specialty-cheeses.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_tags/ru/sectors/specialty-cheeses.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_tags/ru/sectors/specialty-cheeses.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_tags/ru/sectors/specialty-cheeses.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_tags/ru/sectors/specialty-cheeses.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_tags/ru/sectors/specialty-cheeses.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_tags/ru/sectors/specialty-cheeses.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_tags/ru/sectors/specialty-cheeses.md
sed -i '' 's/site.tags/site.dimensions/g' ./_tags/ru/sectors/specialty-cheeses.md
sed -i '' 's/page.tags/page.dimensions/g' ./_tags/ru/sectors/specialty-cheeses.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_tags/ru/sectors/specialty-cheeses.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_tags/ru/sectors/halal-food-products.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_tags/ru/sectors/halal-food-products.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_tags/ru/sectors/halal-food-products.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_tags/ru/sectors/halal-food-products.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_tags/ru/sectors/halal-food-products.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_tags/ru/sectors/halal-food-products.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_tags/ru/sectors/halal-food-products.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_tags/ru/sectors/halal-food-products.md
sed -i '' 's/site.tags/site.dimensions/g' ./_tags/ru/sectors/halal-food-products.md
sed -i '' 's/page.tags/page.dimensions/g' ./_tags/ru/sectors/halal-food-products.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_tags/ru/sectors/halal-food-products.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_tags/ru/sectors/mineral-waters.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_tags/ru/sectors/mineral-waters.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_tags/ru/sectors/mineral-waters.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_tags/ru/sectors/mineral-waters.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_tags/ru/sectors/mineral-waters.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_tags/ru/sectors/mineral-waters.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_tags/ru/sectors/mineral-waters.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_tags/ru/sectors/mineral-waters.md
sed -i '' 's/site.tags/site.dimensions/g' ./_tags/ru/sectors/mineral-waters.md
sed -i '' 's/page.tags/page.dimensions/g' ./_tags/ru/sectors/mineral-waters.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_tags/ru/sectors/mineral-waters.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_tags/ru/sectors/artisanal-spirits-vodka.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_tags/ru/sectors/artisanal-spirits-vodka.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_tags/ru/sectors/artisanal-spirits-vodka.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_tags/ru/sectors/artisanal-spirits-vodka.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_tags/ru/sectors/artisanal-spirits-vodka.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_tags/ru/sectors/artisanal-spirits-vodka.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_tags/ru/sectors/artisanal-spirits-vodka.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_tags/ru/sectors/artisanal-spirits-vodka.md
sed -i '' 's/site.tags/site.dimensions/g' ./_tags/ru/sectors/artisanal-spirits-vodka.md
sed -i '' 's/page.tags/page.dimensions/g' ./_tags/ru/sectors/artisanal-spirits-vodka.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_tags/ru/sectors/artisanal-spirits-vodka.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_tags/ru/sectors/jewelry-watches.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_tags/ru/sectors/jewelry-watches.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_tags/ru/sectors/jewelry-watches.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_tags/ru/sectors/jewelry-watches.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_tags/ru/sectors/jewelry-watches.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_tags/ru/sectors/jewelry-watches.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_tags/ru/sectors/jewelry-watches.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_tags/ru/sectors/jewelry-watches.md
sed -i '' 's/site.tags/site.dimensions/g' ./_tags/ru/sectors/jewelry-watches.md
sed -i '' 's/page.tags/page.dimensions/g' ./_tags/ru/sectors/jewelry-watches.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_tags/ru/sectors/jewelry-watches.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_tags/ru/sectors/artisan-porcelain-ceramics.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_tags/ru/sectors/artisan-porcelain-ceramics.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_tags/ru/sectors/artisan-porcelain-ceramics.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_tags/ru/sectors/artisan-porcelain-ceramics.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_tags/ru/sectors/artisan-porcelain-ceramics.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_tags/ru/sectors/artisan-porcelain-ceramics.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_tags/ru/sectors/artisan-porcelain-ceramics.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_tags/ru/sectors/artisan-porcelain-ceramics.md
sed -i '' 's/site.tags/site.dimensions/g' ./_tags/ru/sectors/artisan-porcelain-ceramics.md
sed -i '' 's/page.tags/page.dimensions/g' ./_tags/ru/sectors/artisan-porcelain-ceramics.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_tags/ru/sectors/artisan-porcelain-ceramics.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_tags/ru/sectors/salami-cured-meats.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_tags/ru/sectors/salami-cured-meats.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_tags/ru/sectors/salami-cured-meats.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_tags/ru/sectors/salami-cured-meats.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_tags/ru/sectors/salami-cured-meats.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_tags/ru/sectors/salami-cured-meats.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_tags/ru/sectors/salami-cured-meats.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_tags/ru/sectors/salami-cured-meats.md
sed -i '' 's/site.tags/site.dimensions/g' ./_tags/ru/sectors/salami-cured-meats.md
sed -i '' 's/page.tags/page.dimensions/g' ./_tags/ru/sectors/salami-cured-meats.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_tags/ru/sectors/salami-cured-meats.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_tags/ru/sectors/artisan-confectionery.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_tags/ru/sectors/artisan-confectionery.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_tags/ru/sectors/artisan-confectionery.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_tags/ru/sectors/artisan-confectionery.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_tags/ru/sectors/artisan-confectionery.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_tags/ru/sectors/artisan-confectionery.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_tags/ru/sectors/artisan-confectionery.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_tags/ru/sectors/artisan-confectionery.md
sed -i '' 's/site.tags/site.dimensions/g' ./_tags/ru/sectors/artisan-confectionery.md
sed -i '' 's/page.tags/page.dimensions/g' ./_tags/ru/sectors/artisan-confectionery.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_tags/ru/sectors/artisan-confectionery.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_tags/ru/sectors/hotels-resorts.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_tags/ru/sectors/hotels-resorts.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_tags/ru/sectors/hotels-resorts.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_tags/ru/sectors/hotels-resorts.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_tags/ru/sectors/hotels-resorts.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_tags/ru/sectors/hotels-resorts.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_tags/ru/sectors/hotels-resorts.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_tags/ru/sectors/hotels-resorts.md
sed -i '' 's/site.tags/site.dimensions/g' ./_tags/ru/sectors/hotels-resorts.md
sed -i '' 's/page.tags/page.dimensions/g' ./_tags/ru/sectors/hotels-resorts.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_tags/ru/sectors/hotels-resorts.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_tags/ru/sectors/wine.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_tags/ru/sectors/wine.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_tags/ru/sectors/wine.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_tags/ru/sectors/wine.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_tags/ru/sectors/wine.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_tags/ru/sectors/wine.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_tags/ru/sectors/wine.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_tags/ru/sectors/wine.md
sed -i '' 's/site.tags/site.dimensions/g' ./_tags/ru/sectors/wine.md
sed -i '' 's/page.tags/page.dimensions/g' ./_tags/ru/sectors/wine.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_tags/ru/sectors/wine.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_tags/ru/signals/investment-ready.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_tags/ru/signals/investment-ready.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_tags/ru/signals/investment-ready.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_tags/ru/signals/investment-ready.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_tags/ru/signals/investment-ready.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_tags/ru/signals/investment-ready.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_tags/ru/signals/investment-ready.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_tags/ru/signals/investment-ready.md
sed -i '' 's/site.tags/site.dimensions/g' ./_tags/ru/signals/investment-ready.md
sed -i '' 's/page.tags/page.dimensions/g' ./_tags/ru/signals/investment-ready.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_tags/ru/signals/investment-ready.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_tags/ru/signals/export-ready.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_tags/ru/signals/export-ready.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_tags/ru/signals/export-ready.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_tags/ru/signals/export-ready.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_tags/ru/signals/export-ready.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_tags/ru/signals/export-ready.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_tags/ru/signals/export-ready.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_tags/ru/signals/export-ready.md
sed -i '' 's/site.tags/site.dimensions/g' ./_tags/ru/signals/export-ready.md
sed -i '' 's/page.tags/page.dimensions/g' ./_tags/ru/signals/export-ready.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_tags/ru/signals/export-ready.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_tags/ru/signals/franchise-ready.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_tags/ru/signals/franchise-ready.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_tags/ru/signals/franchise-ready.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_tags/ru/signals/franchise-ready.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_tags/ru/signals/franchise-ready.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_tags/ru/signals/franchise-ready.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_tags/ru/signals/franchise-ready.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_tags/ru/signals/franchise-ready.md
sed -i '' 's/site.tags/site.dimensions/g' ./_tags/ru/signals/franchise-ready.md
sed -i '' 's/page.tags/page.dimensions/g' ./_tags/ru/signals/franchise-ready.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_tags/ru/signals/franchise-ready.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_tags/ru/signals/rapid-growth.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_tags/ru/signals/rapid-growth.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_tags/ru/signals/rapid-growth.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_tags/ru/signals/rapid-growth.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_tags/ru/signals/rapid-growth.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_tags/ru/signals/rapid-growth.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_tags/ru/signals/rapid-growth.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_tags/ru/signals/rapid-growth.md
sed -i '' 's/site.tags/site.dimensions/g' ./_tags/ru/signals/rapid-growth.md
sed -i '' 's/page.tags/page.dimensions/g' ./_tags/ru/signals/rapid-growth.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_tags/ru/signals/rapid-growth.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_tags/ru/attributes/premium-positioning.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_tags/ru/attributes/premium-positioning.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_tags/ru/attributes/premium-positioning.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_tags/ru/attributes/premium-positioning.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_tags/ru/attributes/premium-positioning.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_tags/ru/attributes/premium-positioning.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_tags/ru/attributes/premium-positioning.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_tags/ru/attributes/premium-positioning.md
sed -i '' 's/site.tags/site.dimensions/g' ./_tags/ru/attributes/premium-positioning.md
sed -i '' 's/page.tags/page.dimensions/g' ./_tags/ru/attributes/premium-positioning.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_tags/ru/attributes/premium-positioning.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_tags/ru/attributes/innovation-leader.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_tags/ru/attributes/innovation-leader.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_tags/ru/attributes/innovation-leader.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_tags/ru/attributes/innovation-leader.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_tags/ru/attributes/innovation-leader.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_tags/ru/attributes/innovation-leader.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_tags/ru/attributes/innovation-leader.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_tags/ru/attributes/innovation-leader.md
sed -i '' 's/site.tags/site.dimensions/g' ./_tags/ru/attributes/innovation-leader.md
sed -i '' 's/page.tags/page.dimensions/g' ./_tags/ru/attributes/innovation-leader.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_tags/ru/attributes/innovation-leader.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_tags/ru/attributes/cultural-ambassador.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_tags/ru/attributes/cultural-ambassador.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_tags/ru/attributes/cultural-ambassador.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_tags/ru/attributes/cultural-ambassador.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_tags/ru/attributes/cultural-ambassador.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_tags/ru/attributes/cultural-ambassador.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_tags/ru/attributes/cultural-ambassador.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_tags/ru/attributes/cultural-ambassador.md
sed -i '' 's/site.tags/site.dimensions/g' ./_tags/ru/attributes/cultural-ambassador.md
sed -i '' 's/page.tags/page.dimensions/g' ./_tags/ru/attributes/cultural-ambassador.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_tags/ru/attributes/cultural-ambassador.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_tags/ru/attributes/artisanal-excellence.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_tags/ru/attributes/artisanal-excellence.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_tags/ru/attributes/artisanal-excellence.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_tags/ru/attributes/artisanal-excellence.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_tags/ru/attributes/artisanal-excellence.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_tags/ru/attributes/artisanal-excellence.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_tags/ru/attributes/artisanal-excellence.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_tags/ru/attributes/artisanal-excellence.md
sed -i '' 's/site.tags/site.dimensions/g' ./_tags/ru/attributes/artisanal-excellence.md
sed -i '' 's/page.tags/page.dimensions/g' ./_tags/ru/attributes/artisanal-excellence.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_tags/ru/attributes/artisanal-excellence.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_tags/ru/attributes/sustainability-pioneer.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_tags/ru/attributes/sustainability-pioneer.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_tags/ru/attributes/sustainability-pioneer.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_tags/ru/attributes/sustainability-pioneer.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_tags/ru/attributes/sustainability-pioneer.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_tags/ru/attributes/sustainability-pioneer.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_tags/ru/attributes/sustainability-pioneer.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_tags/ru/attributes/sustainability-pioneer.md
sed -i '' 's/site.tags/site.dimensions/g' ./_tags/ru/attributes/sustainability-pioneer.md
sed -i '' 's/page.tags/page.dimensions/g' ./_tags/ru/attributes/sustainability-pioneer.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_tags/ru/attributes/sustainability-pioneer.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_tags/ru/attributes/founder-led.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_tags/ru/attributes/founder-led.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_tags/ru/attributes/founder-led.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_tags/ru/attributes/founder-led.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_tags/ru/attributes/founder-led.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_tags/ru/attributes/founder-led.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_tags/ru/attributes/founder-led.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_tags/ru/attributes/founder-led.md
sed -i '' 's/site.tags/site.dimensions/g' ./_tags/ru/attributes/founder-led.md
sed -i '' 's/page.tags/page.dimensions/g' ./_tags/ru/attributes/founder-led.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_tags/ru/attributes/founder-led.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_tags/ru/attributes/regional-icon.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_tags/ru/attributes/regional-icon.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_tags/ru/attributes/regional-icon.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_tags/ru/attributes/regional-icon.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_tags/ru/attributes/regional-icon.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_tags/ru/attributes/regional-icon.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_tags/ru/attributes/regional-icon.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_tags/ru/attributes/regional-icon.md
sed -i '' 's/site.tags/site.dimensions/g' ./_tags/ru/attributes/regional-icon.md
sed -i '' 's/page.tags/page.dimensions/g' ./_tags/ru/attributes/regional-icon.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_tags/ru/attributes/regional-icon.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_tags/ru/attributes/heritage-brand.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_tags/ru/attributes/heritage-brand.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_tags/ru/attributes/heritage-brand.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_tags/ru/attributes/heritage-brand.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_tags/ru/attributes/heritage-brand.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_tags/ru/attributes/heritage-brand.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_tags/ru/attributes/heritage-brand.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_tags/ru/attributes/heritage-brand.md
sed -i '' 's/site.tags/site.dimensions/g' ./_tags/ru/attributes/heritage-brand.md
sed -i '' 's/page.tags/page.dimensions/g' ./_tags/ru/attributes/heritage-brand.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_tags/ru/attributes/heritage-brand.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_tags/ru/markets/china.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_tags/ru/markets/china.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_tags/ru/markets/china.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_tags/ru/markets/china.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_tags/ru/markets/china.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_tags/ru/markets/china.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_tags/ru/markets/china.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_tags/ru/markets/china.md
sed -i '' 's/site.tags/site.dimensions/g' ./_tags/ru/markets/china.md
sed -i '' 's/page.tags/page.dimensions/g' ./_tags/ru/markets/china.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_tags/ru/markets/china.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_tags/ru/markets/brazil.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_tags/ru/markets/brazil.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_tags/ru/markets/brazil.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_tags/ru/markets/brazil.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_tags/ru/markets/brazil.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_tags/ru/markets/brazil.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_tags/ru/markets/brazil.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_tags/ru/markets/brazil.md
sed -i '' 's/site.tags/site.dimensions/g' ./_tags/ru/markets/brazil.md
sed -i '' 's/page.tags/page.dimensions/g' ./_tags/ru/markets/brazil.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_tags/ru/markets/brazil.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_tags/ru/markets/south-africa.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_tags/ru/markets/south-africa.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_tags/ru/markets/south-africa.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_tags/ru/markets/south-africa.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_tags/ru/markets/south-africa.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_tags/ru/markets/south-africa.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_tags/ru/markets/south-africa.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_tags/ru/markets/south-africa.md
sed -i '' 's/site.tags/site.dimensions/g' ./_tags/ru/markets/south-africa.md
sed -i '' 's/page.tags/page.dimensions/g' ./_tags/ru/markets/south-africa.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_tags/ru/markets/south-africa.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_tags/ru/markets/india.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_tags/ru/markets/india.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_tags/ru/markets/india.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_tags/ru/markets/india.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_tags/ru/markets/india.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_tags/ru/markets/india.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_tags/ru/markets/india.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_tags/ru/markets/india.md
sed -i '' 's/site.tags/site.dimensions/g' ./_tags/ru/markets/india.md
sed -i '' 's/page.tags/page.dimensions/g' ./_tags/ru/markets/india.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_tags/ru/markets/india.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_tags/ru/markets/russia.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_tags/ru/markets/russia.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_tags/ru/markets/russia.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_tags/ru/markets/russia.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_tags/ru/markets/russia.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_tags/ru/markets/russia.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_tags/ru/markets/russia.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_tags/ru/markets/russia.md
sed -i '' 's/site.tags/site.dimensions/g' ./_tags/ru/markets/russia.md
sed -i '' 's/page.tags/page.dimensions/g' ./_tags/ru/markets/russia.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_tags/ru/markets/russia.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_tags/zh/sectors/natural-beauty-products.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_tags/zh/sectors/natural-beauty-products.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_tags/zh/sectors/natural-beauty-products.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_tags/zh/sectors/natural-beauty-products.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_tags/zh/sectors/natural-beauty-products.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_tags/zh/sectors/natural-beauty-products.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_tags/zh/sectors/natural-beauty-products.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_tags/zh/sectors/natural-beauty-products.md
sed -i '' 's/site.tags/site.dimensions/g' ./_tags/zh/sectors/natural-beauty-products.md
sed -i '' 's/page.tags/page.dimensions/g' ./_tags/zh/sectors/natural-beauty-products.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_tags/zh/sectors/natural-beauty-products.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_tags/zh/sectors/natural-food-supplements.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_tags/zh/sectors/natural-food-supplements.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_tags/zh/sectors/natural-food-supplements.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_tags/zh/sectors/natural-food-supplements.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_tags/zh/sectors/natural-food-supplements.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_tags/zh/sectors/natural-food-supplements.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_tags/zh/sectors/natural-food-supplements.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_tags/zh/sectors/natural-food-supplements.md
sed -i '' 's/site.tags/site.dimensions/g' ./_tags/zh/sectors/natural-food-supplements.md
sed -i '' 's/page.tags/page.dimensions/g' ./_tags/zh/sectors/natural-food-supplements.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_tags/zh/sectors/natural-food-supplements.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_tags/zh/sectors/fashion.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_tags/zh/sectors/fashion.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_tags/zh/sectors/fashion.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_tags/zh/sectors/fashion.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_tags/zh/sectors/fashion.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_tags/zh/sectors/fashion.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_tags/zh/sectors/fashion.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_tags/zh/sectors/fashion.md
sed -i '' 's/site.tags/site.dimensions/g' ./_tags/zh/sectors/fashion.md
sed -i '' 's/page.tags/page.dimensions/g' ./_tags/zh/sectors/fashion.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_tags/zh/sectors/fashion.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_tags/zh/sectors/gourmet-foods.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_tags/zh/sectors/gourmet-foods.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_tags/zh/sectors/gourmet-foods.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_tags/zh/sectors/gourmet-foods.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_tags/zh/sectors/gourmet-foods.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_tags/zh/sectors/gourmet-foods.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_tags/zh/sectors/gourmet-foods.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_tags/zh/sectors/gourmet-foods.md
sed -i '' 's/site.tags/site.dimensions/g' ./_tags/zh/sectors/gourmet-foods.md
sed -i '' 's/page.tags/page.dimensions/g' ./_tags/zh/sectors/gourmet-foods.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_tags/zh/sectors/gourmet-foods.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_tags/zh/sectors/fermented-dairy.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_tags/zh/sectors/fermented-dairy.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_tags/zh/sectors/fermented-dairy.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_tags/zh/sectors/fermented-dairy.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_tags/zh/sectors/fermented-dairy.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_tags/zh/sectors/fermented-dairy.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_tags/zh/sectors/fermented-dairy.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_tags/zh/sectors/fermented-dairy.md
sed -i '' 's/site.tags/site.dimensions/g' ./_tags/zh/sectors/fermented-dairy.md
sed -i '' 's/page.tags/page.dimensions/g' ./_tags/zh/sectors/fermented-dairy.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_tags/zh/sectors/fermented-dairy.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_tags/zh/sectors/honey-bee-products.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_tags/zh/sectors/honey-bee-products.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_tags/zh/sectors/honey-bee-products.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_tags/zh/sectors/honey-bee-products.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_tags/zh/sectors/honey-bee-products.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_tags/zh/sectors/honey-bee-products.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_tags/zh/sectors/honey-bee-products.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_tags/zh/sectors/honey-bee-products.md
sed -i '' 's/site.tags/site.dimensions/g' ./_tags/zh/sectors/honey-bee-products.md
sed -i '' 's/page.tags/page.dimensions/g' ./_tags/zh/sectors/honey-bee-products.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_tags/zh/sectors/honey-bee-products.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_tags/zh/sectors/specialty-cheeses.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_tags/zh/sectors/specialty-cheeses.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_tags/zh/sectors/specialty-cheeses.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_tags/zh/sectors/specialty-cheeses.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_tags/zh/sectors/specialty-cheeses.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_tags/zh/sectors/specialty-cheeses.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_tags/zh/sectors/specialty-cheeses.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_tags/zh/sectors/specialty-cheeses.md
sed -i '' 's/site.tags/site.dimensions/g' ./_tags/zh/sectors/specialty-cheeses.md
sed -i '' 's/page.tags/page.dimensions/g' ./_tags/zh/sectors/specialty-cheeses.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_tags/zh/sectors/specialty-cheeses.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_tags/zh/sectors/halal-food-products.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_tags/zh/sectors/halal-food-products.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_tags/zh/sectors/halal-food-products.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_tags/zh/sectors/halal-food-products.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_tags/zh/sectors/halal-food-products.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_tags/zh/sectors/halal-food-products.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_tags/zh/sectors/halal-food-products.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_tags/zh/sectors/halal-food-products.md
sed -i '' 's/site.tags/site.dimensions/g' ./_tags/zh/sectors/halal-food-products.md
sed -i '' 's/page.tags/page.dimensions/g' ./_tags/zh/sectors/halal-food-products.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_tags/zh/sectors/halal-food-products.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_tags/zh/sectors/mineral-waters.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_tags/zh/sectors/mineral-waters.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_tags/zh/sectors/mineral-waters.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_tags/zh/sectors/mineral-waters.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_tags/zh/sectors/mineral-waters.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_tags/zh/sectors/mineral-waters.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_tags/zh/sectors/mineral-waters.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_tags/zh/sectors/mineral-waters.md
sed -i '' 's/site.tags/site.dimensions/g' ./_tags/zh/sectors/mineral-waters.md
sed -i '' 's/page.tags/page.dimensions/g' ./_tags/zh/sectors/mineral-waters.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_tags/zh/sectors/mineral-waters.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_tags/zh/sectors/artisanal-spirits-vodka.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_tags/zh/sectors/artisanal-spirits-vodka.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_tags/zh/sectors/artisanal-spirits-vodka.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_tags/zh/sectors/artisanal-spirits-vodka.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_tags/zh/sectors/artisanal-spirits-vodka.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_tags/zh/sectors/artisanal-spirits-vodka.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_tags/zh/sectors/artisanal-spirits-vodka.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_tags/zh/sectors/artisanal-spirits-vodka.md
sed -i '' 's/site.tags/site.dimensions/g' ./_tags/zh/sectors/artisanal-spirits-vodka.md
sed -i '' 's/page.tags/page.dimensions/g' ./_tags/zh/sectors/artisanal-spirits-vodka.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_tags/zh/sectors/artisanal-spirits-vodka.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_tags/zh/sectors/jewelry-watches.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_tags/zh/sectors/jewelry-watches.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_tags/zh/sectors/jewelry-watches.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_tags/zh/sectors/jewelry-watches.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_tags/zh/sectors/jewelry-watches.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_tags/zh/sectors/jewelry-watches.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_tags/zh/sectors/jewelry-watches.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_tags/zh/sectors/jewelry-watches.md
sed -i '' 's/site.tags/site.dimensions/g' ./_tags/zh/sectors/jewelry-watches.md
sed -i '' 's/page.tags/page.dimensions/g' ./_tags/zh/sectors/jewelry-watches.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_tags/zh/sectors/jewelry-watches.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_tags/zh/sectors/artisan-porcelain-ceramics.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_tags/zh/sectors/artisan-porcelain-ceramics.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_tags/zh/sectors/artisan-porcelain-ceramics.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_tags/zh/sectors/artisan-porcelain-ceramics.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_tags/zh/sectors/artisan-porcelain-ceramics.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_tags/zh/sectors/artisan-porcelain-ceramics.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_tags/zh/sectors/artisan-porcelain-ceramics.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_tags/zh/sectors/artisan-porcelain-ceramics.md
sed -i '' 's/site.tags/site.dimensions/g' ./_tags/zh/sectors/artisan-porcelain-ceramics.md
sed -i '' 's/page.tags/page.dimensions/g' ./_tags/zh/sectors/artisan-porcelain-ceramics.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_tags/zh/sectors/artisan-porcelain-ceramics.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_tags/zh/sectors/salami-cured-meats.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_tags/zh/sectors/salami-cured-meats.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_tags/zh/sectors/salami-cured-meats.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_tags/zh/sectors/salami-cured-meats.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_tags/zh/sectors/salami-cured-meats.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_tags/zh/sectors/salami-cured-meats.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_tags/zh/sectors/salami-cured-meats.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_tags/zh/sectors/salami-cured-meats.md
sed -i '' 's/site.tags/site.dimensions/g' ./_tags/zh/sectors/salami-cured-meats.md
sed -i '' 's/page.tags/page.dimensions/g' ./_tags/zh/sectors/salami-cured-meats.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_tags/zh/sectors/salami-cured-meats.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_tags/zh/sectors/artisan-confectionery.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_tags/zh/sectors/artisan-confectionery.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_tags/zh/sectors/artisan-confectionery.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_tags/zh/sectors/artisan-confectionery.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_tags/zh/sectors/artisan-confectionery.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_tags/zh/sectors/artisan-confectionery.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_tags/zh/sectors/artisan-confectionery.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_tags/zh/sectors/artisan-confectionery.md
sed -i '' 's/site.tags/site.dimensions/g' ./_tags/zh/sectors/artisan-confectionery.md
sed -i '' 's/page.tags/page.dimensions/g' ./_tags/zh/sectors/artisan-confectionery.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_tags/zh/sectors/artisan-confectionery.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_tags/zh/sectors/hotels-resorts.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_tags/zh/sectors/hotels-resorts.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_tags/zh/sectors/hotels-resorts.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_tags/zh/sectors/hotels-resorts.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_tags/zh/sectors/hotels-resorts.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_tags/zh/sectors/hotels-resorts.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_tags/zh/sectors/hotels-resorts.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_tags/zh/sectors/hotels-resorts.md
sed -i '' 's/site.tags/site.dimensions/g' ./_tags/zh/sectors/hotels-resorts.md
sed -i '' 's/page.tags/page.dimensions/g' ./_tags/zh/sectors/hotels-resorts.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_tags/zh/sectors/hotels-resorts.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_tags/zh/sectors/wine.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_tags/zh/sectors/wine.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_tags/zh/sectors/wine.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_tags/zh/sectors/wine.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_tags/zh/sectors/wine.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_tags/zh/sectors/wine.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_tags/zh/sectors/wine.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_tags/zh/sectors/wine.md
sed -i '' 's/site.tags/site.dimensions/g' ./_tags/zh/sectors/wine.md
sed -i '' 's/page.tags/page.dimensions/g' ./_tags/zh/sectors/wine.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_tags/zh/sectors/wine.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_tags/zh/signals/investment-ready.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_tags/zh/signals/investment-ready.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_tags/zh/signals/investment-ready.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_tags/zh/signals/investment-ready.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_tags/zh/signals/investment-ready.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_tags/zh/signals/investment-ready.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_tags/zh/signals/investment-ready.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_tags/zh/signals/investment-ready.md
sed -i '' 's/site.tags/site.dimensions/g' ./_tags/zh/signals/investment-ready.md
sed -i '' 's/page.tags/page.dimensions/g' ./_tags/zh/signals/investment-ready.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_tags/zh/signals/investment-ready.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_tags/zh/signals/export-ready.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_tags/zh/signals/export-ready.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_tags/zh/signals/export-ready.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_tags/zh/signals/export-ready.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_tags/zh/signals/export-ready.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_tags/zh/signals/export-ready.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_tags/zh/signals/export-ready.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_tags/zh/signals/export-ready.md
sed -i '' 's/site.tags/site.dimensions/g' ./_tags/zh/signals/export-ready.md
sed -i '' 's/page.tags/page.dimensions/g' ./_tags/zh/signals/export-ready.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_tags/zh/signals/export-ready.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_tags/zh/signals/franchise-ready.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_tags/zh/signals/franchise-ready.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_tags/zh/signals/franchise-ready.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_tags/zh/signals/franchise-ready.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_tags/zh/signals/franchise-ready.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_tags/zh/signals/franchise-ready.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_tags/zh/signals/franchise-ready.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_tags/zh/signals/franchise-ready.md
sed -i '' 's/site.tags/site.dimensions/g' ./_tags/zh/signals/franchise-ready.md
sed -i '' 's/page.tags/page.dimensions/g' ./_tags/zh/signals/franchise-ready.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_tags/zh/signals/franchise-ready.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_tags/zh/signals/rapid-growth.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_tags/zh/signals/rapid-growth.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_tags/zh/signals/rapid-growth.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_tags/zh/signals/rapid-growth.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_tags/zh/signals/rapid-growth.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_tags/zh/signals/rapid-growth.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_tags/zh/signals/rapid-growth.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_tags/zh/signals/rapid-growth.md
sed -i '' 's/site.tags/site.dimensions/g' ./_tags/zh/signals/rapid-growth.md
sed -i '' 's/page.tags/page.dimensions/g' ./_tags/zh/signals/rapid-growth.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_tags/zh/signals/rapid-growth.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_tags/zh/attributes/premium-positioning.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_tags/zh/attributes/premium-positioning.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_tags/zh/attributes/premium-positioning.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_tags/zh/attributes/premium-positioning.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_tags/zh/attributes/premium-positioning.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_tags/zh/attributes/premium-positioning.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_tags/zh/attributes/premium-positioning.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_tags/zh/attributes/premium-positioning.md
sed -i '' 's/site.tags/site.dimensions/g' ./_tags/zh/attributes/premium-positioning.md
sed -i '' 's/page.tags/page.dimensions/g' ./_tags/zh/attributes/premium-positioning.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_tags/zh/attributes/premium-positioning.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_tags/zh/attributes/innovation-leader.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_tags/zh/attributes/innovation-leader.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_tags/zh/attributes/innovation-leader.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_tags/zh/attributes/innovation-leader.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_tags/zh/attributes/innovation-leader.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_tags/zh/attributes/innovation-leader.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_tags/zh/attributes/innovation-leader.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_tags/zh/attributes/innovation-leader.md
sed -i '' 's/site.tags/site.dimensions/g' ./_tags/zh/attributes/innovation-leader.md
sed -i '' 's/page.tags/page.dimensions/g' ./_tags/zh/attributes/innovation-leader.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_tags/zh/attributes/innovation-leader.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_tags/zh/attributes/cultural-ambassador.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_tags/zh/attributes/cultural-ambassador.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_tags/zh/attributes/cultural-ambassador.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_tags/zh/attributes/cultural-ambassador.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_tags/zh/attributes/cultural-ambassador.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_tags/zh/attributes/cultural-ambassador.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_tags/zh/attributes/cultural-ambassador.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_tags/zh/attributes/cultural-ambassador.md
sed -i '' 's/site.tags/site.dimensions/g' ./_tags/zh/attributes/cultural-ambassador.md
sed -i '' 's/page.tags/page.dimensions/g' ./_tags/zh/attributes/cultural-ambassador.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_tags/zh/attributes/cultural-ambassador.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_tags/zh/attributes/artisanal-excellence.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_tags/zh/attributes/artisanal-excellence.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_tags/zh/attributes/artisanal-excellence.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_tags/zh/attributes/artisanal-excellence.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_tags/zh/attributes/artisanal-excellence.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_tags/zh/attributes/artisanal-excellence.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_tags/zh/attributes/artisanal-excellence.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_tags/zh/attributes/artisanal-excellence.md
sed -i '' 's/site.tags/site.dimensions/g' ./_tags/zh/attributes/artisanal-excellence.md
sed -i '' 's/page.tags/page.dimensions/g' ./_tags/zh/attributes/artisanal-excellence.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_tags/zh/attributes/artisanal-excellence.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_tags/zh/attributes/sustainability-pioneer.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_tags/zh/attributes/sustainability-pioneer.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_tags/zh/attributes/sustainability-pioneer.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_tags/zh/attributes/sustainability-pioneer.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_tags/zh/attributes/sustainability-pioneer.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_tags/zh/attributes/sustainability-pioneer.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_tags/zh/attributes/sustainability-pioneer.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_tags/zh/attributes/sustainability-pioneer.md
sed -i '' 's/site.tags/site.dimensions/g' ./_tags/zh/attributes/sustainability-pioneer.md
sed -i '' 's/page.tags/page.dimensions/g' ./_tags/zh/attributes/sustainability-pioneer.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_tags/zh/attributes/sustainability-pioneer.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_tags/zh/attributes/founder-led.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_tags/zh/attributes/founder-led.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_tags/zh/attributes/founder-led.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_tags/zh/attributes/founder-led.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_tags/zh/attributes/founder-led.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_tags/zh/attributes/founder-led.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_tags/zh/attributes/founder-led.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_tags/zh/attributes/founder-led.md
sed -i '' 's/site.tags/site.dimensions/g' ./_tags/zh/attributes/founder-led.md
sed -i '' 's/page.tags/page.dimensions/g' ./_tags/zh/attributes/founder-led.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_tags/zh/attributes/founder-led.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_tags/zh/attributes/regional-icon.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_tags/zh/attributes/regional-icon.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_tags/zh/attributes/regional-icon.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_tags/zh/attributes/regional-icon.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_tags/zh/attributes/regional-icon.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_tags/zh/attributes/regional-icon.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_tags/zh/attributes/regional-icon.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_tags/zh/attributes/regional-icon.md
sed -i '' 's/site.tags/site.dimensions/g' ./_tags/zh/attributes/regional-icon.md
sed -i '' 's/page.tags/page.dimensions/g' ./_tags/zh/attributes/regional-icon.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_tags/zh/attributes/regional-icon.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_tags/zh/attributes/heritage-brand.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_tags/zh/attributes/heritage-brand.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_tags/zh/attributes/heritage-brand.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_tags/zh/attributes/heritage-brand.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_tags/zh/attributes/heritage-brand.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_tags/zh/attributes/heritage-brand.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_tags/zh/attributes/heritage-brand.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_tags/zh/attributes/heritage-brand.md
sed -i '' 's/site.tags/site.dimensions/g' ./_tags/zh/attributes/heritage-brand.md
sed -i '' 's/page.tags/page.dimensions/g' ./_tags/zh/attributes/heritage-brand.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_tags/zh/attributes/heritage-brand.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_tags/zh/markets/china.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_tags/zh/markets/china.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_tags/zh/markets/china.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_tags/zh/markets/china.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_tags/zh/markets/china.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_tags/zh/markets/china.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_tags/zh/markets/china.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_tags/zh/markets/china.md
sed -i '' 's/site.tags/site.dimensions/g' ./_tags/zh/markets/china.md
sed -i '' 's/page.tags/page.dimensions/g' ./_tags/zh/markets/china.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_tags/zh/markets/china.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_tags/zh/markets/brazil.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_tags/zh/markets/brazil.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_tags/zh/markets/brazil.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_tags/zh/markets/brazil.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_tags/zh/markets/brazil.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_tags/zh/markets/brazil.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_tags/zh/markets/brazil.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_tags/zh/markets/brazil.md
sed -i '' 's/site.tags/site.dimensions/g' ./_tags/zh/markets/brazil.md
sed -i '' 's/page.tags/page.dimensions/g' ./_tags/zh/markets/brazil.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_tags/zh/markets/brazil.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_tags/zh/markets/south-africa.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_tags/zh/markets/south-africa.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_tags/zh/markets/south-africa.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_tags/zh/markets/south-africa.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_tags/zh/markets/south-africa.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_tags/zh/markets/south-africa.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_tags/zh/markets/south-africa.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_tags/zh/markets/south-africa.md
sed -i '' 's/site.tags/site.dimensions/g' ./_tags/zh/markets/south-africa.md
sed -i '' 's/page.tags/page.dimensions/g' ./_tags/zh/markets/south-africa.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_tags/zh/markets/south-africa.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_tags/zh/markets/india.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_tags/zh/markets/india.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_tags/zh/markets/india.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_tags/zh/markets/india.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_tags/zh/markets/india.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_tags/zh/markets/india.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_tags/zh/markets/india.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_tags/zh/markets/india.md
sed -i '' 's/site.tags/site.dimensions/g' ./_tags/zh/markets/india.md
sed -i '' 's/page.tags/page.dimensions/g' ./_tags/zh/markets/india.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_tags/zh/markets/india.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_tags/zh/markets/russia.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_tags/zh/markets/russia.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_tags/zh/markets/russia.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_tags/zh/markets/russia.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_tags/zh/markets/russia.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_tags/zh/markets/russia.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_tags/zh/markets/russia.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_tags/zh/markets/russia.md
sed -i '' 's/site.tags/site.dimensions/g' ./_tags/zh/markets/russia.md
sed -i '' 's/page.tags/page.dimensions/g' ./_tags/zh/markets/russia.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_tags/zh/markets/russia.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_tags/en/sectors/natural-beauty-products.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_tags/en/sectors/natural-beauty-products.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_tags/en/sectors/natural-beauty-products.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_tags/en/sectors/natural-beauty-products.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_tags/en/sectors/natural-beauty-products.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_tags/en/sectors/natural-beauty-products.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_tags/en/sectors/natural-beauty-products.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_tags/en/sectors/natural-beauty-products.md
sed -i '' 's/site.tags/site.dimensions/g' ./_tags/en/sectors/natural-beauty-products.md
sed -i '' 's/page.tags/page.dimensions/g' ./_tags/en/sectors/natural-beauty-products.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_tags/en/sectors/natural-beauty-products.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_tags/en/sectors/natural-food-supplements.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_tags/en/sectors/natural-food-supplements.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_tags/en/sectors/natural-food-supplements.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_tags/en/sectors/natural-food-supplements.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_tags/en/sectors/natural-food-supplements.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_tags/en/sectors/natural-food-supplements.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_tags/en/sectors/natural-food-supplements.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_tags/en/sectors/natural-food-supplements.md
sed -i '' 's/site.tags/site.dimensions/g' ./_tags/en/sectors/natural-food-supplements.md
sed -i '' 's/page.tags/page.dimensions/g' ./_tags/en/sectors/natural-food-supplements.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_tags/en/sectors/natural-food-supplements.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_tags/en/sectors/fashion.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_tags/en/sectors/fashion.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_tags/en/sectors/fashion.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_tags/en/sectors/fashion.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_tags/en/sectors/fashion.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_tags/en/sectors/fashion.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_tags/en/sectors/fashion.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_tags/en/sectors/fashion.md
sed -i '' 's/site.tags/site.dimensions/g' ./_tags/en/sectors/fashion.md
sed -i '' 's/page.tags/page.dimensions/g' ./_tags/en/sectors/fashion.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_tags/en/sectors/fashion.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_tags/en/sectors/gourmet-foods.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_tags/en/sectors/gourmet-foods.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_tags/en/sectors/gourmet-foods.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_tags/en/sectors/gourmet-foods.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_tags/en/sectors/gourmet-foods.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_tags/en/sectors/gourmet-foods.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_tags/en/sectors/gourmet-foods.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_tags/en/sectors/gourmet-foods.md
sed -i '' 's/site.tags/site.dimensions/g' ./_tags/en/sectors/gourmet-foods.md
sed -i '' 's/page.tags/page.dimensions/g' ./_tags/en/sectors/gourmet-foods.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_tags/en/sectors/gourmet-foods.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_tags/en/sectors/fermented-dairy.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_tags/en/sectors/fermented-dairy.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_tags/en/sectors/fermented-dairy.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_tags/en/sectors/fermented-dairy.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_tags/en/sectors/fermented-dairy.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_tags/en/sectors/fermented-dairy.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_tags/en/sectors/fermented-dairy.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_tags/en/sectors/fermented-dairy.md
sed -i '' 's/site.tags/site.dimensions/g' ./_tags/en/sectors/fermented-dairy.md
sed -i '' 's/page.tags/page.dimensions/g' ./_tags/en/sectors/fermented-dairy.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_tags/en/sectors/fermented-dairy.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_tags/en/sectors/honey-bee-products.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_tags/en/sectors/honey-bee-products.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_tags/en/sectors/honey-bee-products.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_tags/en/sectors/honey-bee-products.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_tags/en/sectors/honey-bee-products.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_tags/en/sectors/honey-bee-products.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_tags/en/sectors/honey-bee-products.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_tags/en/sectors/honey-bee-products.md
sed -i '' 's/site.tags/site.dimensions/g' ./_tags/en/sectors/honey-bee-products.md
sed -i '' 's/page.tags/page.dimensions/g' ./_tags/en/sectors/honey-bee-products.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_tags/en/sectors/honey-bee-products.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_tags/en/sectors/specialty-cheeses.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_tags/en/sectors/specialty-cheeses.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_tags/en/sectors/specialty-cheeses.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_tags/en/sectors/specialty-cheeses.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_tags/en/sectors/specialty-cheeses.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_tags/en/sectors/specialty-cheeses.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_tags/en/sectors/specialty-cheeses.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_tags/en/sectors/specialty-cheeses.md
sed -i '' 's/site.tags/site.dimensions/g' ./_tags/en/sectors/specialty-cheeses.md
sed -i '' 's/page.tags/page.dimensions/g' ./_tags/en/sectors/specialty-cheeses.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_tags/en/sectors/specialty-cheeses.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_tags/en/sectors/halal-food-products.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_tags/en/sectors/halal-food-products.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_tags/en/sectors/halal-food-products.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_tags/en/sectors/halal-food-products.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_tags/en/sectors/halal-food-products.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_tags/en/sectors/halal-food-products.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_tags/en/sectors/halal-food-products.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_tags/en/sectors/halal-food-products.md
sed -i '' 's/site.tags/site.dimensions/g' ./_tags/en/sectors/halal-food-products.md
sed -i '' 's/page.tags/page.dimensions/g' ./_tags/en/sectors/halal-food-products.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_tags/en/sectors/halal-food-products.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_tags/en/sectors/mineral-waters.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_tags/en/sectors/mineral-waters.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_tags/en/sectors/mineral-waters.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_tags/en/sectors/mineral-waters.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_tags/en/sectors/mineral-waters.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_tags/en/sectors/mineral-waters.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_tags/en/sectors/mineral-waters.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_tags/en/sectors/mineral-waters.md
sed -i '' 's/site.tags/site.dimensions/g' ./_tags/en/sectors/mineral-waters.md
sed -i '' 's/page.tags/page.dimensions/g' ./_tags/en/sectors/mineral-waters.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_tags/en/sectors/mineral-waters.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_tags/en/sectors/artisanal-spirits-vodka.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_tags/en/sectors/artisanal-spirits-vodka.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_tags/en/sectors/artisanal-spirits-vodka.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_tags/en/sectors/artisanal-spirits-vodka.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_tags/en/sectors/artisanal-spirits-vodka.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_tags/en/sectors/artisanal-spirits-vodka.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_tags/en/sectors/artisanal-spirits-vodka.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_tags/en/sectors/artisanal-spirits-vodka.md
sed -i '' 's/site.tags/site.dimensions/g' ./_tags/en/sectors/artisanal-spirits-vodka.md
sed -i '' 's/page.tags/page.dimensions/g' ./_tags/en/sectors/artisanal-spirits-vodka.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_tags/en/sectors/artisanal-spirits-vodka.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_tags/en/sectors/jewelry-watches.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_tags/en/sectors/jewelry-watches.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_tags/en/sectors/jewelry-watches.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_tags/en/sectors/jewelry-watches.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_tags/en/sectors/jewelry-watches.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_tags/en/sectors/jewelry-watches.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_tags/en/sectors/jewelry-watches.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_tags/en/sectors/jewelry-watches.md
sed -i '' 's/site.tags/site.dimensions/g' ./_tags/en/sectors/jewelry-watches.md
sed -i '' 's/page.tags/page.dimensions/g' ./_tags/en/sectors/jewelry-watches.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_tags/en/sectors/jewelry-watches.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_tags/en/sectors/artisan-porcelain-ceramics.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_tags/en/sectors/artisan-porcelain-ceramics.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_tags/en/sectors/artisan-porcelain-ceramics.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_tags/en/sectors/artisan-porcelain-ceramics.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_tags/en/sectors/artisan-porcelain-ceramics.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_tags/en/sectors/artisan-porcelain-ceramics.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_tags/en/sectors/artisan-porcelain-ceramics.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_tags/en/sectors/artisan-porcelain-ceramics.md
sed -i '' 's/site.tags/site.dimensions/g' ./_tags/en/sectors/artisan-porcelain-ceramics.md
sed -i '' 's/page.tags/page.dimensions/g' ./_tags/en/sectors/artisan-porcelain-ceramics.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_tags/en/sectors/artisan-porcelain-ceramics.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_tags/en/sectors/salami-cured-meats.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_tags/en/sectors/salami-cured-meats.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_tags/en/sectors/salami-cured-meats.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_tags/en/sectors/salami-cured-meats.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_tags/en/sectors/salami-cured-meats.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_tags/en/sectors/salami-cured-meats.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_tags/en/sectors/salami-cured-meats.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_tags/en/sectors/salami-cured-meats.md
sed -i '' 's/site.tags/site.dimensions/g' ./_tags/en/sectors/salami-cured-meats.md
sed -i '' 's/page.tags/page.dimensions/g' ./_tags/en/sectors/salami-cured-meats.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_tags/en/sectors/salami-cured-meats.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_tags/en/sectors/artisan-confectionery.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_tags/en/sectors/artisan-confectionery.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_tags/en/sectors/artisan-confectionery.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_tags/en/sectors/artisan-confectionery.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_tags/en/sectors/artisan-confectionery.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_tags/en/sectors/artisan-confectionery.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_tags/en/sectors/artisan-confectionery.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_tags/en/sectors/artisan-confectionery.md
sed -i '' 's/site.tags/site.dimensions/g' ./_tags/en/sectors/artisan-confectionery.md
sed -i '' 's/page.tags/page.dimensions/g' ./_tags/en/sectors/artisan-confectionery.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_tags/en/sectors/artisan-confectionery.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_tags/en/sectors/hotels-resorts.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_tags/en/sectors/hotels-resorts.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_tags/en/sectors/hotels-resorts.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_tags/en/sectors/hotels-resorts.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_tags/en/sectors/hotels-resorts.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_tags/en/sectors/hotels-resorts.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_tags/en/sectors/hotels-resorts.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_tags/en/sectors/hotels-resorts.md
sed -i '' 's/site.tags/site.dimensions/g' ./_tags/en/sectors/hotels-resorts.md
sed -i '' 's/page.tags/page.dimensions/g' ./_tags/en/sectors/hotels-resorts.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_tags/en/sectors/hotels-resorts.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_tags/en/sectors/wine.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_tags/en/sectors/wine.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_tags/en/sectors/wine.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_tags/en/sectors/wine.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_tags/en/sectors/wine.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_tags/en/sectors/wine.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_tags/en/sectors/wine.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_tags/en/sectors/wine.md
sed -i '' 's/site.tags/site.dimensions/g' ./_tags/en/sectors/wine.md
sed -i '' 's/page.tags/page.dimensions/g' ./_tags/en/sectors/wine.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_tags/en/sectors/wine.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_tags/en/signals/investment-ready.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_tags/en/signals/investment-ready.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_tags/en/signals/investment-ready.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_tags/en/signals/investment-ready.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_tags/en/signals/investment-ready.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_tags/en/signals/investment-ready.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_tags/en/signals/investment-ready.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_tags/en/signals/investment-ready.md
sed -i '' 's/site.tags/site.dimensions/g' ./_tags/en/signals/investment-ready.md
sed -i '' 's/page.tags/page.dimensions/g' ./_tags/en/signals/investment-ready.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_tags/en/signals/investment-ready.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_tags/en/signals/export-ready.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_tags/en/signals/export-ready.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_tags/en/signals/export-ready.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_tags/en/signals/export-ready.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_tags/en/signals/export-ready.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_tags/en/signals/export-ready.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_tags/en/signals/export-ready.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_tags/en/signals/export-ready.md
sed -i '' 's/site.tags/site.dimensions/g' ./_tags/en/signals/export-ready.md
sed -i '' 's/page.tags/page.dimensions/g' ./_tags/en/signals/export-ready.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_tags/en/signals/export-ready.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_tags/en/signals/franchise-ready.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_tags/en/signals/franchise-ready.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_tags/en/signals/franchise-ready.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_tags/en/signals/franchise-ready.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_tags/en/signals/franchise-ready.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_tags/en/signals/franchise-ready.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_tags/en/signals/franchise-ready.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_tags/en/signals/franchise-ready.md
sed -i '' 's/site.tags/site.dimensions/g' ./_tags/en/signals/franchise-ready.md
sed -i '' 's/page.tags/page.dimensions/g' ./_tags/en/signals/franchise-ready.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_tags/en/signals/franchise-ready.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_tags/en/signals/rapid-growth.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_tags/en/signals/rapid-growth.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_tags/en/signals/rapid-growth.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_tags/en/signals/rapid-growth.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_tags/en/signals/rapid-growth.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_tags/en/signals/rapid-growth.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_tags/en/signals/rapid-growth.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_tags/en/signals/rapid-growth.md
sed -i '' 's/site.tags/site.dimensions/g' ./_tags/en/signals/rapid-growth.md
sed -i '' 's/page.tags/page.dimensions/g' ./_tags/en/signals/rapid-growth.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_tags/en/signals/rapid-growth.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_tags/en/attributes/premium-positioning.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_tags/en/attributes/premium-positioning.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_tags/en/attributes/premium-positioning.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_tags/en/attributes/premium-positioning.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_tags/en/attributes/premium-positioning.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_tags/en/attributes/premium-positioning.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_tags/en/attributes/premium-positioning.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_tags/en/attributes/premium-positioning.md
sed -i '' 's/site.tags/site.dimensions/g' ./_tags/en/attributes/premium-positioning.md
sed -i '' 's/page.tags/page.dimensions/g' ./_tags/en/attributes/premium-positioning.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_tags/en/attributes/premium-positioning.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_tags/en/attributes/innovation-leader.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_tags/en/attributes/innovation-leader.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_tags/en/attributes/innovation-leader.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_tags/en/attributes/innovation-leader.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_tags/en/attributes/innovation-leader.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_tags/en/attributes/innovation-leader.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_tags/en/attributes/innovation-leader.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_tags/en/attributes/innovation-leader.md
sed -i '' 's/site.tags/site.dimensions/g' ./_tags/en/attributes/innovation-leader.md
sed -i '' 's/page.tags/page.dimensions/g' ./_tags/en/attributes/innovation-leader.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_tags/en/attributes/innovation-leader.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_tags/en/attributes/cultural-ambassador.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_tags/en/attributes/cultural-ambassador.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_tags/en/attributes/cultural-ambassador.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_tags/en/attributes/cultural-ambassador.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_tags/en/attributes/cultural-ambassador.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_tags/en/attributes/cultural-ambassador.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_tags/en/attributes/cultural-ambassador.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_tags/en/attributes/cultural-ambassador.md
sed -i '' 's/site.tags/site.dimensions/g' ./_tags/en/attributes/cultural-ambassador.md
sed -i '' 's/page.tags/page.dimensions/g' ./_tags/en/attributes/cultural-ambassador.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_tags/en/attributes/cultural-ambassador.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_tags/en/attributes/artisanal-excellence.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_tags/en/attributes/artisanal-excellence.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_tags/en/attributes/artisanal-excellence.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_tags/en/attributes/artisanal-excellence.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_tags/en/attributes/artisanal-excellence.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_tags/en/attributes/artisanal-excellence.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_tags/en/attributes/artisanal-excellence.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_tags/en/attributes/artisanal-excellence.md
sed -i '' 's/site.tags/site.dimensions/g' ./_tags/en/attributes/artisanal-excellence.md
sed -i '' 's/page.tags/page.dimensions/g' ./_tags/en/attributes/artisanal-excellence.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_tags/en/attributes/artisanal-excellence.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_tags/en/attributes/sustainability-pioneer.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_tags/en/attributes/sustainability-pioneer.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_tags/en/attributes/sustainability-pioneer.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_tags/en/attributes/sustainability-pioneer.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_tags/en/attributes/sustainability-pioneer.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_tags/en/attributes/sustainability-pioneer.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_tags/en/attributes/sustainability-pioneer.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_tags/en/attributes/sustainability-pioneer.md
sed -i '' 's/site.tags/site.dimensions/g' ./_tags/en/attributes/sustainability-pioneer.md
sed -i '' 's/page.tags/page.dimensions/g' ./_tags/en/attributes/sustainability-pioneer.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_tags/en/attributes/sustainability-pioneer.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_tags/en/attributes/founder-led.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_tags/en/attributes/founder-led.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_tags/en/attributes/founder-led.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_tags/en/attributes/founder-led.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_tags/en/attributes/founder-led.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_tags/en/attributes/founder-led.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_tags/en/attributes/founder-led.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_tags/en/attributes/founder-led.md
sed -i '' 's/site.tags/site.dimensions/g' ./_tags/en/attributes/founder-led.md
sed -i '' 's/page.tags/page.dimensions/g' ./_tags/en/attributes/founder-led.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_tags/en/attributes/founder-led.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_tags/en/attributes/regional-icon.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_tags/en/attributes/regional-icon.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_tags/en/attributes/regional-icon.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_tags/en/attributes/regional-icon.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_tags/en/attributes/regional-icon.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_tags/en/attributes/regional-icon.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_tags/en/attributes/regional-icon.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_tags/en/attributes/regional-icon.md
sed -i '' 's/site.tags/site.dimensions/g' ./_tags/en/attributes/regional-icon.md
sed -i '' 's/page.tags/page.dimensions/g' ./_tags/en/attributes/regional-icon.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_tags/en/attributes/regional-icon.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_tags/en/attributes/heritage-brand.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_tags/en/attributes/heritage-brand.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_tags/en/attributes/heritage-brand.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_tags/en/attributes/heritage-brand.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_tags/en/attributes/heritage-brand.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_tags/en/attributes/heritage-brand.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_tags/en/attributes/heritage-brand.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_tags/en/attributes/heritage-brand.md
sed -i '' 's/site.tags/site.dimensions/g' ./_tags/en/attributes/heritage-brand.md
sed -i '' 's/page.tags/page.dimensions/g' ./_tags/en/attributes/heritage-brand.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_tags/en/attributes/heritage-brand.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_tags/en/markets/china.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_tags/en/markets/china.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_tags/en/markets/china.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_tags/en/markets/china.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_tags/en/markets/china.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_tags/en/markets/china.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_tags/en/markets/china.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_tags/en/markets/china.md
sed -i '' 's/site.tags/site.dimensions/g' ./_tags/en/markets/china.md
sed -i '' 's/page.tags/page.dimensions/g' ./_tags/en/markets/china.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_tags/en/markets/china.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_tags/en/markets/brazil.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_tags/en/markets/brazil.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_tags/en/markets/brazil.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_tags/en/markets/brazil.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_tags/en/markets/brazil.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_tags/en/markets/brazil.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_tags/en/markets/brazil.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_tags/en/markets/brazil.md
sed -i '' 's/site.tags/site.dimensions/g' ./_tags/en/markets/brazil.md
sed -i '' 's/page.tags/page.dimensions/g' ./_tags/en/markets/brazil.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_tags/en/markets/brazil.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_tags/en/markets/south-africa.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_tags/en/markets/south-africa.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_tags/en/markets/south-africa.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_tags/en/markets/south-africa.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_tags/en/markets/south-africa.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_tags/en/markets/south-africa.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_tags/en/markets/south-africa.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_tags/en/markets/south-africa.md
sed -i '' 's/site.tags/site.dimensions/g' ./_tags/en/markets/south-africa.md
sed -i '' 's/page.tags/page.dimensions/g' ./_tags/en/markets/south-africa.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_tags/en/markets/south-africa.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_tags/en/markets/india.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_tags/en/markets/india.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_tags/en/markets/india.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_tags/en/markets/india.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_tags/en/markets/india.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_tags/en/markets/india.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_tags/en/markets/india.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_tags/en/markets/india.md
sed -i '' 's/site.tags/site.dimensions/g' ./_tags/en/markets/india.md
sed -i '' 's/page.tags/page.dimensions/g' ./_tags/en/markets/india.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_tags/en/markets/india.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_tags/en/markets/russia.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_tags/en/markets/russia.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_tags/en/markets/russia.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_tags/en/markets/russia.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_tags/en/markets/russia.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_tags/en/markets/russia.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_tags/en/markets/russia.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_tags/en/markets/russia.md
sed -i '' 's/site.tags/site.dimensions/g' ./_tags/en/markets/russia.md
sed -i '' 's/page.tags/page.dimensions/g' ./_tags/en/markets/russia.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_tags/en/markets/russia.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/404.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/404.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/404.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/404.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/404.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/404.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/404.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/404.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/404.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/404.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/404.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/CLAUDE.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/CLAUDE.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/CLAUDE.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/CLAUDE.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/CLAUDE.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/CLAUDE.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/CLAUDE.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/CLAUDE.md
sed -i '' 's/site.tags/site.dimensions/g' ./_site/CLAUDE.md
sed -i '' 's/page.tags/page.dimensions/g' ./_site/CLAUDE.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/CLAUDE.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/CLAUDE/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/CLAUDE/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/CLAUDE/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/CLAUDE/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/CLAUDE/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/CLAUDE/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/CLAUDE/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/CLAUDE/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/CLAUDE/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/CLAUDE/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/CLAUDE/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/ru/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/ru/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/ru/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/ru/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/ru/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/ru/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/ru/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/ru/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/ru/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/ru/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/ru/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/ru/404.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/ru/404.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/ru/404.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/ru/404.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/ru/404.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/ru/404.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/ru/404.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/ru/404.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/ru/404.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/ru/404.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/ru/404.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/ru/insights/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/ru/insights/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/ru/insights/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/ru/insights/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/ru/insights/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/ru/insights/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/ru/insights/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/ru/insights/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/ru/insights/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/ru/insights/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/ru/insights/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/ru/insights/7-spices-brand-spotlight/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/ru/insights/7-spices-brand-spotlight/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/ru/insights/7-spices-brand-spotlight/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/ru/insights/7-spices-brand-spotlight/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/ru/insights/7-spices-brand-spotlight/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/ru/insights/7-spices-brand-spotlight/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/ru/insights/7-spices-brand-spotlight/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/ru/insights/7-spices-brand-spotlight/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/ru/insights/7-spices-brand-spotlight/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/ru/insights/7-spices-brand-spotlight/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/ru/insights/7-spices-brand-spotlight/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/ru/insights/bushe-cultural-signature/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/ru/insights/bushe-cultural-signature/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/ru/insights/bushe-cultural-signature/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/ru/insights/bushe-cultural-signature/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/ru/insights/bushe-cultural-signature/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/ru/insights/bushe-cultural-signature/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/ru/insights/bushe-cultural-signature/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/ru/insights/bushe-cultural-signature/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/ru/insights/bushe-cultural-signature/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/ru/insights/bushe-cultural-signature/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/ru/insights/bushe-cultural-signature/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/ru/insights/ginza-project-rural-expansion/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/ru/insights/ginza-project-rural-expansion/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/ru/insights/ginza-project-rural-expansion/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/ru/insights/ginza-project-rural-expansion/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/ru/insights/ginza-project-rural-expansion/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/ru/insights/ginza-project-rural-expansion/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/ru/insights/ginza-project-rural-expansion/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/ru/insights/ginza-project-rural-expansion/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/ru/insights/ginza-project-rural-expansion/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/ru/insights/ginza-project-rural-expansion/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/ru/insights/ginza-project-rural-expansion/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/ru/insights/teatime-founders-journey/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/ru/insights/teatime-founders-journey/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/ru/insights/teatime-founders-journey/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/ru/insights/teatime-founders-journey/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/ru/insights/teatime-founders-journey/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/ru/insights/teatime-founders-journey/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/ru/insights/teatime-founders-journey/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/ru/insights/teatime-founders-journey/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/ru/insights/teatime-founders-journey/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/ru/insights/teatime-founders-journey/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/ru/insights/teatime-founders-journey/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/ru/discover/sectors/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/ru/discover/sectors/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/ru/discover/sectors/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/ru/discover/sectors/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/ru/discover/sectors/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/ru/discover/sectors/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/ru/discover/sectors/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/ru/discover/sectors/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/ru/discover/sectors/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/ru/discover/sectors/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/ru/discover/sectors/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/ru/discover/sectors/natural-supplements/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/ru/discover/sectors/natural-supplements/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/ru/discover/sectors/natural-supplements/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/ru/discover/sectors/natural-supplements/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/ru/discover/sectors/natural-supplements/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/ru/discover/sectors/natural-supplements/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/ru/discover/sectors/natural-supplements/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/ru/discover/sectors/natural-supplements/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/ru/discover/sectors/natural-supplements/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/ru/discover/sectors/natural-supplements/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/ru/discover/sectors/natural-supplements/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/ru/discover/sectors/fashion-accessories/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/ru/discover/sectors/fashion-accessories/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/ru/discover/sectors/fashion-accessories/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/ru/discover/sectors/fashion-accessories/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/ru/discover/sectors/fashion-accessories/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/ru/discover/sectors/fashion-accessories/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/ru/discover/sectors/fashion-accessories/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/ru/discover/sectors/fashion-accessories/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/ru/discover/sectors/fashion-accessories/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/ru/discover/sectors/fashion-accessories/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/ru/discover/sectors/fashion-accessories/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/ru/discover/sectors/artisan-ceramics/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/ru/discover/sectors/artisan-ceramics/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/ru/discover/sectors/artisan-ceramics/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/ru/discover/sectors/artisan-ceramics/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/ru/discover/sectors/artisan-ceramics/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/ru/discover/sectors/artisan-ceramics/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/ru/discover/sectors/artisan-ceramics/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/ru/discover/sectors/artisan-ceramics/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/ru/discover/sectors/artisan-ceramics/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/ru/discover/sectors/artisan-ceramics/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/ru/discover/sectors/artisan-ceramics/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/ru/discover/sectors/natural-beauty/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/ru/discover/sectors/natural-beauty/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/ru/discover/sectors/natural-beauty/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/ru/discover/sectors/natural-beauty/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/ru/discover/sectors/natural-beauty/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/ru/discover/sectors/natural-beauty/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/ru/discover/sectors/natural-beauty/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/ru/discover/sectors/natural-beauty/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/ru/discover/sectors/natural-beauty/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/ru/discover/sectors/natural-beauty/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/ru/discover/sectors/natural-beauty/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/ru/discover/sectors/cured-meats/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/ru/discover/sectors/cured-meats/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/ru/discover/sectors/cured-meats/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/ru/discover/sectors/cured-meats/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/ru/discover/sectors/cured-meats/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/ru/discover/sectors/cured-meats/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/ru/discover/sectors/cured-meats/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/ru/discover/sectors/cured-meats/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/ru/discover/sectors/cured-meats/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/ru/discover/sectors/cured-meats/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/ru/discover/sectors/cured-meats/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/ru/discover/sectors/honey-bee-products/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/ru/discover/sectors/honey-bee-products/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/ru/discover/sectors/honey-bee-products/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/ru/discover/sectors/honey-bee-products/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/ru/discover/sectors/honey-bee-products/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/ru/discover/sectors/honey-bee-products/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/ru/discover/sectors/honey-bee-products/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/ru/discover/sectors/honey-bee-products/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/ru/discover/sectors/honey-bee-products/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/ru/discover/sectors/honey-bee-products/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/ru/discover/sectors/honey-bee-products/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/ru/discover/sectors/mineral-waters/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/ru/discover/sectors/mineral-waters/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/ru/discover/sectors/mineral-waters/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/ru/discover/sectors/mineral-waters/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/ru/discover/sectors/mineral-waters/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/ru/discover/sectors/mineral-waters/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/ru/discover/sectors/mineral-waters/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/ru/discover/sectors/mineral-waters/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/ru/discover/sectors/mineral-waters/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/ru/discover/sectors/mineral-waters/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/ru/discover/sectors/mineral-waters/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/ru/discover/sectors/artisan-confectionery/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/ru/discover/sectors/artisan-confectionery/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/ru/discover/sectors/artisan-confectionery/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/ru/discover/sectors/artisan-confectionery/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/ru/discover/sectors/artisan-confectionery/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/ru/discover/sectors/artisan-confectionery/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/ru/discover/sectors/artisan-confectionery/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/ru/discover/sectors/artisan-confectionery/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/ru/discover/sectors/artisan-confectionery/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/ru/discover/sectors/artisan-confectionery/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/ru/discover/sectors/artisan-confectionery/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/ru/discover/sectors/wine/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/ru/discover/sectors/wine/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/ru/discover/sectors/wine/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/ru/discover/sectors/wine/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/ru/discover/sectors/wine/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/ru/discover/sectors/wine/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/ru/discover/sectors/wine/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/ru/discover/sectors/wine/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/ru/discover/sectors/wine/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/ru/discover/sectors/wine/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/ru/discover/sectors/wine/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/ru/discover/sectors/artisanal-spirits/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/ru/discover/sectors/artisanal-spirits/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/ru/discover/sectors/artisanal-spirits/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/ru/discover/sectors/artisanal-spirits/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/ru/discover/sectors/artisanal-spirits/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/ru/discover/sectors/artisanal-spirits/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/ru/discover/sectors/artisanal-spirits/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/ru/discover/sectors/artisanal-spirits/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/ru/discover/sectors/artisanal-spirits/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/ru/discover/sectors/artisanal-spirits/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/ru/discover/sectors/artisanal-spirits/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/ru/discover/sectors/specialty-cheeses/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/ru/discover/sectors/specialty-cheeses/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/ru/discover/sectors/specialty-cheeses/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/ru/discover/sectors/specialty-cheeses/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/ru/discover/sectors/specialty-cheeses/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/ru/discover/sectors/specialty-cheeses/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/ru/discover/sectors/specialty-cheeses/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/ru/discover/sectors/specialty-cheeses/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/ru/discover/sectors/specialty-cheeses/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/ru/discover/sectors/specialty-cheeses/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/ru/discover/sectors/specialty-cheeses/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/ru/discover/sectors/fermented-dairy/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/ru/discover/sectors/fermented-dairy/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/ru/discover/sectors/fermented-dairy/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/ru/discover/sectors/fermented-dairy/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/ru/discover/sectors/fermented-dairy/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/ru/discover/sectors/fermented-dairy/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/ru/discover/sectors/fermented-dairy/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/ru/discover/sectors/fermented-dairy/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/ru/discover/sectors/fermented-dairy/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/ru/discover/sectors/fermented-dairy/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/ru/discover/sectors/fermented-dairy/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/ru/discover/sectors/jewelry-watches/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/ru/discover/sectors/jewelry-watches/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/ru/discover/sectors/jewelry-watches/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/ru/discover/sectors/jewelry-watches/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/ru/discover/sectors/jewelry-watches/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/ru/discover/sectors/jewelry-watches/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/ru/discover/sectors/jewelry-watches/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/ru/discover/sectors/jewelry-watches/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/ru/discover/sectors/jewelry-watches/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/ru/discover/sectors/jewelry-watches/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/ru/discover/sectors/jewelry-watches/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/ru/discover/sectors/halal-foods/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/ru/discover/sectors/halal-foods/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/ru/discover/sectors/halal-foods/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/ru/discover/sectors/halal-foods/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/ru/discover/sectors/halal-foods/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/ru/discover/sectors/halal-foods/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/ru/discover/sectors/halal-foods/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/ru/discover/sectors/halal-foods/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/ru/discover/sectors/halal-foods/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/ru/discover/sectors/halal-foods/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/ru/discover/sectors/halal-foods/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/ru/discover/sectors/gourmet-foods/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/ru/discover/sectors/gourmet-foods/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/ru/discover/sectors/gourmet-foods/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/ru/discover/sectors/gourmet-foods/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/ru/discover/sectors/gourmet-foods/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/ru/discover/sectors/gourmet-foods/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/ru/discover/sectors/gourmet-foods/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/ru/discover/sectors/gourmet-foods/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/ru/discover/sectors/gourmet-foods/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/ru/discover/sectors/gourmet-foods/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/ru/discover/sectors/gourmet-foods/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/ru/discover/sectors/hotels-resorts/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/ru/discover/sectors/hotels-resorts/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/ru/discover/sectors/hotels-resorts/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/ru/discover/sectors/hotels-resorts/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/ru/discover/sectors/hotels-resorts/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/ru/discover/sectors/hotels-resorts/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/ru/discover/sectors/hotels-resorts/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/ru/discover/sectors/hotels-resorts/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/ru/discover/sectors/hotels-resorts/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/ru/discover/sectors/hotels-resorts/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/ru/discover/sectors/hotels-resorts/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/ru/discover/russian-sectors/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/ru/discover/russian-sectors/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/ru/discover/russian-sectors/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/ru/discover/russian-sectors/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/ru/discover/russian-sectors/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/ru/discover/russian-sectors/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/ru/discover/russian-sectors/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/ru/discover/russian-sectors/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/ru/discover/russian-sectors/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/ru/discover/russian-sectors/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/ru/discover/russian-sectors/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/ru/discover/signals/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/ru/discover/signals/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/ru/discover/signals/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/ru/discover/signals/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/ru/discover/signals/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/ru/discover/signals/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/ru/discover/signals/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/ru/discover/signals/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/ru/discover/signals/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/ru/discover/signals/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/ru/discover/signals/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/ru/discover/signals/export-ready/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/ru/discover/signals/export-ready/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/ru/discover/signals/export-ready/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/ru/discover/signals/export-ready/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/ru/discover/signals/export-ready/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/ru/discover/signals/export-ready/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/ru/discover/signals/export-ready/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/ru/discover/signals/export-ready/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/ru/discover/signals/export-ready/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/ru/discover/signals/export-ready/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/ru/discover/signals/export-ready/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/ru/discover/signals/franchise-ready/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/ru/discover/signals/franchise-ready/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/ru/discover/signals/franchise-ready/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/ru/discover/signals/franchise-ready/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/ru/discover/signals/franchise-ready/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/ru/discover/signals/franchise-ready/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/ru/discover/signals/franchise-ready/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/ru/discover/signals/franchise-ready/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/ru/discover/signals/franchise-ready/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/ru/discover/signals/franchise-ready/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/ru/discover/signals/franchise-ready/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/ru/discover/signals/investment-ready/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/ru/discover/signals/investment-ready/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/ru/discover/signals/investment-ready/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/ru/discover/signals/investment-ready/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/ru/discover/signals/investment-ready/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/ru/discover/signals/investment-ready/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/ru/discover/signals/investment-ready/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/ru/discover/signals/investment-ready/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/ru/discover/signals/investment-ready/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/ru/discover/signals/investment-ready/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/ru/discover/signals/investment-ready/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/ru/discover/signals/rapid-growth/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/ru/discover/signals/rapid-growth/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/ru/discover/signals/rapid-growth/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/ru/discover/signals/rapid-growth/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/ru/discover/signals/rapid-growth/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/ru/discover/signals/rapid-growth/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/ru/discover/signals/rapid-growth/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/ru/discover/signals/rapid-growth/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/ru/discover/signals/rapid-growth/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/ru/discover/signals/rapid-growth/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/ru/discover/signals/rapid-growth/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/ru/discover/attributes/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/ru/discover/attributes/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/ru/discover/attributes/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/ru/discover/attributes/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/ru/discover/attributes/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/ru/discover/attributes/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/ru/discover/attributes/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/ru/discover/attributes/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/ru/discover/attributes/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/ru/discover/attributes/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/ru/discover/attributes/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/ru/discover/attributes/cultural-ambassador/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/ru/discover/attributes/cultural-ambassador/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/ru/discover/attributes/cultural-ambassador/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/ru/discover/attributes/cultural-ambassador/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/ru/discover/attributes/cultural-ambassador/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/ru/discover/attributes/cultural-ambassador/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/ru/discover/attributes/cultural-ambassador/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/ru/discover/attributes/cultural-ambassador/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/ru/discover/attributes/cultural-ambassador/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/ru/discover/attributes/cultural-ambassador/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/ru/discover/attributes/cultural-ambassador/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/ru/discover/attributes/premium-positioning/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/ru/discover/attributes/premium-positioning/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/ru/discover/attributes/premium-positioning/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/ru/discover/attributes/premium-positioning/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/ru/discover/attributes/premium-positioning/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/ru/discover/attributes/premium-positioning/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/ru/discover/attributes/premium-positioning/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/ru/discover/attributes/premium-positioning/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/ru/discover/attributes/premium-positioning/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/ru/discover/attributes/premium-positioning/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/ru/discover/attributes/premium-positioning/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/ru/discover/attributes/artisanal-excellence/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/ru/discover/attributes/artisanal-excellence/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/ru/discover/attributes/artisanal-excellence/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/ru/discover/attributes/artisanal-excellence/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/ru/discover/attributes/artisanal-excellence/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/ru/discover/attributes/artisanal-excellence/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/ru/discover/attributes/artisanal-excellence/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/ru/discover/attributes/artisanal-excellence/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/ru/discover/attributes/artisanal-excellence/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/ru/discover/attributes/artisanal-excellence/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/ru/discover/attributes/artisanal-excellence/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/ru/discover/attributes/founder-led/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/ru/discover/attributes/founder-led/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/ru/discover/attributes/founder-led/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/ru/discover/attributes/founder-led/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/ru/discover/attributes/founder-led/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/ru/discover/attributes/founder-led/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/ru/discover/attributes/founder-led/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/ru/discover/attributes/founder-led/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/ru/discover/attributes/founder-led/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/ru/discover/attributes/founder-led/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/ru/discover/attributes/founder-led/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/ru/discover/attributes/sustainability-pioneer/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/ru/discover/attributes/sustainability-pioneer/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/ru/discover/attributes/sustainability-pioneer/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/ru/discover/attributes/sustainability-pioneer/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/ru/discover/attributes/sustainability-pioneer/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/ru/discover/attributes/sustainability-pioneer/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/ru/discover/attributes/sustainability-pioneer/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/ru/discover/attributes/sustainability-pioneer/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/ru/discover/attributes/sustainability-pioneer/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/ru/discover/attributes/sustainability-pioneer/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/ru/discover/attributes/sustainability-pioneer/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/ru/discover/attributes/regional-icon/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/ru/discover/attributes/regional-icon/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/ru/discover/attributes/regional-icon/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/ru/discover/attributes/regional-icon/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/ru/discover/attributes/regional-icon/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/ru/discover/attributes/regional-icon/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/ru/discover/attributes/regional-icon/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/ru/discover/attributes/regional-icon/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/ru/discover/attributes/regional-icon/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/ru/discover/attributes/regional-icon/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/ru/discover/attributes/regional-icon/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/ru/discover/attributes/innovation-leader/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/ru/discover/attributes/innovation-leader/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/ru/discover/attributes/innovation-leader/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/ru/discover/attributes/innovation-leader/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/ru/discover/attributes/innovation-leader/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/ru/discover/attributes/innovation-leader/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/ru/discover/attributes/innovation-leader/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/ru/discover/attributes/innovation-leader/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/ru/discover/attributes/innovation-leader/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/ru/discover/attributes/innovation-leader/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/ru/discover/attributes/innovation-leader/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/ru/discover/attributes/heritage-brand/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/ru/discover/attributes/heritage-brand/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/ru/discover/attributes/heritage-brand/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/ru/discover/attributes/heritage-brand/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/ru/discover/attributes/heritage-brand/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/ru/discover/attributes/heritage-brand/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/ru/discover/attributes/heritage-brand/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/ru/discover/attributes/heritage-brand/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/ru/discover/attributes/heritage-brand/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/ru/discover/attributes/heritage-brand/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/ru/discover/attributes/heritage-brand/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/ru/discover/markets/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/ru/discover/markets/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/ru/discover/markets/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/ru/discover/markets/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/ru/discover/markets/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/ru/discover/markets/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/ru/discover/markets/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/ru/discover/markets/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/ru/discover/markets/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/ru/discover/markets/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/ru/discover/markets/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/ru/discover/markets/russia/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/ru/discover/markets/russia/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/ru/discover/markets/russia/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/ru/discover/markets/russia/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/ru/discover/markets/russia/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/ru/discover/markets/russia/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/ru/discover/markets/russia/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/ru/discover/markets/russia/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/ru/discover/markets/russia/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/ru/discover/markets/russia/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/ru/discover/markets/russia/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/ru/discover/markets/south-africa/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/ru/discover/markets/south-africa/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/ru/discover/markets/south-africa/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/ru/discover/markets/south-africa/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/ru/discover/markets/south-africa/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/ru/discover/markets/south-africa/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/ru/discover/markets/south-africa/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/ru/discover/markets/south-africa/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/ru/discover/markets/south-africa/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/ru/discover/markets/south-africa/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/ru/discover/markets/south-africa/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/ru/discover/markets/brazil/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/ru/discover/markets/brazil/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/ru/discover/markets/brazil/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/ru/discover/markets/brazil/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/ru/discover/markets/brazil/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/ru/discover/markets/brazil/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/ru/discover/markets/brazil/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/ru/discover/markets/brazil/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/ru/discover/markets/brazil/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/ru/discover/markets/brazil/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/ru/discover/markets/brazil/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/ru/discover/markets/china/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/ru/discover/markets/china/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/ru/discover/markets/china/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/ru/discover/markets/china/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/ru/discover/markets/china/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/ru/discover/markets/china/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/ru/discover/markets/china/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/ru/discover/markets/china/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/ru/discover/markets/china/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/ru/discover/markets/china/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/ru/discover/markets/china/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/ru/discover/markets/india/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/ru/discover/markets/india/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/ru/discover/markets/india/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/ru/discover/markets/india/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/ru/discover/markets/india/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/ru/discover/markets/india/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/ru/discover/markets/india/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/ru/discover/markets/india/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/ru/discover/markets/india/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/ru/discover/markets/india/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/ru/discover/markets/india/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/ru/privacy/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/ru/privacy/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/ru/privacy/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/ru/privacy/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/ru/privacy/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/ru/privacy/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/ru/privacy/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/ru/privacy/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/ru/privacy/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/ru/privacy/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/ru/privacy/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/ru/brands/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/ru/brands/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/ru/brands/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/ru/brands/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/ru/brands/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/ru/brands/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/ru/brands/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/ru/brands/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/ru/brands/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/ru/brands/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/ru/brands/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/ru/brands/{{ page.country_code }}/{{ page.slug }}/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/ru/brands/{{ page.country_code }}/{{ page.slug }}/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/ru/brands/{{ page.country_code }}/{{ page.slug }}/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/ru/brands/{{ page.country_code }}/{{ page.slug }}/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/ru/brands/{{ page.country_code }}/{{ page.slug }}/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/ru/brands/{{ page.country_code }}/{{ page.slug }}/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/ru/brands/{{ page.country_code }}/{{ page.slug }}/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/ru/brands/{{ page.country_code }}/{{ page.slug }}/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/ru/brands/{{ page.country_code }}/{{ page.slug }}/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/ru/brands/{{ page.country_code }}/{{ page.slug }}/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/ru/brands/{{ page.country_code }}/{{ page.slug }}/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/ru/discovery/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/ru/discovery/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/ru/discovery/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/ru/discovery/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/ru/discovery/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/ru/discovery/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/ru/discovery/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/ru/discovery/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/ru/discovery/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/ru/discovery/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/ru/discovery/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/ru/image-credits/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/ru/image-credits/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/ru/image-credits/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/ru/image-credits/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/ru/image-credits/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/ru/image-credits/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/ru/image-credits/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/ru/image-credits/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/ru/image-credits/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/ru/image-credits/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/ru/image-credits/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/ru/about/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/ru/about/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/ru/about/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/ru/about/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/ru/about/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/ru/about/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/ru/about/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/ru/about/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/ru/about/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/ru/about/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/ru/about/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/ru/search/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/ru/search/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/ru/search/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/ru/search/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/ru/search/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/ru/search/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/ru/search/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/ru/search/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/ru/search/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/ru/search/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/ru/search/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/zh/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/zh/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/zh/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/zh/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/zh/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/zh/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/zh/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/zh/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/zh/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/zh/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/zh/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/zh/404.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/zh/404.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/zh/404.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/zh/404.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/zh/404.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/zh/404.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/zh/404.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/zh/404.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/zh/404.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/zh/404.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/zh/404.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/zh/insights/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/zh/insights/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/zh/insights/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/zh/insights/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/zh/insights/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/zh/insights/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/zh/insights/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/zh/insights/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/zh/insights/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/zh/insights/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/zh/insights/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/zh/insights/7-spices-brand-spotlight/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/zh/insights/7-spices-brand-spotlight/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/zh/insights/7-spices-brand-spotlight/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/zh/insights/7-spices-brand-spotlight/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/zh/insights/7-spices-brand-spotlight/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/zh/insights/7-spices-brand-spotlight/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/zh/insights/7-spices-brand-spotlight/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/zh/insights/7-spices-brand-spotlight/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/zh/insights/7-spices-brand-spotlight/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/zh/insights/7-spices-brand-spotlight/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/zh/insights/7-spices-brand-spotlight/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/zh/insights/bushe-cultural-signature/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/zh/insights/bushe-cultural-signature/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/zh/insights/bushe-cultural-signature/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/zh/insights/bushe-cultural-signature/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/zh/insights/bushe-cultural-signature/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/zh/insights/bushe-cultural-signature/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/zh/insights/bushe-cultural-signature/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/zh/insights/bushe-cultural-signature/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/zh/insights/bushe-cultural-signature/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/zh/insights/bushe-cultural-signature/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/zh/insights/bushe-cultural-signature/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/zh/insights/ginza-project-rural-expansion/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/zh/insights/ginza-project-rural-expansion/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/zh/insights/ginza-project-rural-expansion/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/zh/insights/ginza-project-rural-expansion/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/zh/insights/ginza-project-rural-expansion/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/zh/insights/ginza-project-rural-expansion/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/zh/insights/ginza-project-rural-expansion/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/zh/insights/ginza-project-rural-expansion/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/zh/insights/ginza-project-rural-expansion/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/zh/insights/ginza-project-rural-expansion/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/zh/insights/ginza-project-rural-expansion/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/zh/insights/teatime-founders-journey/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/zh/insights/teatime-founders-journey/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/zh/insights/teatime-founders-journey/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/zh/insights/teatime-founders-journey/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/zh/insights/teatime-founders-journey/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/zh/insights/teatime-founders-journey/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/zh/insights/teatime-founders-journey/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/zh/insights/teatime-founders-journey/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/zh/insights/teatime-founders-journey/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/zh/insights/teatime-founders-journey/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/zh/insights/teatime-founders-journey/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/zh/discover/sectors/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/zh/discover/sectors/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/zh/discover/sectors/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/zh/discover/sectors/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/zh/discover/sectors/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/zh/discover/sectors/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/zh/discover/sectors/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/zh/discover/sectors/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/zh/discover/sectors/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/zh/discover/sectors/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/zh/discover/sectors/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/zh/discover/sectors/natural-supplements/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/zh/discover/sectors/natural-supplements/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/zh/discover/sectors/natural-supplements/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/zh/discover/sectors/natural-supplements/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/zh/discover/sectors/natural-supplements/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/zh/discover/sectors/natural-supplements/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/zh/discover/sectors/natural-supplements/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/zh/discover/sectors/natural-supplements/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/zh/discover/sectors/natural-supplements/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/zh/discover/sectors/natural-supplements/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/zh/discover/sectors/natural-supplements/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/zh/discover/sectors/fashion-accessories/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/zh/discover/sectors/fashion-accessories/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/zh/discover/sectors/fashion-accessories/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/zh/discover/sectors/fashion-accessories/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/zh/discover/sectors/fashion-accessories/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/zh/discover/sectors/fashion-accessories/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/zh/discover/sectors/fashion-accessories/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/zh/discover/sectors/fashion-accessories/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/zh/discover/sectors/fashion-accessories/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/zh/discover/sectors/fashion-accessories/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/zh/discover/sectors/fashion-accessories/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/zh/discover/sectors/artisan-ceramics/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/zh/discover/sectors/artisan-ceramics/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/zh/discover/sectors/artisan-ceramics/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/zh/discover/sectors/artisan-ceramics/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/zh/discover/sectors/artisan-ceramics/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/zh/discover/sectors/artisan-ceramics/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/zh/discover/sectors/artisan-ceramics/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/zh/discover/sectors/artisan-ceramics/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/zh/discover/sectors/artisan-ceramics/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/zh/discover/sectors/artisan-ceramics/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/zh/discover/sectors/artisan-ceramics/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/zh/discover/sectors/natural-beauty/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/zh/discover/sectors/natural-beauty/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/zh/discover/sectors/natural-beauty/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/zh/discover/sectors/natural-beauty/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/zh/discover/sectors/natural-beauty/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/zh/discover/sectors/natural-beauty/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/zh/discover/sectors/natural-beauty/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/zh/discover/sectors/natural-beauty/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/zh/discover/sectors/natural-beauty/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/zh/discover/sectors/natural-beauty/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/zh/discover/sectors/natural-beauty/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/zh/discover/sectors/cured-meats/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/zh/discover/sectors/cured-meats/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/zh/discover/sectors/cured-meats/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/zh/discover/sectors/cured-meats/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/zh/discover/sectors/cured-meats/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/zh/discover/sectors/cured-meats/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/zh/discover/sectors/cured-meats/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/zh/discover/sectors/cured-meats/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/zh/discover/sectors/cured-meats/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/zh/discover/sectors/cured-meats/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/zh/discover/sectors/cured-meats/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/zh/discover/sectors/honey-bee-products/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/zh/discover/sectors/honey-bee-products/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/zh/discover/sectors/honey-bee-products/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/zh/discover/sectors/honey-bee-products/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/zh/discover/sectors/honey-bee-products/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/zh/discover/sectors/honey-bee-products/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/zh/discover/sectors/honey-bee-products/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/zh/discover/sectors/honey-bee-products/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/zh/discover/sectors/honey-bee-products/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/zh/discover/sectors/honey-bee-products/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/zh/discover/sectors/honey-bee-products/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/zh/discover/sectors/mineral-waters/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/zh/discover/sectors/mineral-waters/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/zh/discover/sectors/mineral-waters/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/zh/discover/sectors/mineral-waters/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/zh/discover/sectors/mineral-waters/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/zh/discover/sectors/mineral-waters/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/zh/discover/sectors/mineral-waters/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/zh/discover/sectors/mineral-waters/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/zh/discover/sectors/mineral-waters/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/zh/discover/sectors/mineral-waters/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/zh/discover/sectors/mineral-waters/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/zh/discover/sectors/artisan-confectionery/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/zh/discover/sectors/artisan-confectionery/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/zh/discover/sectors/artisan-confectionery/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/zh/discover/sectors/artisan-confectionery/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/zh/discover/sectors/artisan-confectionery/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/zh/discover/sectors/artisan-confectionery/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/zh/discover/sectors/artisan-confectionery/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/zh/discover/sectors/artisan-confectionery/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/zh/discover/sectors/artisan-confectionery/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/zh/discover/sectors/artisan-confectionery/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/zh/discover/sectors/artisan-confectionery/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/zh/discover/sectors/wine/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/zh/discover/sectors/wine/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/zh/discover/sectors/wine/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/zh/discover/sectors/wine/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/zh/discover/sectors/wine/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/zh/discover/sectors/wine/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/zh/discover/sectors/wine/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/zh/discover/sectors/wine/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/zh/discover/sectors/wine/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/zh/discover/sectors/wine/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/zh/discover/sectors/wine/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/zh/discover/sectors/artisanal-spirits/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/zh/discover/sectors/artisanal-spirits/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/zh/discover/sectors/artisanal-spirits/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/zh/discover/sectors/artisanal-spirits/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/zh/discover/sectors/artisanal-spirits/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/zh/discover/sectors/artisanal-spirits/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/zh/discover/sectors/artisanal-spirits/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/zh/discover/sectors/artisanal-spirits/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/zh/discover/sectors/artisanal-spirits/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/zh/discover/sectors/artisanal-spirits/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/zh/discover/sectors/artisanal-spirits/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/zh/discover/sectors/specialty-cheeses/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/zh/discover/sectors/specialty-cheeses/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/zh/discover/sectors/specialty-cheeses/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/zh/discover/sectors/specialty-cheeses/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/zh/discover/sectors/specialty-cheeses/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/zh/discover/sectors/specialty-cheeses/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/zh/discover/sectors/specialty-cheeses/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/zh/discover/sectors/specialty-cheeses/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/zh/discover/sectors/specialty-cheeses/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/zh/discover/sectors/specialty-cheeses/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/zh/discover/sectors/specialty-cheeses/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/zh/discover/sectors/fermented-dairy/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/zh/discover/sectors/fermented-dairy/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/zh/discover/sectors/fermented-dairy/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/zh/discover/sectors/fermented-dairy/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/zh/discover/sectors/fermented-dairy/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/zh/discover/sectors/fermented-dairy/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/zh/discover/sectors/fermented-dairy/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/zh/discover/sectors/fermented-dairy/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/zh/discover/sectors/fermented-dairy/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/zh/discover/sectors/fermented-dairy/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/zh/discover/sectors/fermented-dairy/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/zh/discover/sectors/jewelry-watches/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/zh/discover/sectors/jewelry-watches/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/zh/discover/sectors/jewelry-watches/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/zh/discover/sectors/jewelry-watches/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/zh/discover/sectors/jewelry-watches/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/zh/discover/sectors/jewelry-watches/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/zh/discover/sectors/jewelry-watches/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/zh/discover/sectors/jewelry-watches/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/zh/discover/sectors/jewelry-watches/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/zh/discover/sectors/jewelry-watches/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/zh/discover/sectors/jewelry-watches/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/zh/discover/sectors/halal-foods/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/zh/discover/sectors/halal-foods/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/zh/discover/sectors/halal-foods/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/zh/discover/sectors/halal-foods/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/zh/discover/sectors/halal-foods/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/zh/discover/sectors/halal-foods/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/zh/discover/sectors/halal-foods/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/zh/discover/sectors/halal-foods/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/zh/discover/sectors/halal-foods/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/zh/discover/sectors/halal-foods/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/zh/discover/sectors/halal-foods/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/zh/discover/sectors/gourmet-foods/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/zh/discover/sectors/gourmet-foods/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/zh/discover/sectors/gourmet-foods/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/zh/discover/sectors/gourmet-foods/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/zh/discover/sectors/gourmet-foods/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/zh/discover/sectors/gourmet-foods/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/zh/discover/sectors/gourmet-foods/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/zh/discover/sectors/gourmet-foods/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/zh/discover/sectors/gourmet-foods/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/zh/discover/sectors/gourmet-foods/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/zh/discover/sectors/gourmet-foods/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/zh/discover/sectors/hotels-resorts/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/zh/discover/sectors/hotels-resorts/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/zh/discover/sectors/hotels-resorts/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/zh/discover/sectors/hotels-resorts/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/zh/discover/sectors/hotels-resorts/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/zh/discover/sectors/hotels-resorts/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/zh/discover/sectors/hotels-resorts/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/zh/discover/sectors/hotels-resorts/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/zh/discover/sectors/hotels-resorts/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/zh/discover/sectors/hotels-resorts/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/zh/discover/sectors/hotels-resorts/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/zh/discover/russian-sectors/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/zh/discover/russian-sectors/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/zh/discover/russian-sectors/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/zh/discover/russian-sectors/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/zh/discover/russian-sectors/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/zh/discover/russian-sectors/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/zh/discover/russian-sectors/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/zh/discover/russian-sectors/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/zh/discover/russian-sectors/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/zh/discover/russian-sectors/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/zh/discover/russian-sectors/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/zh/discover/signals/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/zh/discover/signals/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/zh/discover/signals/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/zh/discover/signals/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/zh/discover/signals/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/zh/discover/signals/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/zh/discover/signals/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/zh/discover/signals/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/zh/discover/signals/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/zh/discover/signals/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/zh/discover/signals/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/zh/discover/signals/export-ready/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/zh/discover/signals/export-ready/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/zh/discover/signals/export-ready/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/zh/discover/signals/export-ready/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/zh/discover/signals/export-ready/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/zh/discover/signals/export-ready/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/zh/discover/signals/export-ready/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/zh/discover/signals/export-ready/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/zh/discover/signals/export-ready/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/zh/discover/signals/export-ready/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/zh/discover/signals/export-ready/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/zh/discover/signals/franchise-ready/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/zh/discover/signals/franchise-ready/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/zh/discover/signals/franchise-ready/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/zh/discover/signals/franchise-ready/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/zh/discover/signals/franchise-ready/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/zh/discover/signals/franchise-ready/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/zh/discover/signals/franchise-ready/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/zh/discover/signals/franchise-ready/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/zh/discover/signals/franchise-ready/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/zh/discover/signals/franchise-ready/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/zh/discover/signals/franchise-ready/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/zh/discover/signals/investment-ready/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/zh/discover/signals/investment-ready/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/zh/discover/signals/investment-ready/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/zh/discover/signals/investment-ready/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/zh/discover/signals/investment-ready/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/zh/discover/signals/investment-ready/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/zh/discover/signals/investment-ready/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/zh/discover/signals/investment-ready/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/zh/discover/signals/investment-ready/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/zh/discover/signals/investment-ready/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/zh/discover/signals/investment-ready/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/zh/discover/signals/rapid-growth/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/zh/discover/signals/rapid-growth/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/zh/discover/signals/rapid-growth/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/zh/discover/signals/rapid-growth/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/zh/discover/signals/rapid-growth/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/zh/discover/signals/rapid-growth/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/zh/discover/signals/rapid-growth/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/zh/discover/signals/rapid-growth/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/zh/discover/signals/rapid-growth/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/zh/discover/signals/rapid-growth/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/zh/discover/signals/rapid-growth/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/zh/discover/attributes/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/zh/discover/attributes/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/zh/discover/attributes/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/zh/discover/attributes/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/zh/discover/attributes/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/zh/discover/attributes/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/zh/discover/attributes/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/zh/discover/attributes/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/zh/discover/attributes/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/zh/discover/attributes/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/zh/discover/attributes/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/zh/discover/attributes/cultural-ambassador/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/zh/discover/attributes/cultural-ambassador/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/zh/discover/attributes/cultural-ambassador/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/zh/discover/attributes/cultural-ambassador/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/zh/discover/attributes/cultural-ambassador/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/zh/discover/attributes/cultural-ambassador/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/zh/discover/attributes/cultural-ambassador/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/zh/discover/attributes/cultural-ambassador/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/zh/discover/attributes/cultural-ambassador/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/zh/discover/attributes/cultural-ambassador/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/zh/discover/attributes/cultural-ambassador/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/zh/discover/attributes/premium-positioning/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/zh/discover/attributes/premium-positioning/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/zh/discover/attributes/premium-positioning/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/zh/discover/attributes/premium-positioning/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/zh/discover/attributes/premium-positioning/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/zh/discover/attributes/premium-positioning/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/zh/discover/attributes/premium-positioning/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/zh/discover/attributes/premium-positioning/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/zh/discover/attributes/premium-positioning/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/zh/discover/attributes/premium-positioning/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/zh/discover/attributes/premium-positioning/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/zh/discover/attributes/artisanal-excellence/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/zh/discover/attributes/artisanal-excellence/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/zh/discover/attributes/artisanal-excellence/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/zh/discover/attributes/artisanal-excellence/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/zh/discover/attributes/artisanal-excellence/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/zh/discover/attributes/artisanal-excellence/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/zh/discover/attributes/artisanal-excellence/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/zh/discover/attributes/artisanal-excellence/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/zh/discover/attributes/artisanal-excellence/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/zh/discover/attributes/artisanal-excellence/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/zh/discover/attributes/artisanal-excellence/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/zh/discover/attributes/founder-led/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/zh/discover/attributes/founder-led/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/zh/discover/attributes/founder-led/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/zh/discover/attributes/founder-led/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/zh/discover/attributes/founder-led/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/zh/discover/attributes/founder-led/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/zh/discover/attributes/founder-led/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/zh/discover/attributes/founder-led/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/zh/discover/attributes/founder-led/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/zh/discover/attributes/founder-led/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/zh/discover/attributes/founder-led/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/zh/discover/attributes/sustainability-pioneer/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/zh/discover/attributes/sustainability-pioneer/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/zh/discover/attributes/sustainability-pioneer/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/zh/discover/attributes/sustainability-pioneer/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/zh/discover/attributes/sustainability-pioneer/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/zh/discover/attributes/sustainability-pioneer/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/zh/discover/attributes/sustainability-pioneer/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/zh/discover/attributes/sustainability-pioneer/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/zh/discover/attributes/sustainability-pioneer/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/zh/discover/attributes/sustainability-pioneer/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/zh/discover/attributes/sustainability-pioneer/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/zh/discover/attributes/regional-icon/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/zh/discover/attributes/regional-icon/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/zh/discover/attributes/regional-icon/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/zh/discover/attributes/regional-icon/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/zh/discover/attributes/regional-icon/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/zh/discover/attributes/regional-icon/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/zh/discover/attributes/regional-icon/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/zh/discover/attributes/regional-icon/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/zh/discover/attributes/regional-icon/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/zh/discover/attributes/regional-icon/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/zh/discover/attributes/regional-icon/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/zh/discover/attributes/innovation-leader/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/zh/discover/attributes/innovation-leader/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/zh/discover/attributes/innovation-leader/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/zh/discover/attributes/innovation-leader/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/zh/discover/attributes/innovation-leader/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/zh/discover/attributes/innovation-leader/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/zh/discover/attributes/innovation-leader/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/zh/discover/attributes/innovation-leader/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/zh/discover/attributes/innovation-leader/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/zh/discover/attributes/innovation-leader/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/zh/discover/attributes/innovation-leader/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/zh/discover/attributes/heritage-brand/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/zh/discover/attributes/heritage-brand/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/zh/discover/attributes/heritage-brand/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/zh/discover/attributes/heritage-brand/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/zh/discover/attributes/heritage-brand/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/zh/discover/attributes/heritage-brand/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/zh/discover/attributes/heritage-brand/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/zh/discover/attributes/heritage-brand/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/zh/discover/attributes/heritage-brand/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/zh/discover/attributes/heritage-brand/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/zh/discover/attributes/heritage-brand/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/zh/discover/markets/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/zh/discover/markets/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/zh/discover/markets/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/zh/discover/markets/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/zh/discover/markets/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/zh/discover/markets/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/zh/discover/markets/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/zh/discover/markets/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/zh/discover/markets/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/zh/discover/markets/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/zh/discover/markets/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/zh/discover/markets/russia/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/zh/discover/markets/russia/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/zh/discover/markets/russia/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/zh/discover/markets/russia/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/zh/discover/markets/russia/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/zh/discover/markets/russia/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/zh/discover/markets/russia/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/zh/discover/markets/russia/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/zh/discover/markets/russia/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/zh/discover/markets/russia/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/zh/discover/markets/russia/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/zh/discover/markets/south-africa/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/zh/discover/markets/south-africa/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/zh/discover/markets/south-africa/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/zh/discover/markets/south-africa/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/zh/discover/markets/south-africa/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/zh/discover/markets/south-africa/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/zh/discover/markets/south-africa/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/zh/discover/markets/south-africa/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/zh/discover/markets/south-africa/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/zh/discover/markets/south-africa/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/zh/discover/markets/south-africa/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/zh/discover/markets/brazil/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/zh/discover/markets/brazil/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/zh/discover/markets/brazil/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/zh/discover/markets/brazil/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/zh/discover/markets/brazil/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/zh/discover/markets/brazil/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/zh/discover/markets/brazil/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/zh/discover/markets/brazil/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/zh/discover/markets/brazil/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/zh/discover/markets/brazil/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/zh/discover/markets/brazil/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/zh/discover/markets/china/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/zh/discover/markets/china/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/zh/discover/markets/china/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/zh/discover/markets/china/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/zh/discover/markets/china/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/zh/discover/markets/china/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/zh/discover/markets/china/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/zh/discover/markets/china/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/zh/discover/markets/china/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/zh/discover/markets/china/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/zh/discover/markets/china/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/zh/discover/markets/india/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/zh/discover/markets/india/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/zh/discover/markets/india/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/zh/discover/markets/india/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/zh/discover/markets/india/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/zh/discover/markets/india/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/zh/discover/markets/india/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/zh/discover/markets/india/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/zh/discover/markets/india/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/zh/discover/markets/india/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/zh/discover/markets/india/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/zh/privacy/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/zh/privacy/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/zh/privacy/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/zh/privacy/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/zh/privacy/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/zh/privacy/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/zh/privacy/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/zh/privacy/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/zh/privacy/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/zh/privacy/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/zh/privacy/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/zh/brands/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/zh/brands/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/zh/brands/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/zh/brands/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/zh/brands/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/zh/brands/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/zh/brands/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/zh/brands/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/zh/brands/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/zh/brands/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/zh/brands/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/zh/brands/ru/teatime/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/zh/brands/ru/teatime/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/zh/brands/ru/teatime/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/zh/brands/ru/teatime/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/zh/brands/ru/teatime/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/zh/brands/ru/teatime/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/zh/brands/ru/teatime/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/zh/brands/ru/teatime/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/zh/brands/ru/teatime/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/zh/brands/ru/teatime/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/zh/brands/ru/teatime/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/zh/discovery/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/zh/discovery/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/zh/discovery/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/zh/discovery/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/zh/discovery/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/zh/discovery/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/zh/discovery/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/zh/discovery/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/zh/discovery/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/zh/discovery/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/zh/discovery/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/zh/image-credits/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/zh/image-credits/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/zh/image-credits/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/zh/image-credits/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/zh/image-credits/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/zh/image-credits/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/zh/image-credits/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/zh/image-credits/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/zh/image-credits/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/zh/image-credits/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/zh/image-credits/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/zh/about/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/zh/about/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/zh/about/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/zh/about/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/zh/about/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/zh/about/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/zh/about/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/zh/about/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/zh/about/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/zh/about/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/zh/about/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/zh/search/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/zh/search/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/zh/search/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/zh/search/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/zh/search/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/zh/search/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/zh/search/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/zh/search/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/zh/search/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/zh/search/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/zh/search/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/en/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/en/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/en/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/en/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/en/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/en/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/en/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/en/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/en/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/en/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/en/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/en/404.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/en/404.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/en/404.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/en/404.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/en/404.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/en/404.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/en/404.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/en/404.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/en/404.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/en/404.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/en/404.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/en/insights/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/en/insights/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/en/insights/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/en/insights/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/en/insights/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/en/insights/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/en/insights/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/en/insights/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/en/insights/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/en/insights/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/en/insights/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/en/insights/7-spices-brand-spotlight/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/en/insights/7-spices-brand-spotlight/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/en/insights/7-spices-brand-spotlight/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/en/insights/7-spices-brand-spotlight/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/en/insights/7-spices-brand-spotlight/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/en/insights/7-spices-brand-spotlight/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/en/insights/7-spices-brand-spotlight/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/en/insights/7-spices-brand-spotlight/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/en/insights/7-spices-brand-spotlight/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/en/insights/7-spices-brand-spotlight/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/en/insights/7-spices-brand-spotlight/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/en/insights/bushe-cultural-signature/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/en/insights/bushe-cultural-signature/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/en/insights/bushe-cultural-signature/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/en/insights/bushe-cultural-signature/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/en/insights/bushe-cultural-signature/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/en/insights/bushe-cultural-signature/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/en/insights/bushe-cultural-signature/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/en/insights/bushe-cultural-signature/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/en/insights/bushe-cultural-signature/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/en/insights/bushe-cultural-signature/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/en/insights/bushe-cultural-signature/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/en/insights/ginza-project-rural-expansion/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/en/insights/ginza-project-rural-expansion/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/en/insights/ginza-project-rural-expansion/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/en/insights/ginza-project-rural-expansion/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/en/insights/ginza-project-rural-expansion/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/en/insights/ginza-project-rural-expansion/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/en/insights/ginza-project-rural-expansion/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/en/insights/ginza-project-rural-expansion/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/en/insights/ginza-project-rural-expansion/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/en/insights/ginza-project-rural-expansion/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/en/insights/ginza-project-rural-expansion/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/en/insights/teatime-founders-journey/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/en/insights/teatime-founders-journey/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/en/insights/teatime-founders-journey/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/en/insights/teatime-founders-journey/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/en/insights/teatime-founders-journey/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/en/insights/teatime-founders-journey/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/en/insights/teatime-founders-journey/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/en/insights/teatime-founders-journey/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/en/insights/teatime-founders-journey/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/en/insights/teatime-founders-journey/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/en/insights/teatime-founders-journey/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/en/discover/sectors/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/en/discover/sectors/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/en/discover/sectors/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/en/discover/sectors/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/en/discover/sectors/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/en/discover/sectors/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/en/discover/sectors/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/en/discover/sectors/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/en/discover/sectors/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/en/discover/sectors/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/en/discover/sectors/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/en/discover/sectors/natural-supplements/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/en/discover/sectors/natural-supplements/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/en/discover/sectors/natural-supplements/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/en/discover/sectors/natural-supplements/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/en/discover/sectors/natural-supplements/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/en/discover/sectors/natural-supplements/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/en/discover/sectors/natural-supplements/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/en/discover/sectors/natural-supplements/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/en/discover/sectors/natural-supplements/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/en/discover/sectors/natural-supplements/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/en/discover/sectors/natural-supplements/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/en/discover/sectors/fashion-accessories/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/en/discover/sectors/fashion-accessories/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/en/discover/sectors/fashion-accessories/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/en/discover/sectors/fashion-accessories/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/en/discover/sectors/fashion-accessories/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/en/discover/sectors/fashion-accessories/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/en/discover/sectors/fashion-accessories/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/en/discover/sectors/fashion-accessories/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/en/discover/sectors/fashion-accessories/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/en/discover/sectors/fashion-accessories/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/en/discover/sectors/fashion-accessories/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/en/discover/sectors/artisan-ceramics/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/en/discover/sectors/artisan-ceramics/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/en/discover/sectors/artisan-ceramics/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/en/discover/sectors/artisan-ceramics/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/en/discover/sectors/artisan-ceramics/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/en/discover/sectors/artisan-ceramics/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/en/discover/sectors/artisan-ceramics/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/en/discover/sectors/artisan-ceramics/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/en/discover/sectors/artisan-ceramics/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/en/discover/sectors/artisan-ceramics/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/en/discover/sectors/artisan-ceramics/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/en/discover/sectors/natural-beauty/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/en/discover/sectors/natural-beauty/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/en/discover/sectors/natural-beauty/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/en/discover/sectors/natural-beauty/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/en/discover/sectors/natural-beauty/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/en/discover/sectors/natural-beauty/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/en/discover/sectors/natural-beauty/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/en/discover/sectors/natural-beauty/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/en/discover/sectors/natural-beauty/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/en/discover/sectors/natural-beauty/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/en/discover/sectors/natural-beauty/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/en/discover/sectors/cured-meats/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/en/discover/sectors/cured-meats/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/en/discover/sectors/cured-meats/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/en/discover/sectors/cured-meats/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/en/discover/sectors/cured-meats/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/en/discover/sectors/cured-meats/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/en/discover/sectors/cured-meats/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/en/discover/sectors/cured-meats/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/en/discover/sectors/cured-meats/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/en/discover/sectors/cured-meats/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/en/discover/sectors/cured-meats/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/en/discover/sectors/honey-bee-products/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/en/discover/sectors/honey-bee-products/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/en/discover/sectors/honey-bee-products/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/en/discover/sectors/honey-bee-products/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/en/discover/sectors/honey-bee-products/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/en/discover/sectors/honey-bee-products/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/en/discover/sectors/honey-bee-products/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/en/discover/sectors/honey-bee-products/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/en/discover/sectors/honey-bee-products/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/en/discover/sectors/honey-bee-products/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/en/discover/sectors/honey-bee-products/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/en/discover/sectors/mineral-waters/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/en/discover/sectors/mineral-waters/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/en/discover/sectors/mineral-waters/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/en/discover/sectors/mineral-waters/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/en/discover/sectors/mineral-waters/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/en/discover/sectors/mineral-waters/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/en/discover/sectors/mineral-waters/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/en/discover/sectors/mineral-waters/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/en/discover/sectors/mineral-waters/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/en/discover/sectors/mineral-waters/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/en/discover/sectors/mineral-waters/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/en/discover/sectors/artisan-confectionery/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/en/discover/sectors/artisan-confectionery/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/en/discover/sectors/artisan-confectionery/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/en/discover/sectors/artisan-confectionery/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/en/discover/sectors/artisan-confectionery/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/en/discover/sectors/artisan-confectionery/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/en/discover/sectors/artisan-confectionery/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/en/discover/sectors/artisan-confectionery/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/en/discover/sectors/artisan-confectionery/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/en/discover/sectors/artisan-confectionery/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/en/discover/sectors/artisan-confectionery/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/en/discover/sectors/wine/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/en/discover/sectors/wine/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/en/discover/sectors/wine/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/en/discover/sectors/wine/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/en/discover/sectors/wine/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/en/discover/sectors/wine/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/en/discover/sectors/wine/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/en/discover/sectors/wine/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/en/discover/sectors/wine/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/en/discover/sectors/wine/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/en/discover/sectors/wine/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/en/discover/sectors/artisanal-spirits/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/en/discover/sectors/artisanal-spirits/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/en/discover/sectors/artisanal-spirits/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/en/discover/sectors/artisanal-spirits/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/en/discover/sectors/artisanal-spirits/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/en/discover/sectors/artisanal-spirits/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/en/discover/sectors/artisanal-spirits/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/en/discover/sectors/artisanal-spirits/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/en/discover/sectors/artisanal-spirits/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/en/discover/sectors/artisanal-spirits/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/en/discover/sectors/artisanal-spirits/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/en/discover/sectors/specialty-cheeses/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/en/discover/sectors/specialty-cheeses/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/en/discover/sectors/specialty-cheeses/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/en/discover/sectors/specialty-cheeses/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/en/discover/sectors/specialty-cheeses/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/en/discover/sectors/specialty-cheeses/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/en/discover/sectors/specialty-cheeses/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/en/discover/sectors/specialty-cheeses/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/en/discover/sectors/specialty-cheeses/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/en/discover/sectors/specialty-cheeses/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/en/discover/sectors/specialty-cheeses/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/en/discover/sectors/fermented-dairy/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/en/discover/sectors/fermented-dairy/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/en/discover/sectors/fermented-dairy/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/en/discover/sectors/fermented-dairy/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/en/discover/sectors/fermented-dairy/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/en/discover/sectors/fermented-dairy/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/en/discover/sectors/fermented-dairy/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/en/discover/sectors/fermented-dairy/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/en/discover/sectors/fermented-dairy/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/en/discover/sectors/fermented-dairy/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/en/discover/sectors/fermented-dairy/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/en/discover/sectors/jewelry-watches/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/en/discover/sectors/jewelry-watches/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/en/discover/sectors/jewelry-watches/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/en/discover/sectors/jewelry-watches/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/en/discover/sectors/jewelry-watches/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/en/discover/sectors/jewelry-watches/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/en/discover/sectors/jewelry-watches/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/en/discover/sectors/jewelry-watches/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/en/discover/sectors/jewelry-watches/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/en/discover/sectors/jewelry-watches/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/en/discover/sectors/jewelry-watches/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/en/discover/sectors/gourmet-foods/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/en/discover/sectors/gourmet-foods/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/en/discover/sectors/gourmet-foods/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/en/discover/sectors/gourmet-foods/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/en/discover/sectors/gourmet-foods/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/en/discover/sectors/gourmet-foods/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/en/discover/sectors/gourmet-foods/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/en/discover/sectors/gourmet-foods/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/en/discover/sectors/gourmet-foods/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/en/discover/sectors/gourmet-foods/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/en/discover/sectors/gourmet-foods/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/en/discover/sectors/halal-food-products/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/en/discover/sectors/halal-food-products/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/en/discover/sectors/halal-food-products/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/en/discover/sectors/halal-food-products/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/en/discover/sectors/halal-food-products/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/en/discover/sectors/halal-food-products/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/en/discover/sectors/halal-food-products/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/en/discover/sectors/halal-food-products/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/en/discover/sectors/halal-food-products/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/en/discover/sectors/halal-food-products/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/en/discover/sectors/halal-food-products/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/en/discover/sectors/hotels-resorts/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/en/discover/sectors/hotels-resorts/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/en/discover/sectors/hotels-resorts/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/en/discover/sectors/hotels-resorts/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/en/discover/sectors/hotels-resorts/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/en/discover/sectors/hotels-resorts/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/en/discover/sectors/hotels-resorts/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/en/discover/sectors/hotels-resorts/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/en/discover/sectors/hotels-resorts/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/en/discover/sectors/hotels-resorts/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/en/discover/sectors/hotels-resorts/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/en/discover/russian-sectors/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/en/discover/russian-sectors/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/en/discover/russian-sectors/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/en/discover/russian-sectors/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/en/discover/russian-sectors/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/en/discover/russian-sectors/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/en/discover/russian-sectors/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/en/discover/russian-sectors/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/en/discover/russian-sectors/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/en/discover/russian-sectors/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/en/discover/russian-sectors/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/en/discover/signals/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/en/discover/signals/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/en/discover/signals/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/en/discover/signals/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/en/discover/signals/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/en/discover/signals/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/en/discover/signals/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/en/discover/signals/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/en/discover/signals/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/en/discover/signals/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/en/discover/signals/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/en/discover/signals/export-ready/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/en/discover/signals/export-ready/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/en/discover/signals/export-ready/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/en/discover/signals/export-ready/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/en/discover/signals/export-ready/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/en/discover/signals/export-ready/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/en/discover/signals/export-ready/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/en/discover/signals/export-ready/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/en/discover/signals/export-ready/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/en/discover/signals/export-ready/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/en/discover/signals/export-ready/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/en/discover/signals/franchise-ready/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/en/discover/signals/franchise-ready/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/en/discover/signals/franchise-ready/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/en/discover/signals/franchise-ready/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/en/discover/signals/franchise-ready/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/en/discover/signals/franchise-ready/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/en/discover/signals/franchise-ready/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/en/discover/signals/franchise-ready/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/en/discover/signals/franchise-ready/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/en/discover/signals/franchise-ready/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/en/discover/signals/franchise-ready/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/en/discover/signals/investment-ready/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/en/discover/signals/investment-ready/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/en/discover/signals/investment-ready/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/en/discover/signals/investment-ready/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/en/discover/signals/investment-ready/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/en/discover/signals/investment-ready/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/en/discover/signals/investment-ready/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/en/discover/signals/investment-ready/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/en/discover/signals/investment-ready/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/en/discover/signals/investment-ready/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/en/discover/signals/investment-ready/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/en/discover/signals/rapid-growth/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/en/discover/signals/rapid-growth/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/en/discover/signals/rapid-growth/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/en/discover/signals/rapid-growth/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/en/discover/signals/rapid-growth/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/en/discover/signals/rapid-growth/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/en/discover/signals/rapid-growth/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/en/discover/signals/rapid-growth/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/en/discover/signals/rapid-growth/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/en/discover/signals/rapid-growth/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/en/discover/signals/rapid-growth/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/en/discover/attributes/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/en/discover/attributes/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/en/discover/attributes/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/en/discover/attributes/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/en/discover/attributes/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/en/discover/attributes/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/en/discover/attributes/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/en/discover/attributes/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/en/discover/attributes/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/en/discover/attributes/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/en/discover/attributes/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/en/discover/attributes/cultural-ambassador/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/en/discover/attributes/cultural-ambassador/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/en/discover/attributes/cultural-ambassador/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/en/discover/attributes/cultural-ambassador/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/en/discover/attributes/cultural-ambassador/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/en/discover/attributes/cultural-ambassador/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/en/discover/attributes/cultural-ambassador/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/en/discover/attributes/cultural-ambassador/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/en/discover/attributes/cultural-ambassador/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/en/discover/attributes/cultural-ambassador/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/en/discover/attributes/cultural-ambassador/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/en/discover/attributes/premium-positioning/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/en/discover/attributes/premium-positioning/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/en/discover/attributes/premium-positioning/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/en/discover/attributes/premium-positioning/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/en/discover/attributes/premium-positioning/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/en/discover/attributes/premium-positioning/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/en/discover/attributes/premium-positioning/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/en/discover/attributes/premium-positioning/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/en/discover/attributes/premium-positioning/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/en/discover/attributes/premium-positioning/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/en/discover/attributes/premium-positioning/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/en/discover/attributes/artisanal-excellence/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/en/discover/attributes/artisanal-excellence/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/en/discover/attributes/artisanal-excellence/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/en/discover/attributes/artisanal-excellence/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/en/discover/attributes/artisanal-excellence/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/en/discover/attributes/artisanal-excellence/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/en/discover/attributes/artisanal-excellence/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/en/discover/attributes/artisanal-excellence/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/en/discover/attributes/artisanal-excellence/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/en/discover/attributes/artisanal-excellence/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/en/discover/attributes/artisanal-excellence/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/en/discover/attributes/founder-led/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/en/discover/attributes/founder-led/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/en/discover/attributes/founder-led/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/en/discover/attributes/founder-led/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/en/discover/attributes/founder-led/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/en/discover/attributes/founder-led/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/en/discover/attributes/founder-led/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/en/discover/attributes/founder-led/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/en/discover/attributes/founder-led/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/en/discover/attributes/founder-led/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/en/discover/attributes/founder-led/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/en/discover/attributes/sustainability-pioneer/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/en/discover/attributes/sustainability-pioneer/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/en/discover/attributes/sustainability-pioneer/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/en/discover/attributes/sustainability-pioneer/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/en/discover/attributes/sustainability-pioneer/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/en/discover/attributes/sustainability-pioneer/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/en/discover/attributes/sustainability-pioneer/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/en/discover/attributes/sustainability-pioneer/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/en/discover/attributes/sustainability-pioneer/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/en/discover/attributes/sustainability-pioneer/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/en/discover/attributes/sustainability-pioneer/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/en/discover/attributes/regional-icon/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/en/discover/attributes/regional-icon/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/en/discover/attributes/regional-icon/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/en/discover/attributes/regional-icon/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/en/discover/attributes/regional-icon/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/en/discover/attributes/regional-icon/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/en/discover/attributes/regional-icon/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/en/discover/attributes/regional-icon/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/en/discover/attributes/regional-icon/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/en/discover/attributes/regional-icon/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/en/discover/attributes/regional-icon/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/en/discover/attributes/innovation-leader/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/en/discover/attributes/innovation-leader/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/en/discover/attributes/innovation-leader/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/en/discover/attributes/innovation-leader/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/en/discover/attributes/innovation-leader/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/en/discover/attributes/innovation-leader/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/en/discover/attributes/innovation-leader/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/en/discover/attributes/innovation-leader/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/en/discover/attributes/innovation-leader/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/en/discover/attributes/innovation-leader/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/en/discover/attributes/innovation-leader/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/en/discover/attributes/heritage-brand/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/en/discover/attributes/heritage-brand/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/en/discover/attributes/heritage-brand/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/en/discover/attributes/heritage-brand/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/en/discover/attributes/heritage-brand/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/en/discover/attributes/heritage-brand/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/en/discover/attributes/heritage-brand/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/en/discover/attributes/heritage-brand/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/en/discover/attributes/heritage-brand/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/en/discover/attributes/heritage-brand/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/en/discover/attributes/heritage-brand/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/en/discover/markets/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/en/discover/markets/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/en/discover/markets/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/en/discover/markets/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/en/discover/markets/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/en/discover/markets/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/en/discover/markets/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/en/discover/markets/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/en/discover/markets/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/en/discover/markets/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/en/discover/markets/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/en/discover/markets/russia/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/en/discover/markets/russia/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/en/discover/markets/russia/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/en/discover/markets/russia/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/en/discover/markets/russia/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/en/discover/markets/russia/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/en/discover/markets/russia/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/en/discover/markets/russia/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/en/discover/markets/russia/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/en/discover/markets/russia/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/en/discover/markets/russia/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/en/discover/markets/south-africa/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/en/discover/markets/south-africa/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/en/discover/markets/south-africa/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/en/discover/markets/south-africa/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/en/discover/markets/south-africa/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/en/discover/markets/south-africa/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/en/discover/markets/south-africa/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/en/discover/markets/south-africa/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/en/discover/markets/south-africa/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/en/discover/markets/south-africa/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/en/discover/markets/south-africa/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/en/discover/markets/brazil/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/en/discover/markets/brazil/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/en/discover/markets/brazil/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/en/discover/markets/brazil/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/en/discover/markets/brazil/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/en/discover/markets/brazil/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/en/discover/markets/brazil/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/en/discover/markets/brazil/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/en/discover/markets/brazil/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/en/discover/markets/brazil/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/en/discover/markets/brazil/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/en/discover/markets/china/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/en/discover/markets/china/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/en/discover/markets/china/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/en/discover/markets/china/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/en/discover/markets/china/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/en/discover/markets/china/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/en/discover/markets/china/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/en/discover/markets/china/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/en/discover/markets/china/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/en/discover/markets/china/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/en/discover/markets/china/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/en/discover/markets/india/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/en/discover/markets/india/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/en/discover/markets/india/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/en/discover/markets/india/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/en/discover/markets/india/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/en/discover/markets/india/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/en/discover/markets/india/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/en/discover/markets/india/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/en/discover/markets/india/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/en/discover/markets/india/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/en/discover/markets/india/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/en/privacy/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/en/privacy/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/en/privacy/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/en/privacy/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/en/privacy/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/en/privacy/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/en/privacy/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/en/privacy/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/en/privacy/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/en/privacy/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/en/privacy/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/en/brands/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/en/brands/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/en/brands/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/en/brands/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/en/brands/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/en/brands/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/en/brands/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/en/brands/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/en/brands/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/en/brands/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/en/brands/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/en/brands/{{ page.country_code }}/{{ page.slug }}/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/en/brands/{{ page.country_code }}/{{ page.slug }}/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/en/brands/{{ page.country_code }}/{{ page.slug }}/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/en/brands/{{ page.country_code }}/{{ page.slug }}/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/en/brands/{{ page.country_code }}/{{ page.slug }}/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/en/brands/{{ page.country_code }}/{{ page.slug }}/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/en/brands/{{ page.country_code }}/{{ page.slug }}/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/en/brands/{{ page.country_code }}/{{ page.slug }}/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/en/brands/{{ page.country_code }}/{{ page.slug }}/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/en/brands/{{ page.country_code }}/{{ page.slug }}/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/en/brands/{{ page.country_code }}/{{ page.slug }}/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/en/discovery/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/en/discovery/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/en/discovery/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/en/discovery/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/en/discovery/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/en/discovery/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/en/discovery/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/en/discovery/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/en/discovery/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/en/discovery/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/en/discovery/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/en/image-credits/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/en/image-credits/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/en/image-credits/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/en/image-credits/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/en/image-credits/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/en/image-credits/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/en/image-credits/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/en/image-credits/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/en/image-credits/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/en/image-credits/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/en/image-credits/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/en/about/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/en/about/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/en/about/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/en/about/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/en/about/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/en/about/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/en/about/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/en/about/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/en/about/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/en/about/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/en/about/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/en/search/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/en/search/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/en/search/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/en/search/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/en/search/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/en/search/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/en/search/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/en/search/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/en/search/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/en/search/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/en/search/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/en/styleguide/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/en/styleguide/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/en/styleguide/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/en/styleguide/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/en/styleguide/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/en/styleguide/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/en/styleguide/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/en/styleguide/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/en/styleguide/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/en/styleguide/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/en/styleguide/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/en/styleguide/patterns/image-handling/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/en/styleguide/patterns/image-handling/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/en/styleguide/patterns/image-handling/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/en/styleguide/patterns/image-handling/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/en/styleguide/patterns/image-handling/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/en/styleguide/patterns/image-handling/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/en/styleguide/patterns/image-handling/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/en/styleguide/patterns/image-handling/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/en/styleguide/patterns/image-handling/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/en/styleguide/patterns/image-handling/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/en/styleguide/patterns/image-handling/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/en/styleguide/patterns/navigation/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/en/styleguide/patterns/navigation/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/en/styleguide/patterns/navigation/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/en/styleguide/patterns/navigation/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/en/styleguide/patterns/navigation/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/en/styleguide/patterns/navigation/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/en/styleguide/patterns/navigation/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/en/styleguide/patterns/navigation/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/en/styleguide/patterns/navigation/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/en/styleguide/patterns/navigation/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/en/styleguide/patterns/navigation/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/en/styleguide/patterns/tags/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/en/styleguide/patterns/tags/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/en/styleguide/patterns/tags/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/en/styleguide/patterns/tags/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/en/styleguide/patterns/tags/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/en/styleguide/patterns/tags/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/en/styleguide/patterns/tags/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/en/styleguide/patterns/tags/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/en/styleguide/patterns/tags/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/en/styleguide/patterns/tags/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/en/styleguide/patterns/tags/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/en/styleguide/patterns/multilingual/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/en/styleguide/patterns/multilingual/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/en/styleguide/patterns/multilingual/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/en/styleguide/patterns/multilingual/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/en/styleguide/patterns/multilingual/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/en/styleguide/patterns/multilingual/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/en/styleguide/patterns/multilingual/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/en/styleguide/patterns/multilingual/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/en/styleguide/patterns/multilingual/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/en/styleguide/patterns/multilingual/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/en/styleguide/patterns/multilingual/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/en/styleguide/patterns/content-display/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/en/styleguide/patterns/content-display/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/en/styleguide/patterns/content-display/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/en/styleguide/patterns/content-display/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/en/styleguide/patterns/content-display/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/en/styleguide/patterns/content-display/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/en/styleguide/patterns/content-display/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/en/styleguide/patterns/content-display/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/en/styleguide/patterns/content-display/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/en/styleguide/patterns/content-display/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/en/styleguide/patterns/content-display/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/en/styleguide/foundations/layouts/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/en/styleguide/foundations/layouts/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/en/styleguide/foundations/layouts/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/en/styleguide/foundations/layouts/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/en/styleguide/foundations/layouts/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/en/styleguide/foundations/layouts/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/en/styleguide/foundations/layouts/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/en/styleguide/foundations/layouts/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/en/styleguide/foundations/layouts/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/en/styleguide/foundations/layouts/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/en/styleguide/foundations/layouts/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/en/styleguide/foundations/colors/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/en/styleguide/foundations/colors/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/en/styleguide/foundations/colors/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/en/styleguide/foundations/colors/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/en/styleguide/foundations/colors/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/en/styleguide/foundations/colors/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/en/styleguide/foundations/colors/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/en/styleguide/foundations/colors/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/en/styleguide/foundations/colors/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/en/styleguide/foundations/colors/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/en/styleguide/foundations/colors/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/en/styleguide/foundations/spacing/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/en/styleguide/foundations/spacing/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/en/styleguide/foundations/spacing/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/en/styleguide/foundations/spacing/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/en/styleguide/foundations/spacing/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/en/styleguide/foundations/spacing/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/en/styleguide/foundations/spacing/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/en/styleguide/foundations/spacing/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/en/styleguide/foundations/spacing/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/en/styleguide/foundations/spacing/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/en/styleguide/foundations/spacing/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/en/styleguide/foundations/typography/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/en/styleguide/foundations/typography/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/en/styleguide/foundations/typography/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/en/styleguide/foundations/typography/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/en/styleguide/foundations/typography/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/en/styleguide/foundations/typography/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/en/styleguide/foundations/typography/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/en/styleguide/foundations/typography/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/en/styleguide/foundations/typography/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/en/styleguide/foundations/typography/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/en/styleguide/foundations/typography/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/en/styleguide/foundations/brand-identity/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/en/styleguide/foundations/brand-identity/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/en/styleguide/foundations/brand-identity/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/en/styleguide/foundations/brand-identity/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/en/styleguide/foundations/brand-identity/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/en/styleguide/foundations/brand-identity/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/en/styleguide/foundations/brand-identity/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/en/styleguide/foundations/brand-identity/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/en/styleguide/foundations/brand-identity/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/en/styleguide/foundations/brand-identity/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/en/styleguide/foundations/brand-identity/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/en/styleguide/components/forms/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/en/styleguide/components/forms/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/en/styleguide/components/forms/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/en/styleguide/components/forms/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/en/styleguide/components/forms/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/en/styleguide/components/forms/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/en/styleguide/components/forms/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/en/styleguide/components/forms/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/en/styleguide/components/forms/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/en/styleguide/components/forms/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/en/styleguide/components/forms/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/en/styleguide/components/buttons/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/en/styleguide/components/buttons/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/en/styleguide/components/buttons/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/en/styleguide/components/buttons/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/en/styleguide/components/buttons/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/en/styleguide/components/buttons/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/en/styleguide/components/buttons/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/en/styleguide/components/buttons/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/en/styleguide/components/buttons/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/en/styleguide/components/buttons/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/en/styleguide/components/buttons/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/en/styleguide/components/cards/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/en/styleguide/components/cards/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/en/styleguide/components/cards/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/en/styleguide/components/cards/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/en/styleguide/components/cards/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/en/styleguide/components/cards/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/en/styleguide/components/cards/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/en/styleguide/components/cards/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/en/styleguide/components/cards/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/en/styleguide/components/cards/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/en/styleguide/components/cards/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/en/styleguide/components/icons-test/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/en/styleguide/components/icons-test/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/en/styleguide/components/icons-test/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/en/styleguide/components/icons-test/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/en/styleguide/components/icons-test/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/en/styleguide/components/icons-test/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/en/styleguide/components/icons-test/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/en/styleguide/components/icons-test/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/en/styleguide/components/icons-test/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/en/styleguide/components/icons-test/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/en/styleguide/components/icons-test/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/en/styleguide/components/hero-panels/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/en/styleguide/components/hero-panels/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/en/styleguide/components/hero-panels/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/en/styleguide/components/hero-panels/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/en/styleguide/components/hero-panels/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/en/styleguide/components/hero-panels/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/en/styleguide/components/hero-panels/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/en/styleguide/components/hero-panels/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/en/styleguide/components/hero-panels/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/en/styleguide/components/hero-panels/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/en/styleguide/components/hero-panels/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/en/styleguide/components/text/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/en/styleguide/components/text/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/en/styleguide/components/text/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/en/styleguide/components/text/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/en/styleguide/components/text/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/en/styleguide/components/text/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/en/styleguide/components/text/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/en/styleguide/components/text/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/en/styleguide/components/text/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/en/styleguide/components/text/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/en/styleguide/components/text/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_site/en/test-dimensions/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_site/en/test-dimensions/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_site/en/test-dimensions/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_site/en/test-dimensions/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_site/en/test-dimensions/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_site/en/test-dimensions/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_site/en/test-dimensions/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_site/en/test-dimensions/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./_site/en/test-dimensions/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./_site/en/test-dimensions/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_site/en/test-dimensions/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_discovery/ru/sectors/natural-supplements.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_discovery/ru/sectors/natural-supplements.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_discovery/ru/sectors/natural-supplements.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_discovery/ru/sectors/natural-supplements.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_discovery/ru/sectors/natural-supplements.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_discovery/ru/sectors/natural-supplements.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_discovery/ru/sectors/natural-supplements.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_discovery/ru/sectors/natural-supplements.md
sed -i '' 's/site.tags/site.dimensions/g' ./_discovery/ru/sectors/natural-supplements.md
sed -i '' 's/page.tags/page.dimensions/g' ./_discovery/ru/sectors/natural-supplements.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_discovery/ru/sectors/natural-supplements.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_discovery/ru/sectors/artisan-ceramics.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_discovery/ru/sectors/artisan-ceramics.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_discovery/ru/sectors/artisan-ceramics.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_discovery/ru/sectors/artisan-ceramics.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_discovery/ru/sectors/artisan-ceramics.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_discovery/ru/sectors/artisan-ceramics.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_discovery/ru/sectors/artisan-ceramics.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_discovery/ru/sectors/artisan-ceramics.md
sed -i '' 's/site.tags/site.dimensions/g' ./_discovery/ru/sectors/artisan-ceramics.md
sed -i '' 's/page.tags/page.dimensions/g' ./_discovery/ru/sectors/artisan-ceramics.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_discovery/ru/sectors/artisan-ceramics.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_discovery/ru/sectors/gourmet-foods.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_discovery/ru/sectors/gourmet-foods.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_discovery/ru/sectors/gourmet-foods.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_discovery/ru/sectors/gourmet-foods.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_discovery/ru/sectors/gourmet-foods.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_discovery/ru/sectors/gourmet-foods.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_discovery/ru/sectors/gourmet-foods.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_discovery/ru/sectors/gourmet-foods.md
sed -i '' 's/site.tags/site.dimensions/g' ./_discovery/ru/sectors/gourmet-foods.md
sed -i '' 's/page.tags/page.dimensions/g' ./_discovery/ru/sectors/gourmet-foods.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_discovery/ru/sectors/gourmet-foods.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_discovery/ru/sectors/fermented-dairy.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_discovery/ru/sectors/fermented-dairy.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_discovery/ru/sectors/fermented-dairy.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_discovery/ru/sectors/fermented-dairy.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_discovery/ru/sectors/fermented-dairy.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_discovery/ru/sectors/fermented-dairy.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_discovery/ru/sectors/fermented-dairy.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_discovery/ru/sectors/fermented-dairy.md
sed -i '' 's/site.tags/site.dimensions/g' ./_discovery/ru/sectors/fermented-dairy.md
sed -i '' 's/page.tags/page.dimensions/g' ./_discovery/ru/sectors/fermented-dairy.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_discovery/ru/sectors/fermented-dairy.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_discovery/ru/sectors/honey-bee-products.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_discovery/ru/sectors/honey-bee-products.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_discovery/ru/sectors/honey-bee-products.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_discovery/ru/sectors/honey-bee-products.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_discovery/ru/sectors/honey-bee-products.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_discovery/ru/sectors/honey-bee-products.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_discovery/ru/sectors/honey-bee-products.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_discovery/ru/sectors/honey-bee-products.md
sed -i '' 's/site.tags/site.dimensions/g' ./_discovery/ru/sectors/honey-bee-products.md
sed -i '' 's/page.tags/page.dimensions/g' ./_discovery/ru/sectors/honey-bee-products.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_discovery/ru/sectors/honey-bee-products.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_discovery/ru/sectors/artisanal-spirits.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_discovery/ru/sectors/artisanal-spirits.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_discovery/ru/sectors/artisanal-spirits.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_discovery/ru/sectors/artisanal-spirits.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_discovery/ru/sectors/artisanal-spirits.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_discovery/ru/sectors/artisanal-spirits.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_discovery/ru/sectors/artisanal-spirits.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_discovery/ru/sectors/artisanal-spirits.md
sed -i '' 's/site.tags/site.dimensions/g' ./_discovery/ru/sectors/artisanal-spirits.md
sed -i '' 's/page.tags/page.dimensions/g' ./_discovery/ru/sectors/artisanal-spirits.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_discovery/ru/sectors/artisanal-spirits.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_discovery/ru/sectors/specialty-cheeses.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_discovery/ru/sectors/specialty-cheeses.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_discovery/ru/sectors/specialty-cheeses.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_discovery/ru/sectors/specialty-cheeses.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_discovery/ru/sectors/specialty-cheeses.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_discovery/ru/sectors/specialty-cheeses.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_discovery/ru/sectors/specialty-cheeses.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_discovery/ru/sectors/specialty-cheeses.md
sed -i '' 's/site.tags/site.dimensions/g' ./_discovery/ru/sectors/specialty-cheeses.md
sed -i '' 's/page.tags/page.dimensions/g' ./_discovery/ru/sectors/specialty-cheeses.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_discovery/ru/sectors/specialty-cheeses.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_discovery/ru/sectors/mineral-waters.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_discovery/ru/sectors/mineral-waters.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_discovery/ru/sectors/mineral-waters.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_discovery/ru/sectors/mineral-waters.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_discovery/ru/sectors/mineral-waters.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_discovery/ru/sectors/mineral-waters.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_discovery/ru/sectors/mineral-waters.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_discovery/ru/sectors/mineral-waters.md
sed -i '' 's/site.tags/site.dimensions/g' ./_discovery/ru/sectors/mineral-waters.md
sed -i '' 's/page.tags/page.dimensions/g' ./_discovery/ru/sectors/mineral-waters.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_discovery/ru/sectors/mineral-waters.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_discovery/ru/sectors/cured-meats.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_discovery/ru/sectors/cured-meats.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_discovery/ru/sectors/cured-meats.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_discovery/ru/sectors/cured-meats.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_discovery/ru/sectors/cured-meats.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_discovery/ru/sectors/cured-meats.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_discovery/ru/sectors/cured-meats.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_discovery/ru/sectors/cured-meats.md
sed -i '' 's/site.tags/site.dimensions/g' ./_discovery/ru/sectors/cured-meats.md
sed -i '' 's/page.tags/page.dimensions/g' ./_discovery/ru/sectors/cured-meats.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_discovery/ru/sectors/cured-meats.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_discovery/ru/sectors/natural-beauty.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_discovery/ru/sectors/natural-beauty.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_discovery/ru/sectors/natural-beauty.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_discovery/ru/sectors/natural-beauty.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_discovery/ru/sectors/natural-beauty.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_discovery/ru/sectors/natural-beauty.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_discovery/ru/sectors/natural-beauty.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_discovery/ru/sectors/natural-beauty.md
sed -i '' 's/site.tags/site.dimensions/g' ./_discovery/ru/sectors/natural-beauty.md
sed -i '' 's/page.tags/page.dimensions/g' ./_discovery/ru/sectors/natural-beauty.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_discovery/ru/sectors/natural-beauty.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_discovery/ru/sectors/jewelry-watches.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_discovery/ru/sectors/jewelry-watches.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_discovery/ru/sectors/jewelry-watches.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_discovery/ru/sectors/jewelry-watches.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_discovery/ru/sectors/jewelry-watches.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_discovery/ru/sectors/jewelry-watches.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_discovery/ru/sectors/jewelry-watches.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_discovery/ru/sectors/jewelry-watches.md
sed -i '' 's/site.tags/site.dimensions/g' ./_discovery/ru/sectors/jewelry-watches.md
sed -i '' 's/page.tags/page.dimensions/g' ./_discovery/ru/sectors/jewelry-watches.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_discovery/ru/sectors/jewelry-watches.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_discovery/ru/sectors/artisan-confectionery.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_discovery/ru/sectors/artisan-confectionery.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_discovery/ru/sectors/artisan-confectionery.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_discovery/ru/sectors/artisan-confectionery.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_discovery/ru/sectors/artisan-confectionery.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_discovery/ru/sectors/artisan-confectionery.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_discovery/ru/sectors/artisan-confectionery.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_discovery/ru/sectors/artisan-confectionery.md
sed -i '' 's/site.tags/site.dimensions/g' ./_discovery/ru/sectors/artisan-confectionery.md
sed -i '' 's/page.tags/page.dimensions/g' ./_discovery/ru/sectors/artisan-confectionery.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_discovery/ru/sectors/artisan-confectionery.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_discovery/ru/sectors/fashion-accessories.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_discovery/ru/sectors/fashion-accessories.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_discovery/ru/sectors/fashion-accessories.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_discovery/ru/sectors/fashion-accessories.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_discovery/ru/sectors/fashion-accessories.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_discovery/ru/sectors/fashion-accessories.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_discovery/ru/sectors/fashion-accessories.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_discovery/ru/sectors/fashion-accessories.md
sed -i '' 's/site.tags/site.dimensions/g' ./_discovery/ru/sectors/fashion-accessories.md
sed -i '' 's/page.tags/page.dimensions/g' ./_discovery/ru/sectors/fashion-accessories.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_discovery/ru/sectors/fashion-accessories.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_discovery/ru/sectors/halal-foods.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_discovery/ru/sectors/halal-foods.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_discovery/ru/sectors/halal-foods.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_discovery/ru/sectors/halal-foods.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_discovery/ru/sectors/halal-foods.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_discovery/ru/sectors/halal-foods.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_discovery/ru/sectors/halal-foods.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_discovery/ru/sectors/halal-foods.md
sed -i '' 's/site.tags/site.dimensions/g' ./_discovery/ru/sectors/halal-foods.md
sed -i '' 's/page.tags/page.dimensions/g' ./_discovery/ru/sectors/halal-foods.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_discovery/ru/sectors/halal-foods.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_discovery/ru/sectors/hotels-resorts.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_discovery/ru/sectors/hotels-resorts.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_discovery/ru/sectors/hotels-resorts.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_discovery/ru/sectors/hotels-resorts.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_discovery/ru/sectors/hotels-resorts.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_discovery/ru/sectors/hotels-resorts.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_discovery/ru/sectors/hotels-resorts.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_discovery/ru/sectors/hotels-resorts.md
sed -i '' 's/site.tags/site.dimensions/g' ./_discovery/ru/sectors/hotels-resorts.md
sed -i '' 's/page.tags/page.dimensions/g' ./_discovery/ru/sectors/hotels-resorts.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_discovery/ru/sectors/hotels-resorts.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_discovery/ru/sectors/wine.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_discovery/ru/sectors/wine.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_discovery/ru/sectors/wine.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_discovery/ru/sectors/wine.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_discovery/ru/sectors/wine.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_discovery/ru/sectors/wine.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_discovery/ru/sectors/wine.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_discovery/ru/sectors/wine.md
sed -i '' 's/site.tags/site.dimensions/g' ./_discovery/ru/sectors/wine.md
sed -i '' 's/page.tags/page.dimensions/g' ./_discovery/ru/sectors/wine.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_discovery/ru/sectors/wine.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_discovery/ru/signals/investment-ready.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_discovery/ru/signals/investment-ready.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_discovery/ru/signals/investment-ready.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_discovery/ru/signals/investment-ready.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_discovery/ru/signals/investment-ready.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_discovery/ru/signals/investment-ready.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_discovery/ru/signals/investment-ready.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_discovery/ru/signals/investment-ready.md
sed -i '' 's/site.tags/site.dimensions/g' ./_discovery/ru/signals/investment-ready.md
sed -i '' 's/page.tags/page.dimensions/g' ./_discovery/ru/signals/investment-ready.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_discovery/ru/signals/investment-ready.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_discovery/ru/signals/export-ready.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_discovery/ru/signals/export-ready.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_discovery/ru/signals/export-ready.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_discovery/ru/signals/export-ready.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_discovery/ru/signals/export-ready.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_discovery/ru/signals/export-ready.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_discovery/ru/signals/export-ready.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_discovery/ru/signals/export-ready.md
sed -i '' 's/site.tags/site.dimensions/g' ./_discovery/ru/signals/export-ready.md
sed -i '' 's/page.tags/page.dimensions/g' ./_discovery/ru/signals/export-ready.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_discovery/ru/signals/export-ready.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_discovery/ru/signals/franchise-ready.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_discovery/ru/signals/franchise-ready.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_discovery/ru/signals/franchise-ready.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_discovery/ru/signals/franchise-ready.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_discovery/ru/signals/franchise-ready.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_discovery/ru/signals/franchise-ready.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_discovery/ru/signals/franchise-ready.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_discovery/ru/signals/franchise-ready.md
sed -i '' 's/site.tags/site.dimensions/g' ./_discovery/ru/signals/franchise-ready.md
sed -i '' 's/page.tags/page.dimensions/g' ./_discovery/ru/signals/franchise-ready.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_discovery/ru/signals/franchise-ready.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_discovery/ru/signals/rapid-growth.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_discovery/ru/signals/rapid-growth.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_discovery/ru/signals/rapid-growth.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_discovery/ru/signals/rapid-growth.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_discovery/ru/signals/rapid-growth.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_discovery/ru/signals/rapid-growth.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_discovery/ru/signals/rapid-growth.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_discovery/ru/signals/rapid-growth.md
sed -i '' 's/site.tags/site.dimensions/g' ./_discovery/ru/signals/rapid-growth.md
sed -i '' 's/page.tags/page.dimensions/g' ./_discovery/ru/signals/rapid-growth.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_discovery/ru/signals/rapid-growth.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_discovery/ru/attributes/premium-positioning.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_discovery/ru/attributes/premium-positioning.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_discovery/ru/attributes/premium-positioning.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_discovery/ru/attributes/premium-positioning.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_discovery/ru/attributes/premium-positioning.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_discovery/ru/attributes/premium-positioning.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_discovery/ru/attributes/premium-positioning.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_discovery/ru/attributes/premium-positioning.md
sed -i '' 's/site.tags/site.dimensions/g' ./_discovery/ru/attributes/premium-positioning.md
sed -i '' 's/page.tags/page.dimensions/g' ./_discovery/ru/attributes/premium-positioning.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_discovery/ru/attributes/premium-positioning.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_discovery/ru/attributes/innovation-leader.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_discovery/ru/attributes/innovation-leader.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_discovery/ru/attributes/innovation-leader.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_discovery/ru/attributes/innovation-leader.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_discovery/ru/attributes/innovation-leader.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_discovery/ru/attributes/innovation-leader.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_discovery/ru/attributes/innovation-leader.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_discovery/ru/attributes/innovation-leader.md
sed -i '' 's/site.tags/site.dimensions/g' ./_discovery/ru/attributes/innovation-leader.md
sed -i '' 's/page.tags/page.dimensions/g' ./_discovery/ru/attributes/innovation-leader.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_discovery/ru/attributes/innovation-leader.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_discovery/ru/attributes/cultural-ambassador.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_discovery/ru/attributes/cultural-ambassador.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_discovery/ru/attributes/cultural-ambassador.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_discovery/ru/attributes/cultural-ambassador.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_discovery/ru/attributes/cultural-ambassador.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_discovery/ru/attributes/cultural-ambassador.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_discovery/ru/attributes/cultural-ambassador.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_discovery/ru/attributes/cultural-ambassador.md
sed -i '' 's/site.tags/site.dimensions/g' ./_discovery/ru/attributes/cultural-ambassador.md
sed -i '' 's/page.tags/page.dimensions/g' ./_discovery/ru/attributes/cultural-ambassador.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_discovery/ru/attributes/cultural-ambassador.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_discovery/ru/attributes/artisanal-excellence.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_discovery/ru/attributes/artisanal-excellence.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_discovery/ru/attributes/artisanal-excellence.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_discovery/ru/attributes/artisanal-excellence.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_discovery/ru/attributes/artisanal-excellence.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_discovery/ru/attributes/artisanal-excellence.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_discovery/ru/attributes/artisanal-excellence.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_discovery/ru/attributes/artisanal-excellence.md
sed -i '' 's/site.tags/site.dimensions/g' ./_discovery/ru/attributes/artisanal-excellence.md
sed -i '' 's/page.tags/page.dimensions/g' ./_discovery/ru/attributes/artisanal-excellence.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_discovery/ru/attributes/artisanal-excellence.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_discovery/ru/attributes/sustainability-pioneer.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_discovery/ru/attributes/sustainability-pioneer.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_discovery/ru/attributes/sustainability-pioneer.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_discovery/ru/attributes/sustainability-pioneer.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_discovery/ru/attributes/sustainability-pioneer.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_discovery/ru/attributes/sustainability-pioneer.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_discovery/ru/attributes/sustainability-pioneer.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_discovery/ru/attributes/sustainability-pioneer.md
sed -i '' 's/site.tags/site.dimensions/g' ./_discovery/ru/attributes/sustainability-pioneer.md
sed -i '' 's/page.tags/page.dimensions/g' ./_discovery/ru/attributes/sustainability-pioneer.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_discovery/ru/attributes/sustainability-pioneer.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_discovery/ru/attributes/founder-led.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_discovery/ru/attributes/founder-led.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_discovery/ru/attributes/founder-led.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_discovery/ru/attributes/founder-led.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_discovery/ru/attributes/founder-led.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_discovery/ru/attributes/founder-led.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_discovery/ru/attributes/founder-led.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_discovery/ru/attributes/founder-led.md
sed -i '' 's/site.tags/site.dimensions/g' ./_discovery/ru/attributes/founder-led.md
sed -i '' 's/page.tags/page.dimensions/g' ./_discovery/ru/attributes/founder-led.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_discovery/ru/attributes/founder-led.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_discovery/ru/attributes/regional-icon.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_discovery/ru/attributes/regional-icon.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_discovery/ru/attributes/regional-icon.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_discovery/ru/attributes/regional-icon.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_discovery/ru/attributes/regional-icon.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_discovery/ru/attributes/regional-icon.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_discovery/ru/attributes/regional-icon.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_discovery/ru/attributes/regional-icon.md
sed -i '' 's/site.tags/site.dimensions/g' ./_discovery/ru/attributes/regional-icon.md
sed -i '' 's/page.tags/page.dimensions/g' ./_discovery/ru/attributes/regional-icon.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_discovery/ru/attributes/regional-icon.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_discovery/ru/attributes/heritage-brand.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_discovery/ru/attributes/heritage-brand.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_discovery/ru/attributes/heritage-brand.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_discovery/ru/attributes/heritage-brand.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_discovery/ru/attributes/heritage-brand.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_discovery/ru/attributes/heritage-brand.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_discovery/ru/attributes/heritage-brand.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_discovery/ru/attributes/heritage-brand.md
sed -i '' 's/site.tags/site.dimensions/g' ./_discovery/ru/attributes/heritage-brand.md
sed -i '' 's/page.tags/page.dimensions/g' ./_discovery/ru/attributes/heritage-brand.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_discovery/ru/attributes/heritage-brand.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_discovery/ru/markets/china.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_discovery/ru/markets/china.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_discovery/ru/markets/china.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_discovery/ru/markets/china.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_discovery/ru/markets/china.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_discovery/ru/markets/china.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_discovery/ru/markets/china.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_discovery/ru/markets/china.md
sed -i '' 's/site.tags/site.dimensions/g' ./_discovery/ru/markets/china.md
sed -i '' 's/page.tags/page.dimensions/g' ./_discovery/ru/markets/china.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_discovery/ru/markets/china.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_discovery/ru/markets/brazil.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_discovery/ru/markets/brazil.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_discovery/ru/markets/brazil.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_discovery/ru/markets/brazil.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_discovery/ru/markets/brazil.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_discovery/ru/markets/brazil.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_discovery/ru/markets/brazil.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_discovery/ru/markets/brazil.md
sed -i '' 's/site.tags/site.dimensions/g' ./_discovery/ru/markets/brazil.md
sed -i '' 's/page.tags/page.dimensions/g' ./_discovery/ru/markets/brazil.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_discovery/ru/markets/brazil.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_discovery/ru/markets/south-africa.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_discovery/ru/markets/south-africa.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_discovery/ru/markets/south-africa.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_discovery/ru/markets/south-africa.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_discovery/ru/markets/south-africa.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_discovery/ru/markets/south-africa.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_discovery/ru/markets/south-africa.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_discovery/ru/markets/south-africa.md
sed -i '' 's/site.tags/site.dimensions/g' ./_discovery/ru/markets/south-africa.md
sed -i '' 's/page.tags/page.dimensions/g' ./_discovery/ru/markets/south-africa.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_discovery/ru/markets/south-africa.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_discovery/ru/markets/india.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_discovery/ru/markets/india.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_discovery/ru/markets/india.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_discovery/ru/markets/india.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_discovery/ru/markets/india.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_discovery/ru/markets/india.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_discovery/ru/markets/india.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_discovery/ru/markets/india.md
sed -i '' 's/site.tags/site.dimensions/g' ./_discovery/ru/markets/india.md
sed -i '' 's/page.tags/page.dimensions/g' ./_discovery/ru/markets/india.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_discovery/ru/markets/india.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_discovery/ru/markets/russia.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_discovery/ru/markets/russia.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_discovery/ru/markets/russia.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_discovery/ru/markets/russia.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_discovery/ru/markets/russia.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_discovery/ru/markets/russia.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_discovery/ru/markets/russia.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_discovery/ru/markets/russia.md
sed -i '' 's/site.tags/site.dimensions/g' ./_discovery/ru/markets/russia.md
sed -i '' 's/page.tags/page.dimensions/g' ./_discovery/ru/markets/russia.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_discovery/ru/markets/russia.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_discovery/zh/sectors/natural-supplements.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_discovery/zh/sectors/natural-supplements.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_discovery/zh/sectors/natural-supplements.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_discovery/zh/sectors/natural-supplements.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_discovery/zh/sectors/natural-supplements.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_discovery/zh/sectors/natural-supplements.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_discovery/zh/sectors/natural-supplements.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_discovery/zh/sectors/natural-supplements.md
sed -i '' 's/site.tags/site.dimensions/g' ./_discovery/zh/sectors/natural-supplements.md
sed -i '' 's/page.tags/page.dimensions/g' ./_discovery/zh/sectors/natural-supplements.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_discovery/zh/sectors/natural-supplements.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_discovery/zh/sectors/artisan-ceramics.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_discovery/zh/sectors/artisan-ceramics.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_discovery/zh/sectors/artisan-ceramics.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_discovery/zh/sectors/artisan-ceramics.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_discovery/zh/sectors/artisan-ceramics.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_discovery/zh/sectors/artisan-ceramics.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_discovery/zh/sectors/artisan-ceramics.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_discovery/zh/sectors/artisan-ceramics.md
sed -i '' 's/site.tags/site.dimensions/g' ./_discovery/zh/sectors/artisan-ceramics.md
sed -i '' 's/page.tags/page.dimensions/g' ./_discovery/zh/sectors/artisan-ceramics.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_discovery/zh/sectors/artisan-ceramics.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_discovery/zh/sectors/gourmet-foods.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_discovery/zh/sectors/gourmet-foods.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_discovery/zh/sectors/gourmet-foods.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_discovery/zh/sectors/gourmet-foods.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_discovery/zh/sectors/gourmet-foods.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_discovery/zh/sectors/gourmet-foods.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_discovery/zh/sectors/gourmet-foods.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_discovery/zh/sectors/gourmet-foods.md
sed -i '' 's/site.tags/site.dimensions/g' ./_discovery/zh/sectors/gourmet-foods.md
sed -i '' 's/page.tags/page.dimensions/g' ./_discovery/zh/sectors/gourmet-foods.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_discovery/zh/sectors/gourmet-foods.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_discovery/zh/sectors/fermented-dairy.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_discovery/zh/sectors/fermented-dairy.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_discovery/zh/sectors/fermented-dairy.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_discovery/zh/sectors/fermented-dairy.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_discovery/zh/sectors/fermented-dairy.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_discovery/zh/sectors/fermented-dairy.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_discovery/zh/sectors/fermented-dairy.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_discovery/zh/sectors/fermented-dairy.md
sed -i '' 's/site.tags/site.dimensions/g' ./_discovery/zh/sectors/fermented-dairy.md
sed -i '' 's/page.tags/page.dimensions/g' ./_discovery/zh/sectors/fermented-dairy.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_discovery/zh/sectors/fermented-dairy.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_discovery/zh/sectors/honey-bee-products.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_discovery/zh/sectors/honey-bee-products.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_discovery/zh/sectors/honey-bee-products.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_discovery/zh/sectors/honey-bee-products.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_discovery/zh/sectors/honey-bee-products.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_discovery/zh/sectors/honey-bee-products.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_discovery/zh/sectors/honey-bee-products.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_discovery/zh/sectors/honey-bee-products.md
sed -i '' 's/site.tags/site.dimensions/g' ./_discovery/zh/sectors/honey-bee-products.md
sed -i '' 's/page.tags/page.dimensions/g' ./_discovery/zh/sectors/honey-bee-products.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_discovery/zh/sectors/honey-bee-products.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_discovery/zh/sectors/artisanal-spirits.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_discovery/zh/sectors/artisanal-spirits.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_discovery/zh/sectors/artisanal-spirits.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_discovery/zh/sectors/artisanal-spirits.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_discovery/zh/sectors/artisanal-spirits.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_discovery/zh/sectors/artisanal-spirits.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_discovery/zh/sectors/artisanal-spirits.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_discovery/zh/sectors/artisanal-spirits.md
sed -i '' 's/site.tags/site.dimensions/g' ./_discovery/zh/sectors/artisanal-spirits.md
sed -i '' 's/page.tags/page.dimensions/g' ./_discovery/zh/sectors/artisanal-spirits.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_discovery/zh/sectors/artisanal-spirits.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_discovery/zh/sectors/specialty-cheeses.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_discovery/zh/sectors/specialty-cheeses.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_discovery/zh/sectors/specialty-cheeses.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_discovery/zh/sectors/specialty-cheeses.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_discovery/zh/sectors/specialty-cheeses.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_discovery/zh/sectors/specialty-cheeses.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_discovery/zh/sectors/specialty-cheeses.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_discovery/zh/sectors/specialty-cheeses.md
sed -i '' 's/site.tags/site.dimensions/g' ./_discovery/zh/sectors/specialty-cheeses.md
sed -i '' 's/page.tags/page.dimensions/g' ./_discovery/zh/sectors/specialty-cheeses.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_discovery/zh/sectors/specialty-cheeses.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_discovery/zh/sectors/mineral-waters.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_discovery/zh/sectors/mineral-waters.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_discovery/zh/sectors/mineral-waters.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_discovery/zh/sectors/mineral-waters.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_discovery/zh/sectors/mineral-waters.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_discovery/zh/sectors/mineral-waters.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_discovery/zh/sectors/mineral-waters.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_discovery/zh/sectors/mineral-waters.md
sed -i '' 's/site.tags/site.dimensions/g' ./_discovery/zh/sectors/mineral-waters.md
sed -i '' 's/page.tags/page.dimensions/g' ./_discovery/zh/sectors/mineral-waters.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_discovery/zh/sectors/mineral-waters.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_discovery/zh/sectors/cured-meats.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_discovery/zh/sectors/cured-meats.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_discovery/zh/sectors/cured-meats.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_discovery/zh/sectors/cured-meats.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_discovery/zh/sectors/cured-meats.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_discovery/zh/sectors/cured-meats.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_discovery/zh/sectors/cured-meats.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_discovery/zh/sectors/cured-meats.md
sed -i '' 's/site.tags/site.dimensions/g' ./_discovery/zh/sectors/cured-meats.md
sed -i '' 's/page.tags/page.dimensions/g' ./_discovery/zh/sectors/cured-meats.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_discovery/zh/sectors/cured-meats.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_discovery/zh/sectors/natural-beauty.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_discovery/zh/sectors/natural-beauty.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_discovery/zh/sectors/natural-beauty.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_discovery/zh/sectors/natural-beauty.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_discovery/zh/sectors/natural-beauty.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_discovery/zh/sectors/natural-beauty.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_discovery/zh/sectors/natural-beauty.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_discovery/zh/sectors/natural-beauty.md
sed -i '' 's/site.tags/site.dimensions/g' ./_discovery/zh/sectors/natural-beauty.md
sed -i '' 's/page.tags/page.dimensions/g' ./_discovery/zh/sectors/natural-beauty.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_discovery/zh/sectors/natural-beauty.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_discovery/zh/sectors/jewelry-watches.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_discovery/zh/sectors/jewelry-watches.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_discovery/zh/sectors/jewelry-watches.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_discovery/zh/sectors/jewelry-watches.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_discovery/zh/sectors/jewelry-watches.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_discovery/zh/sectors/jewelry-watches.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_discovery/zh/sectors/jewelry-watches.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_discovery/zh/sectors/jewelry-watches.md
sed -i '' 's/site.tags/site.dimensions/g' ./_discovery/zh/sectors/jewelry-watches.md
sed -i '' 's/page.tags/page.dimensions/g' ./_discovery/zh/sectors/jewelry-watches.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_discovery/zh/sectors/jewelry-watches.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_discovery/zh/sectors/artisan-confectionery.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_discovery/zh/sectors/artisan-confectionery.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_discovery/zh/sectors/artisan-confectionery.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_discovery/zh/sectors/artisan-confectionery.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_discovery/zh/sectors/artisan-confectionery.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_discovery/zh/sectors/artisan-confectionery.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_discovery/zh/sectors/artisan-confectionery.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_discovery/zh/sectors/artisan-confectionery.md
sed -i '' 's/site.tags/site.dimensions/g' ./_discovery/zh/sectors/artisan-confectionery.md
sed -i '' 's/page.tags/page.dimensions/g' ./_discovery/zh/sectors/artisan-confectionery.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_discovery/zh/sectors/artisan-confectionery.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_discovery/zh/sectors/fashion-accessories.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_discovery/zh/sectors/fashion-accessories.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_discovery/zh/sectors/fashion-accessories.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_discovery/zh/sectors/fashion-accessories.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_discovery/zh/sectors/fashion-accessories.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_discovery/zh/sectors/fashion-accessories.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_discovery/zh/sectors/fashion-accessories.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_discovery/zh/sectors/fashion-accessories.md
sed -i '' 's/site.tags/site.dimensions/g' ./_discovery/zh/sectors/fashion-accessories.md
sed -i '' 's/page.tags/page.dimensions/g' ./_discovery/zh/sectors/fashion-accessories.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_discovery/zh/sectors/fashion-accessories.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_discovery/zh/sectors/halal-foods.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_discovery/zh/sectors/halal-foods.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_discovery/zh/sectors/halal-foods.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_discovery/zh/sectors/halal-foods.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_discovery/zh/sectors/halal-foods.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_discovery/zh/sectors/halal-foods.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_discovery/zh/sectors/halal-foods.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_discovery/zh/sectors/halal-foods.md
sed -i '' 's/site.tags/site.dimensions/g' ./_discovery/zh/sectors/halal-foods.md
sed -i '' 's/page.tags/page.dimensions/g' ./_discovery/zh/sectors/halal-foods.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_discovery/zh/sectors/halal-foods.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_discovery/zh/sectors/hotels-resorts.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_discovery/zh/sectors/hotels-resorts.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_discovery/zh/sectors/hotels-resorts.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_discovery/zh/sectors/hotels-resorts.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_discovery/zh/sectors/hotels-resorts.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_discovery/zh/sectors/hotels-resorts.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_discovery/zh/sectors/hotels-resorts.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_discovery/zh/sectors/hotels-resorts.md
sed -i '' 's/site.tags/site.dimensions/g' ./_discovery/zh/sectors/hotels-resorts.md
sed -i '' 's/page.tags/page.dimensions/g' ./_discovery/zh/sectors/hotels-resorts.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_discovery/zh/sectors/hotels-resorts.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_discovery/zh/sectors/wine.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_discovery/zh/sectors/wine.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_discovery/zh/sectors/wine.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_discovery/zh/sectors/wine.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_discovery/zh/sectors/wine.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_discovery/zh/sectors/wine.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_discovery/zh/sectors/wine.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_discovery/zh/sectors/wine.md
sed -i '' 's/site.tags/site.dimensions/g' ./_discovery/zh/sectors/wine.md
sed -i '' 's/page.tags/page.dimensions/g' ./_discovery/zh/sectors/wine.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_discovery/zh/sectors/wine.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_discovery/zh/signals/investment-ready.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_discovery/zh/signals/investment-ready.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_discovery/zh/signals/investment-ready.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_discovery/zh/signals/investment-ready.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_discovery/zh/signals/investment-ready.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_discovery/zh/signals/investment-ready.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_discovery/zh/signals/investment-ready.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_discovery/zh/signals/investment-ready.md
sed -i '' 's/site.tags/site.dimensions/g' ./_discovery/zh/signals/investment-ready.md
sed -i '' 's/page.tags/page.dimensions/g' ./_discovery/zh/signals/investment-ready.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_discovery/zh/signals/investment-ready.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_discovery/zh/signals/export-ready.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_discovery/zh/signals/export-ready.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_discovery/zh/signals/export-ready.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_discovery/zh/signals/export-ready.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_discovery/zh/signals/export-ready.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_discovery/zh/signals/export-ready.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_discovery/zh/signals/export-ready.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_discovery/zh/signals/export-ready.md
sed -i '' 's/site.tags/site.dimensions/g' ./_discovery/zh/signals/export-ready.md
sed -i '' 's/page.tags/page.dimensions/g' ./_discovery/zh/signals/export-ready.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_discovery/zh/signals/export-ready.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_discovery/zh/signals/franchise-ready.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_discovery/zh/signals/franchise-ready.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_discovery/zh/signals/franchise-ready.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_discovery/zh/signals/franchise-ready.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_discovery/zh/signals/franchise-ready.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_discovery/zh/signals/franchise-ready.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_discovery/zh/signals/franchise-ready.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_discovery/zh/signals/franchise-ready.md
sed -i '' 's/site.tags/site.dimensions/g' ./_discovery/zh/signals/franchise-ready.md
sed -i '' 's/page.tags/page.dimensions/g' ./_discovery/zh/signals/franchise-ready.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_discovery/zh/signals/franchise-ready.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_discovery/zh/signals/rapid-growth.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_discovery/zh/signals/rapid-growth.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_discovery/zh/signals/rapid-growth.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_discovery/zh/signals/rapid-growth.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_discovery/zh/signals/rapid-growth.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_discovery/zh/signals/rapid-growth.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_discovery/zh/signals/rapid-growth.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_discovery/zh/signals/rapid-growth.md
sed -i '' 's/site.tags/site.dimensions/g' ./_discovery/zh/signals/rapid-growth.md
sed -i '' 's/page.tags/page.dimensions/g' ./_discovery/zh/signals/rapid-growth.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_discovery/zh/signals/rapid-growth.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_discovery/zh/attributes/premium-positioning.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_discovery/zh/attributes/premium-positioning.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_discovery/zh/attributes/premium-positioning.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_discovery/zh/attributes/premium-positioning.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_discovery/zh/attributes/premium-positioning.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_discovery/zh/attributes/premium-positioning.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_discovery/zh/attributes/premium-positioning.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_discovery/zh/attributes/premium-positioning.md
sed -i '' 's/site.tags/site.dimensions/g' ./_discovery/zh/attributes/premium-positioning.md
sed -i '' 's/page.tags/page.dimensions/g' ./_discovery/zh/attributes/premium-positioning.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_discovery/zh/attributes/premium-positioning.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_discovery/zh/attributes/innovation-leader.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_discovery/zh/attributes/innovation-leader.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_discovery/zh/attributes/innovation-leader.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_discovery/zh/attributes/innovation-leader.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_discovery/zh/attributes/innovation-leader.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_discovery/zh/attributes/innovation-leader.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_discovery/zh/attributes/innovation-leader.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_discovery/zh/attributes/innovation-leader.md
sed -i '' 's/site.tags/site.dimensions/g' ./_discovery/zh/attributes/innovation-leader.md
sed -i '' 's/page.tags/page.dimensions/g' ./_discovery/zh/attributes/innovation-leader.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_discovery/zh/attributes/innovation-leader.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_discovery/zh/attributes/cultural-ambassador.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_discovery/zh/attributes/cultural-ambassador.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_discovery/zh/attributes/cultural-ambassador.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_discovery/zh/attributes/cultural-ambassador.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_discovery/zh/attributes/cultural-ambassador.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_discovery/zh/attributes/cultural-ambassador.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_discovery/zh/attributes/cultural-ambassador.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_discovery/zh/attributes/cultural-ambassador.md
sed -i '' 's/site.tags/site.dimensions/g' ./_discovery/zh/attributes/cultural-ambassador.md
sed -i '' 's/page.tags/page.dimensions/g' ./_discovery/zh/attributes/cultural-ambassador.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_discovery/zh/attributes/cultural-ambassador.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_discovery/zh/attributes/artisanal-excellence.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_discovery/zh/attributes/artisanal-excellence.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_discovery/zh/attributes/artisanal-excellence.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_discovery/zh/attributes/artisanal-excellence.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_discovery/zh/attributes/artisanal-excellence.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_discovery/zh/attributes/artisanal-excellence.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_discovery/zh/attributes/artisanal-excellence.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_discovery/zh/attributes/artisanal-excellence.md
sed -i '' 's/site.tags/site.dimensions/g' ./_discovery/zh/attributes/artisanal-excellence.md
sed -i '' 's/page.tags/page.dimensions/g' ./_discovery/zh/attributes/artisanal-excellence.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_discovery/zh/attributes/artisanal-excellence.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_discovery/zh/attributes/sustainability-pioneer.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_discovery/zh/attributes/sustainability-pioneer.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_discovery/zh/attributes/sustainability-pioneer.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_discovery/zh/attributes/sustainability-pioneer.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_discovery/zh/attributes/sustainability-pioneer.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_discovery/zh/attributes/sustainability-pioneer.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_discovery/zh/attributes/sustainability-pioneer.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_discovery/zh/attributes/sustainability-pioneer.md
sed -i '' 's/site.tags/site.dimensions/g' ./_discovery/zh/attributes/sustainability-pioneer.md
sed -i '' 's/page.tags/page.dimensions/g' ./_discovery/zh/attributes/sustainability-pioneer.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_discovery/zh/attributes/sustainability-pioneer.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_discovery/zh/attributes/founder-led.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_discovery/zh/attributes/founder-led.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_discovery/zh/attributes/founder-led.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_discovery/zh/attributes/founder-led.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_discovery/zh/attributes/founder-led.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_discovery/zh/attributes/founder-led.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_discovery/zh/attributes/founder-led.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_discovery/zh/attributes/founder-led.md
sed -i '' 's/site.tags/site.dimensions/g' ./_discovery/zh/attributes/founder-led.md
sed -i '' 's/page.tags/page.dimensions/g' ./_discovery/zh/attributes/founder-led.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_discovery/zh/attributes/founder-led.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_discovery/zh/attributes/regional-icon.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_discovery/zh/attributes/regional-icon.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_discovery/zh/attributes/regional-icon.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_discovery/zh/attributes/regional-icon.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_discovery/zh/attributes/regional-icon.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_discovery/zh/attributes/regional-icon.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_discovery/zh/attributes/regional-icon.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_discovery/zh/attributes/regional-icon.md
sed -i '' 's/site.tags/site.dimensions/g' ./_discovery/zh/attributes/regional-icon.md
sed -i '' 's/page.tags/page.dimensions/g' ./_discovery/zh/attributes/regional-icon.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_discovery/zh/attributes/regional-icon.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_discovery/zh/attributes/heritage-brand.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_discovery/zh/attributes/heritage-brand.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_discovery/zh/attributes/heritage-brand.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_discovery/zh/attributes/heritage-brand.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_discovery/zh/attributes/heritage-brand.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_discovery/zh/attributes/heritage-brand.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_discovery/zh/attributes/heritage-brand.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_discovery/zh/attributes/heritage-brand.md
sed -i '' 's/site.tags/site.dimensions/g' ./_discovery/zh/attributes/heritage-brand.md
sed -i '' 's/page.tags/page.dimensions/g' ./_discovery/zh/attributes/heritage-brand.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_discovery/zh/attributes/heritage-brand.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_discovery/zh/markets/china.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_discovery/zh/markets/china.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_discovery/zh/markets/china.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_discovery/zh/markets/china.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_discovery/zh/markets/china.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_discovery/zh/markets/china.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_discovery/zh/markets/china.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_discovery/zh/markets/china.md
sed -i '' 's/site.tags/site.dimensions/g' ./_discovery/zh/markets/china.md
sed -i '' 's/page.tags/page.dimensions/g' ./_discovery/zh/markets/china.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_discovery/zh/markets/china.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_discovery/zh/markets/brazil.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_discovery/zh/markets/brazil.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_discovery/zh/markets/brazil.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_discovery/zh/markets/brazil.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_discovery/zh/markets/brazil.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_discovery/zh/markets/brazil.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_discovery/zh/markets/brazil.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_discovery/zh/markets/brazil.md
sed -i '' 's/site.tags/site.dimensions/g' ./_discovery/zh/markets/brazil.md
sed -i '' 's/page.tags/page.dimensions/g' ./_discovery/zh/markets/brazil.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_discovery/zh/markets/brazil.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_discovery/zh/markets/south-africa.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_discovery/zh/markets/south-africa.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_discovery/zh/markets/south-africa.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_discovery/zh/markets/south-africa.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_discovery/zh/markets/south-africa.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_discovery/zh/markets/south-africa.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_discovery/zh/markets/south-africa.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_discovery/zh/markets/south-africa.md
sed -i '' 's/site.tags/site.dimensions/g' ./_discovery/zh/markets/south-africa.md
sed -i '' 's/page.tags/page.dimensions/g' ./_discovery/zh/markets/south-africa.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_discovery/zh/markets/south-africa.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_discovery/zh/markets/india.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_discovery/zh/markets/india.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_discovery/zh/markets/india.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_discovery/zh/markets/india.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_discovery/zh/markets/india.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_discovery/zh/markets/india.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_discovery/zh/markets/india.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_discovery/zh/markets/india.md
sed -i '' 's/site.tags/site.dimensions/g' ./_discovery/zh/markets/india.md
sed -i '' 's/page.tags/page.dimensions/g' ./_discovery/zh/markets/india.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_discovery/zh/markets/india.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_discovery/zh/markets/russia.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_discovery/zh/markets/russia.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_discovery/zh/markets/russia.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_discovery/zh/markets/russia.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_discovery/zh/markets/russia.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_discovery/zh/markets/russia.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_discovery/zh/markets/russia.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_discovery/zh/markets/russia.md
sed -i '' 's/site.tags/site.dimensions/g' ./_discovery/zh/markets/russia.md
sed -i '' 's/page.tags/page.dimensions/g' ./_discovery/zh/markets/russia.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_discovery/zh/markets/russia.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_discovery/en/sectors/natural-supplements.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_discovery/en/sectors/natural-supplements.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_discovery/en/sectors/natural-supplements.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_discovery/en/sectors/natural-supplements.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_discovery/en/sectors/natural-supplements.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_discovery/en/sectors/natural-supplements.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_discovery/en/sectors/natural-supplements.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_discovery/en/sectors/natural-supplements.md
sed -i '' 's/site.tags/site.dimensions/g' ./_discovery/en/sectors/natural-supplements.md
sed -i '' 's/page.tags/page.dimensions/g' ./_discovery/en/sectors/natural-supplements.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_discovery/en/sectors/natural-supplements.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_discovery/en/sectors/artisan-ceramics.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_discovery/en/sectors/artisan-ceramics.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_discovery/en/sectors/artisan-ceramics.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_discovery/en/sectors/artisan-ceramics.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_discovery/en/sectors/artisan-ceramics.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_discovery/en/sectors/artisan-ceramics.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_discovery/en/sectors/artisan-ceramics.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_discovery/en/sectors/artisan-ceramics.md
sed -i '' 's/site.tags/site.dimensions/g' ./_discovery/en/sectors/artisan-ceramics.md
sed -i '' 's/page.tags/page.dimensions/g' ./_discovery/en/sectors/artisan-ceramics.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_discovery/en/sectors/artisan-ceramics.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_discovery/en/sectors/gourmet-foods.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_discovery/en/sectors/gourmet-foods.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_discovery/en/sectors/gourmet-foods.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_discovery/en/sectors/gourmet-foods.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_discovery/en/sectors/gourmet-foods.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_discovery/en/sectors/gourmet-foods.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_discovery/en/sectors/gourmet-foods.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_discovery/en/sectors/gourmet-foods.md
sed -i '' 's/site.tags/site.dimensions/g' ./_discovery/en/sectors/gourmet-foods.md
sed -i '' 's/page.tags/page.dimensions/g' ./_discovery/en/sectors/gourmet-foods.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_discovery/en/sectors/gourmet-foods.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_discovery/en/sectors/fermented-dairy.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_discovery/en/sectors/fermented-dairy.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_discovery/en/sectors/fermented-dairy.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_discovery/en/sectors/fermented-dairy.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_discovery/en/sectors/fermented-dairy.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_discovery/en/sectors/fermented-dairy.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_discovery/en/sectors/fermented-dairy.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_discovery/en/sectors/fermented-dairy.md
sed -i '' 's/site.tags/site.dimensions/g' ./_discovery/en/sectors/fermented-dairy.md
sed -i '' 's/page.tags/page.dimensions/g' ./_discovery/en/sectors/fermented-dairy.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_discovery/en/sectors/fermented-dairy.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_discovery/en/sectors/honey-bee-products.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_discovery/en/sectors/honey-bee-products.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_discovery/en/sectors/honey-bee-products.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_discovery/en/sectors/honey-bee-products.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_discovery/en/sectors/honey-bee-products.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_discovery/en/sectors/honey-bee-products.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_discovery/en/sectors/honey-bee-products.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_discovery/en/sectors/honey-bee-products.md
sed -i '' 's/site.tags/site.dimensions/g' ./_discovery/en/sectors/honey-bee-products.md
sed -i '' 's/page.tags/page.dimensions/g' ./_discovery/en/sectors/honey-bee-products.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_discovery/en/sectors/honey-bee-products.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_discovery/en/sectors/artisanal-spirits.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_discovery/en/sectors/artisanal-spirits.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_discovery/en/sectors/artisanal-spirits.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_discovery/en/sectors/artisanal-spirits.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_discovery/en/sectors/artisanal-spirits.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_discovery/en/sectors/artisanal-spirits.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_discovery/en/sectors/artisanal-spirits.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_discovery/en/sectors/artisanal-spirits.md
sed -i '' 's/site.tags/site.dimensions/g' ./_discovery/en/sectors/artisanal-spirits.md
sed -i '' 's/page.tags/page.dimensions/g' ./_discovery/en/sectors/artisanal-spirits.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_discovery/en/sectors/artisanal-spirits.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_discovery/en/sectors/specialty-cheeses.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_discovery/en/sectors/specialty-cheeses.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_discovery/en/sectors/specialty-cheeses.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_discovery/en/sectors/specialty-cheeses.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_discovery/en/sectors/specialty-cheeses.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_discovery/en/sectors/specialty-cheeses.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_discovery/en/sectors/specialty-cheeses.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_discovery/en/sectors/specialty-cheeses.md
sed -i '' 's/site.tags/site.dimensions/g' ./_discovery/en/sectors/specialty-cheeses.md
sed -i '' 's/page.tags/page.dimensions/g' ./_discovery/en/sectors/specialty-cheeses.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_discovery/en/sectors/specialty-cheeses.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_discovery/en/sectors/halal-food-products.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_discovery/en/sectors/halal-food-products.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_discovery/en/sectors/halal-food-products.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_discovery/en/sectors/halal-food-products.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_discovery/en/sectors/halal-food-products.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_discovery/en/sectors/halal-food-products.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_discovery/en/sectors/halal-food-products.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_discovery/en/sectors/halal-food-products.md
sed -i '' 's/site.tags/site.dimensions/g' ./_discovery/en/sectors/halal-food-products.md
sed -i '' 's/page.tags/page.dimensions/g' ./_discovery/en/sectors/halal-food-products.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_discovery/en/sectors/halal-food-products.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_discovery/en/sectors/mineral-waters.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_discovery/en/sectors/mineral-waters.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_discovery/en/sectors/mineral-waters.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_discovery/en/sectors/mineral-waters.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_discovery/en/sectors/mineral-waters.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_discovery/en/sectors/mineral-waters.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_discovery/en/sectors/mineral-waters.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_discovery/en/sectors/mineral-waters.md
sed -i '' 's/site.tags/site.dimensions/g' ./_discovery/en/sectors/mineral-waters.md
sed -i '' 's/page.tags/page.dimensions/g' ./_discovery/en/sectors/mineral-waters.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_discovery/en/sectors/mineral-waters.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_discovery/en/sectors/cured-meats.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_discovery/en/sectors/cured-meats.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_discovery/en/sectors/cured-meats.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_discovery/en/sectors/cured-meats.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_discovery/en/sectors/cured-meats.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_discovery/en/sectors/cured-meats.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_discovery/en/sectors/cured-meats.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_discovery/en/sectors/cured-meats.md
sed -i '' 's/site.tags/site.dimensions/g' ./_discovery/en/sectors/cured-meats.md
sed -i '' 's/page.tags/page.dimensions/g' ./_discovery/en/sectors/cured-meats.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_discovery/en/sectors/cured-meats.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_discovery/en/sectors/natural-beauty.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_discovery/en/sectors/natural-beauty.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_discovery/en/sectors/natural-beauty.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_discovery/en/sectors/natural-beauty.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_discovery/en/sectors/natural-beauty.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_discovery/en/sectors/natural-beauty.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_discovery/en/sectors/natural-beauty.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_discovery/en/sectors/natural-beauty.md
sed -i '' 's/site.tags/site.dimensions/g' ./_discovery/en/sectors/natural-beauty.md
sed -i '' 's/page.tags/page.dimensions/g' ./_discovery/en/sectors/natural-beauty.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_discovery/en/sectors/natural-beauty.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_discovery/en/sectors/jewelry-watches.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_discovery/en/sectors/jewelry-watches.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_discovery/en/sectors/jewelry-watches.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_discovery/en/sectors/jewelry-watches.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_discovery/en/sectors/jewelry-watches.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_discovery/en/sectors/jewelry-watches.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_discovery/en/sectors/jewelry-watches.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_discovery/en/sectors/jewelry-watches.md
sed -i '' 's/site.tags/site.dimensions/g' ./_discovery/en/sectors/jewelry-watches.md
sed -i '' 's/page.tags/page.dimensions/g' ./_discovery/en/sectors/jewelry-watches.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_discovery/en/sectors/jewelry-watches.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_discovery/en/sectors/artisan-confectionery.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_discovery/en/sectors/artisan-confectionery.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_discovery/en/sectors/artisan-confectionery.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_discovery/en/sectors/artisan-confectionery.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_discovery/en/sectors/artisan-confectionery.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_discovery/en/sectors/artisan-confectionery.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_discovery/en/sectors/artisan-confectionery.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_discovery/en/sectors/artisan-confectionery.md
sed -i '' 's/site.tags/site.dimensions/g' ./_discovery/en/sectors/artisan-confectionery.md
sed -i '' 's/page.tags/page.dimensions/g' ./_discovery/en/sectors/artisan-confectionery.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_discovery/en/sectors/artisan-confectionery.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_discovery/en/sectors/fashion-accessories.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_discovery/en/sectors/fashion-accessories.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_discovery/en/sectors/fashion-accessories.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_discovery/en/sectors/fashion-accessories.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_discovery/en/sectors/fashion-accessories.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_discovery/en/sectors/fashion-accessories.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_discovery/en/sectors/fashion-accessories.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_discovery/en/sectors/fashion-accessories.md
sed -i '' 's/site.tags/site.dimensions/g' ./_discovery/en/sectors/fashion-accessories.md
sed -i '' 's/page.tags/page.dimensions/g' ./_discovery/en/sectors/fashion-accessories.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_discovery/en/sectors/fashion-accessories.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_discovery/en/sectors/hotels-resorts.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_discovery/en/sectors/hotels-resorts.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_discovery/en/sectors/hotels-resorts.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_discovery/en/sectors/hotels-resorts.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_discovery/en/sectors/hotels-resorts.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_discovery/en/sectors/hotels-resorts.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_discovery/en/sectors/hotels-resorts.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_discovery/en/sectors/hotels-resorts.md
sed -i '' 's/site.tags/site.dimensions/g' ./_discovery/en/sectors/hotels-resorts.md
sed -i '' 's/page.tags/page.dimensions/g' ./_discovery/en/sectors/hotels-resorts.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_discovery/en/sectors/hotels-resorts.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_discovery/en/sectors/wine.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_discovery/en/sectors/wine.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_discovery/en/sectors/wine.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_discovery/en/sectors/wine.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_discovery/en/sectors/wine.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_discovery/en/sectors/wine.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_discovery/en/sectors/wine.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_discovery/en/sectors/wine.md
sed -i '' 's/site.tags/site.dimensions/g' ./_discovery/en/sectors/wine.md
sed -i '' 's/page.tags/page.dimensions/g' ./_discovery/en/sectors/wine.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_discovery/en/sectors/wine.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_discovery/en/signals/investment-ready.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_discovery/en/signals/investment-ready.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_discovery/en/signals/investment-ready.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_discovery/en/signals/investment-ready.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_discovery/en/signals/investment-ready.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_discovery/en/signals/investment-ready.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_discovery/en/signals/investment-ready.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_discovery/en/signals/investment-ready.md
sed -i '' 's/site.tags/site.dimensions/g' ./_discovery/en/signals/investment-ready.md
sed -i '' 's/page.tags/page.dimensions/g' ./_discovery/en/signals/investment-ready.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_discovery/en/signals/investment-ready.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_discovery/en/signals/export-ready.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_discovery/en/signals/export-ready.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_discovery/en/signals/export-ready.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_discovery/en/signals/export-ready.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_discovery/en/signals/export-ready.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_discovery/en/signals/export-ready.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_discovery/en/signals/export-ready.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_discovery/en/signals/export-ready.md
sed -i '' 's/site.tags/site.dimensions/g' ./_discovery/en/signals/export-ready.md
sed -i '' 's/page.tags/page.dimensions/g' ./_discovery/en/signals/export-ready.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_discovery/en/signals/export-ready.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_discovery/en/signals/franchise-ready.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_discovery/en/signals/franchise-ready.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_discovery/en/signals/franchise-ready.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_discovery/en/signals/franchise-ready.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_discovery/en/signals/franchise-ready.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_discovery/en/signals/franchise-ready.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_discovery/en/signals/franchise-ready.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_discovery/en/signals/franchise-ready.md
sed -i '' 's/site.tags/site.dimensions/g' ./_discovery/en/signals/franchise-ready.md
sed -i '' 's/page.tags/page.dimensions/g' ./_discovery/en/signals/franchise-ready.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_discovery/en/signals/franchise-ready.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_discovery/en/signals/rapid-growth.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_discovery/en/signals/rapid-growth.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_discovery/en/signals/rapid-growth.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_discovery/en/signals/rapid-growth.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_discovery/en/signals/rapid-growth.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_discovery/en/signals/rapid-growth.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_discovery/en/signals/rapid-growth.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_discovery/en/signals/rapid-growth.md
sed -i '' 's/site.tags/site.dimensions/g' ./_discovery/en/signals/rapid-growth.md
sed -i '' 's/page.tags/page.dimensions/g' ./_discovery/en/signals/rapid-growth.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_discovery/en/signals/rapid-growth.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_discovery/en/attributes/premium-positioning.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_discovery/en/attributes/premium-positioning.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_discovery/en/attributes/premium-positioning.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_discovery/en/attributes/premium-positioning.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_discovery/en/attributes/premium-positioning.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_discovery/en/attributes/premium-positioning.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_discovery/en/attributes/premium-positioning.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_discovery/en/attributes/premium-positioning.md
sed -i '' 's/site.tags/site.dimensions/g' ./_discovery/en/attributes/premium-positioning.md
sed -i '' 's/page.tags/page.dimensions/g' ./_discovery/en/attributes/premium-positioning.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_discovery/en/attributes/premium-positioning.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_discovery/en/attributes/innovation-leader.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_discovery/en/attributes/innovation-leader.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_discovery/en/attributes/innovation-leader.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_discovery/en/attributes/innovation-leader.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_discovery/en/attributes/innovation-leader.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_discovery/en/attributes/innovation-leader.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_discovery/en/attributes/innovation-leader.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_discovery/en/attributes/innovation-leader.md
sed -i '' 's/site.tags/site.dimensions/g' ./_discovery/en/attributes/innovation-leader.md
sed -i '' 's/page.tags/page.dimensions/g' ./_discovery/en/attributes/innovation-leader.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_discovery/en/attributes/innovation-leader.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_discovery/en/attributes/cultural-ambassador.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_discovery/en/attributes/cultural-ambassador.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_discovery/en/attributes/cultural-ambassador.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_discovery/en/attributes/cultural-ambassador.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_discovery/en/attributes/cultural-ambassador.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_discovery/en/attributes/cultural-ambassador.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_discovery/en/attributes/cultural-ambassador.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_discovery/en/attributes/cultural-ambassador.md
sed -i '' 's/site.tags/site.dimensions/g' ./_discovery/en/attributes/cultural-ambassador.md
sed -i '' 's/page.tags/page.dimensions/g' ./_discovery/en/attributes/cultural-ambassador.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_discovery/en/attributes/cultural-ambassador.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_discovery/en/attributes/artisanal-excellence.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_discovery/en/attributes/artisanal-excellence.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_discovery/en/attributes/artisanal-excellence.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_discovery/en/attributes/artisanal-excellence.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_discovery/en/attributes/artisanal-excellence.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_discovery/en/attributes/artisanal-excellence.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_discovery/en/attributes/artisanal-excellence.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_discovery/en/attributes/artisanal-excellence.md
sed -i '' 's/site.tags/site.dimensions/g' ./_discovery/en/attributes/artisanal-excellence.md
sed -i '' 's/page.tags/page.dimensions/g' ./_discovery/en/attributes/artisanal-excellence.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_discovery/en/attributes/artisanal-excellence.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_discovery/en/attributes/sustainability-pioneer.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_discovery/en/attributes/sustainability-pioneer.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_discovery/en/attributes/sustainability-pioneer.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_discovery/en/attributes/sustainability-pioneer.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_discovery/en/attributes/sustainability-pioneer.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_discovery/en/attributes/sustainability-pioneer.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_discovery/en/attributes/sustainability-pioneer.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_discovery/en/attributes/sustainability-pioneer.md
sed -i '' 's/site.tags/site.dimensions/g' ./_discovery/en/attributes/sustainability-pioneer.md
sed -i '' 's/page.tags/page.dimensions/g' ./_discovery/en/attributes/sustainability-pioneer.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_discovery/en/attributes/sustainability-pioneer.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_discovery/en/attributes/founder-led.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_discovery/en/attributes/founder-led.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_discovery/en/attributes/founder-led.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_discovery/en/attributes/founder-led.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_discovery/en/attributes/founder-led.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_discovery/en/attributes/founder-led.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_discovery/en/attributes/founder-led.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_discovery/en/attributes/founder-led.md
sed -i '' 's/site.tags/site.dimensions/g' ./_discovery/en/attributes/founder-led.md
sed -i '' 's/page.tags/page.dimensions/g' ./_discovery/en/attributes/founder-led.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_discovery/en/attributes/founder-led.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_discovery/en/attributes/regional-icon.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_discovery/en/attributes/regional-icon.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_discovery/en/attributes/regional-icon.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_discovery/en/attributes/regional-icon.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_discovery/en/attributes/regional-icon.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_discovery/en/attributes/regional-icon.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_discovery/en/attributes/regional-icon.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_discovery/en/attributes/regional-icon.md
sed -i '' 's/site.tags/site.dimensions/g' ./_discovery/en/attributes/regional-icon.md
sed -i '' 's/page.tags/page.dimensions/g' ./_discovery/en/attributes/regional-icon.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_discovery/en/attributes/regional-icon.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_discovery/en/attributes/heritage-brand.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_discovery/en/attributes/heritage-brand.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_discovery/en/attributes/heritage-brand.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_discovery/en/attributes/heritage-brand.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_discovery/en/attributes/heritage-brand.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_discovery/en/attributes/heritage-brand.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_discovery/en/attributes/heritage-brand.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_discovery/en/attributes/heritage-brand.md
sed -i '' 's/site.tags/site.dimensions/g' ./_discovery/en/attributes/heritage-brand.md
sed -i '' 's/page.tags/page.dimensions/g' ./_discovery/en/attributes/heritage-brand.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_discovery/en/attributes/heritage-brand.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_discovery/en/markets/china.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_discovery/en/markets/china.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_discovery/en/markets/china.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_discovery/en/markets/china.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_discovery/en/markets/china.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_discovery/en/markets/china.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_discovery/en/markets/china.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_discovery/en/markets/china.md
sed -i '' 's/site.tags/site.dimensions/g' ./_discovery/en/markets/china.md
sed -i '' 's/page.tags/page.dimensions/g' ./_discovery/en/markets/china.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_discovery/en/markets/china.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_discovery/en/markets/brazil.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_discovery/en/markets/brazil.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_discovery/en/markets/brazil.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_discovery/en/markets/brazil.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_discovery/en/markets/brazil.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_discovery/en/markets/brazil.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_discovery/en/markets/brazil.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_discovery/en/markets/brazil.md
sed -i '' 's/site.tags/site.dimensions/g' ./_discovery/en/markets/brazil.md
sed -i '' 's/page.tags/page.dimensions/g' ./_discovery/en/markets/brazil.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_discovery/en/markets/brazil.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_discovery/en/markets/south-africa.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_discovery/en/markets/south-africa.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_discovery/en/markets/south-africa.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_discovery/en/markets/south-africa.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_discovery/en/markets/south-africa.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_discovery/en/markets/south-africa.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_discovery/en/markets/south-africa.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_discovery/en/markets/south-africa.md
sed -i '' 's/site.tags/site.dimensions/g' ./_discovery/en/markets/south-africa.md
sed -i '' 's/page.tags/page.dimensions/g' ./_discovery/en/markets/south-africa.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_discovery/en/markets/south-africa.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_discovery/en/markets/india.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_discovery/en/markets/india.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_discovery/en/markets/india.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_discovery/en/markets/india.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_discovery/en/markets/india.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_discovery/en/markets/india.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_discovery/en/markets/india.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_discovery/en/markets/india.md
sed -i '' 's/site.tags/site.dimensions/g' ./_discovery/en/markets/india.md
sed -i '' 's/page.tags/page.dimensions/g' ./_discovery/en/markets/india.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_discovery/en/markets/india.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_discovery/en/markets/russia.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_discovery/en/markets/russia.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_discovery/en/markets/russia.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_discovery/en/markets/russia.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_discovery/en/markets/russia.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_discovery/en/markets/russia.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_discovery/en/markets/russia.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_discovery/en/markets/russia.md
sed -i '' 's/site.tags/site.dimensions/g' ./_discovery/en/markets/russia.md
sed -i '' 's/page.tags/page.dimensions/g' ./_discovery/en/markets/russia.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_discovery/en/markets/russia.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_dimensions/ru/sectors/natural-supplements.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_dimensions/ru/sectors/natural-supplements.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_dimensions/ru/sectors/natural-supplements.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_dimensions/ru/sectors/natural-supplements.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_dimensions/ru/sectors/natural-supplements.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_dimensions/ru/sectors/natural-supplements.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_dimensions/ru/sectors/natural-supplements.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_dimensions/ru/sectors/natural-supplements.md
sed -i '' 's/site.tags/site.dimensions/g' ./_dimensions/ru/sectors/natural-supplements.md
sed -i '' 's/page.tags/page.dimensions/g' ./_dimensions/ru/sectors/natural-supplements.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_dimensions/ru/sectors/natural-supplements.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_dimensions/ru/sectors/artisan-ceramics.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_dimensions/ru/sectors/artisan-ceramics.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_dimensions/ru/sectors/artisan-ceramics.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_dimensions/ru/sectors/artisan-ceramics.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_dimensions/ru/sectors/artisan-ceramics.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_dimensions/ru/sectors/artisan-ceramics.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_dimensions/ru/sectors/artisan-ceramics.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_dimensions/ru/sectors/artisan-ceramics.md
sed -i '' 's/site.tags/site.dimensions/g' ./_dimensions/ru/sectors/artisan-ceramics.md
sed -i '' 's/page.tags/page.dimensions/g' ./_dimensions/ru/sectors/artisan-ceramics.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_dimensions/ru/sectors/artisan-ceramics.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_dimensions/ru/sectors/gourmet-foods.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_dimensions/ru/sectors/gourmet-foods.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_dimensions/ru/sectors/gourmet-foods.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_dimensions/ru/sectors/gourmet-foods.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_dimensions/ru/sectors/gourmet-foods.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_dimensions/ru/sectors/gourmet-foods.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_dimensions/ru/sectors/gourmet-foods.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_dimensions/ru/sectors/gourmet-foods.md
sed -i '' 's/site.tags/site.dimensions/g' ./_dimensions/ru/sectors/gourmet-foods.md
sed -i '' 's/page.tags/page.dimensions/g' ./_dimensions/ru/sectors/gourmet-foods.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_dimensions/ru/sectors/gourmet-foods.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_dimensions/ru/sectors/fermented-dairy.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_dimensions/ru/sectors/fermented-dairy.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_dimensions/ru/sectors/fermented-dairy.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_dimensions/ru/sectors/fermented-dairy.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_dimensions/ru/sectors/fermented-dairy.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_dimensions/ru/sectors/fermented-dairy.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_dimensions/ru/sectors/fermented-dairy.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_dimensions/ru/sectors/fermented-dairy.md
sed -i '' 's/site.tags/site.dimensions/g' ./_dimensions/ru/sectors/fermented-dairy.md
sed -i '' 's/page.tags/page.dimensions/g' ./_dimensions/ru/sectors/fermented-dairy.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_dimensions/ru/sectors/fermented-dairy.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_dimensions/ru/sectors/honey-bee-products.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_dimensions/ru/sectors/honey-bee-products.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_dimensions/ru/sectors/honey-bee-products.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_dimensions/ru/sectors/honey-bee-products.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_dimensions/ru/sectors/honey-bee-products.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_dimensions/ru/sectors/honey-bee-products.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_dimensions/ru/sectors/honey-bee-products.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_dimensions/ru/sectors/honey-bee-products.md
sed -i '' 's/site.tags/site.dimensions/g' ./_dimensions/ru/sectors/honey-bee-products.md
sed -i '' 's/page.tags/page.dimensions/g' ./_dimensions/ru/sectors/honey-bee-products.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_dimensions/ru/sectors/honey-bee-products.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_dimensions/ru/sectors/artisanal-spirits.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_dimensions/ru/sectors/artisanal-spirits.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_dimensions/ru/sectors/artisanal-spirits.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_dimensions/ru/sectors/artisanal-spirits.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_dimensions/ru/sectors/artisanal-spirits.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_dimensions/ru/sectors/artisanal-spirits.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_dimensions/ru/sectors/artisanal-spirits.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_dimensions/ru/sectors/artisanal-spirits.md
sed -i '' 's/site.tags/site.dimensions/g' ./_dimensions/ru/sectors/artisanal-spirits.md
sed -i '' 's/page.tags/page.dimensions/g' ./_dimensions/ru/sectors/artisanal-spirits.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_dimensions/ru/sectors/artisanal-spirits.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_dimensions/ru/sectors/specialty-cheeses.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_dimensions/ru/sectors/specialty-cheeses.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_dimensions/ru/sectors/specialty-cheeses.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_dimensions/ru/sectors/specialty-cheeses.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_dimensions/ru/sectors/specialty-cheeses.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_dimensions/ru/sectors/specialty-cheeses.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_dimensions/ru/sectors/specialty-cheeses.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_dimensions/ru/sectors/specialty-cheeses.md
sed -i '' 's/site.tags/site.dimensions/g' ./_dimensions/ru/sectors/specialty-cheeses.md
sed -i '' 's/page.tags/page.dimensions/g' ./_dimensions/ru/sectors/specialty-cheeses.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_dimensions/ru/sectors/specialty-cheeses.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_dimensions/ru/sectors/mineral-waters.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_dimensions/ru/sectors/mineral-waters.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_dimensions/ru/sectors/mineral-waters.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_dimensions/ru/sectors/mineral-waters.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_dimensions/ru/sectors/mineral-waters.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_dimensions/ru/sectors/mineral-waters.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_dimensions/ru/sectors/mineral-waters.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_dimensions/ru/sectors/mineral-waters.md
sed -i '' 's/site.tags/site.dimensions/g' ./_dimensions/ru/sectors/mineral-waters.md
sed -i '' 's/page.tags/page.dimensions/g' ./_dimensions/ru/sectors/mineral-waters.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_dimensions/ru/sectors/mineral-waters.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_dimensions/ru/sectors/cured-meats.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_dimensions/ru/sectors/cured-meats.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_dimensions/ru/sectors/cured-meats.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_dimensions/ru/sectors/cured-meats.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_dimensions/ru/sectors/cured-meats.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_dimensions/ru/sectors/cured-meats.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_dimensions/ru/sectors/cured-meats.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_dimensions/ru/sectors/cured-meats.md
sed -i '' 's/site.tags/site.dimensions/g' ./_dimensions/ru/sectors/cured-meats.md
sed -i '' 's/page.tags/page.dimensions/g' ./_dimensions/ru/sectors/cured-meats.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_dimensions/ru/sectors/cured-meats.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_dimensions/ru/sectors/natural-beauty.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_dimensions/ru/sectors/natural-beauty.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_dimensions/ru/sectors/natural-beauty.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_dimensions/ru/sectors/natural-beauty.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_dimensions/ru/sectors/natural-beauty.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_dimensions/ru/sectors/natural-beauty.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_dimensions/ru/sectors/natural-beauty.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_dimensions/ru/sectors/natural-beauty.md
sed -i '' 's/site.tags/site.dimensions/g' ./_dimensions/ru/sectors/natural-beauty.md
sed -i '' 's/page.tags/page.dimensions/g' ./_dimensions/ru/sectors/natural-beauty.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_dimensions/ru/sectors/natural-beauty.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_dimensions/ru/sectors/jewelry-watches.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_dimensions/ru/sectors/jewelry-watches.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_dimensions/ru/sectors/jewelry-watches.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_dimensions/ru/sectors/jewelry-watches.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_dimensions/ru/sectors/jewelry-watches.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_dimensions/ru/sectors/jewelry-watches.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_dimensions/ru/sectors/jewelry-watches.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_dimensions/ru/sectors/jewelry-watches.md
sed -i '' 's/site.tags/site.dimensions/g' ./_dimensions/ru/sectors/jewelry-watches.md
sed -i '' 's/page.tags/page.dimensions/g' ./_dimensions/ru/sectors/jewelry-watches.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_dimensions/ru/sectors/jewelry-watches.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_dimensions/ru/sectors/artisan-confectionery.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_dimensions/ru/sectors/artisan-confectionery.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_dimensions/ru/sectors/artisan-confectionery.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_dimensions/ru/sectors/artisan-confectionery.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_dimensions/ru/sectors/artisan-confectionery.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_dimensions/ru/sectors/artisan-confectionery.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_dimensions/ru/sectors/artisan-confectionery.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_dimensions/ru/sectors/artisan-confectionery.md
sed -i '' 's/site.tags/site.dimensions/g' ./_dimensions/ru/sectors/artisan-confectionery.md
sed -i '' 's/page.tags/page.dimensions/g' ./_dimensions/ru/sectors/artisan-confectionery.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_dimensions/ru/sectors/artisan-confectionery.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_dimensions/ru/sectors/fashion-accessories.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_dimensions/ru/sectors/fashion-accessories.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_dimensions/ru/sectors/fashion-accessories.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_dimensions/ru/sectors/fashion-accessories.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_dimensions/ru/sectors/fashion-accessories.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_dimensions/ru/sectors/fashion-accessories.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_dimensions/ru/sectors/fashion-accessories.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_dimensions/ru/sectors/fashion-accessories.md
sed -i '' 's/site.tags/site.dimensions/g' ./_dimensions/ru/sectors/fashion-accessories.md
sed -i '' 's/page.tags/page.dimensions/g' ./_dimensions/ru/sectors/fashion-accessories.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_dimensions/ru/sectors/fashion-accessories.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_dimensions/ru/sectors/halal-foods.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_dimensions/ru/sectors/halal-foods.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_dimensions/ru/sectors/halal-foods.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_dimensions/ru/sectors/halal-foods.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_dimensions/ru/sectors/halal-foods.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_dimensions/ru/sectors/halal-foods.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_dimensions/ru/sectors/halal-foods.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_dimensions/ru/sectors/halal-foods.md
sed -i '' 's/site.tags/site.dimensions/g' ./_dimensions/ru/sectors/halal-foods.md
sed -i '' 's/page.tags/page.dimensions/g' ./_dimensions/ru/sectors/halal-foods.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_dimensions/ru/sectors/halal-foods.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_dimensions/ru/sectors/hotels-resorts.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_dimensions/ru/sectors/hotels-resorts.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_dimensions/ru/sectors/hotels-resorts.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_dimensions/ru/sectors/hotels-resorts.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_dimensions/ru/sectors/hotels-resorts.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_dimensions/ru/sectors/hotels-resorts.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_dimensions/ru/sectors/hotels-resorts.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_dimensions/ru/sectors/hotels-resorts.md
sed -i '' 's/site.tags/site.dimensions/g' ./_dimensions/ru/sectors/hotels-resorts.md
sed -i '' 's/page.tags/page.dimensions/g' ./_dimensions/ru/sectors/hotels-resorts.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_dimensions/ru/sectors/hotels-resorts.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_dimensions/ru/sectors/wine.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_dimensions/ru/sectors/wine.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_dimensions/ru/sectors/wine.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_dimensions/ru/sectors/wine.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_dimensions/ru/sectors/wine.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_dimensions/ru/sectors/wine.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_dimensions/ru/sectors/wine.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_dimensions/ru/sectors/wine.md
sed -i '' 's/site.tags/site.dimensions/g' ./_dimensions/ru/sectors/wine.md
sed -i '' 's/page.tags/page.dimensions/g' ./_dimensions/ru/sectors/wine.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_dimensions/ru/sectors/wine.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_dimensions/ru/signals/investment-ready.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_dimensions/ru/signals/investment-ready.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_dimensions/ru/signals/investment-ready.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_dimensions/ru/signals/investment-ready.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_dimensions/ru/signals/investment-ready.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_dimensions/ru/signals/investment-ready.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_dimensions/ru/signals/investment-ready.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_dimensions/ru/signals/investment-ready.md
sed -i '' 's/site.tags/site.dimensions/g' ./_dimensions/ru/signals/investment-ready.md
sed -i '' 's/page.tags/page.dimensions/g' ./_dimensions/ru/signals/investment-ready.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_dimensions/ru/signals/investment-ready.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_dimensions/ru/signals/export-ready.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_dimensions/ru/signals/export-ready.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_dimensions/ru/signals/export-ready.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_dimensions/ru/signals/export-ready.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_dimensions/ru/signals/export-ready.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_dimensions/ru/signals/export-ready.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_dimensions/ru/signals/export-ready.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_dimensions/ru/signals/export-ready.md
sed -i '' 's/site.tags/site.dimensions/g' ./_dimensions/ru/signals/export-ready.md
sed -i '' 's/page.tags/page.dimensions/g' ./_dimensions/ru/signals/export-ready.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_dimensions/ru/signals/export-ready.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_dimensions/ru/signals/franchise-ready.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_dimensions/ru/signals/franchise-ready.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_dimensions/ru/signals/franchise-ready.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_dimensions/ru/signals/franchise-ready.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_dimensions/ru/signals/franchise-ready.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_dimensions/ru/signals/franchise-ready.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_dimensions/ru/signals/franchise-ready.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_dimensions/ru/signals/franchise-ready.md
sed -i '' 's/site.tags/site.dimensions/g' ./_dimensions/ru/signals/franchise-ready.md
sed -i '' 's/page.tags/page.dimensions/g' ./_dimensions/ru/signals/franchise-ready.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_dimensions/ru/signals/franchise-ready.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_dimensions/ru/signals/rapid-growth.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_dimensions/ru/signals/rapid-growth.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_dimensions/ru/signals/rapid-growth.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_dimensions/ru/signals/rapid-growth.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_dimensions/ru/signals/rapid-growth.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_dimensions/ru/signals/rapid-growth.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_dimensions/ru/signals/rapid-growth.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_dimensions/ru/signals/rapid-growth.md
sed -i '' 's/site.tags/site.dimensions/g' ./_dimensions/ru/signals/rapid-growth.md
sed -i '' 's/page.tags/page.dimensions/g' ./_dimensions/ru/signals/rapid-growth.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_dimensions/ru/signals/rapid-growth.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_dimensions/ru/attributes/premium-positioning.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_dimensions/ru/attributes/premium-positioning.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_dimensions/ru/attributes/premium-positioning.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_dimensions/ru/attributes/premium-positioning.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_dimensions/ru/attributes/premium-positioning.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_dimensions/ru/attributes/premium-positioning.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_dimensions/ru/attributes/premium-positioning.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_dimensions/ru/attributes/premium-positioning.md
sed -i '' 's/site.tags/site.dimensions/g' ./_dimensions/ru/attributes/premium-positioning.md
sed -i '' 's/page.tags/page.dimensions/g' ./_dimensions/ru/attributes/premium-positioning.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_dimensions/ru/attributes/premium-positioning.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_dimensions/ru/attributes/innovation-leader.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_dimensions/ru/attributes/innovation-leader.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_dimensions/ru/attributes/innovation-leader.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_dimensions/ru/attributes/innovation-leader.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_dimensions/ru/attributes/innovation-leader.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_dimensions/ru/attributes/innovation-leader.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_dimensions/ru/attributes/innovation-leader.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_dimensions/ru/attributes/innovation-leader.md
sed -i '' 's/site.tags/site.dimensions/g' ./_dimensions/ru/attributes/innovation-leader.md
sed -i '' 's/page.tags/page.dimensions/g' ./_dimensions/ru/attributes/innovation-leader.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_dimensions/ru/attributes/innovation-leader.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_dimensions/ru/attributes/cultural-ambassador.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_dimensions/ru/attributes/cultural-ambassador.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_dimensions/ru/attributes/cultural-ambassador.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_dimensions/ru/attributes/cultural-ambassador.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_dimensions/ru/attributes/cultural-ambassador.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_dimensions/ru/attributes/cultural-ambassador.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_dimensions/ru/attributes/cultural-ambassador.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_dimensions/ru/attributes/cultural-ambassador.md
sed -i '' 's/site.tags/site.dimensions/g' ./_dimensions/ru/attributes/cultural-ambassador.md
sed -i '' 's/page.tags/page.dimensions/g' ./_dimensions/ru/attributes/cultural-ambassador.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_dimensions/ru/attributes/cultural-ambassador.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_dimensions/ru/attributes/artisanal-excellence.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_dimensions/ru/attributes/artisanal-excellence.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_dimensions/ru/attributes/artisanal-excellence.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_dimensions/ru/attributes/artisanal-excellence.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_dimensions/ru/attributes/artisanal-excellence.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_dimensions/ru/attributes/artisanal-excellence.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_dimensions/ru/attributes/artisanal-excellence.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_dimensions/ru/attributes/artisanal-excellence.md
sed -i '' 's/site.tags/site.dimensions/g' ./_dimensions/ru/attributes/artisanal-excellence.md
sed -i '' 's/page.tags/page.dimensions/g' ./_dimensions/ru/attributes/artisanal-excellence.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_dimensions/ru/attributes/artisanal-excellence.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_dimensions/ru/attributes/sustainability-pioneer.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_dimensions/ru/attributes/sustainability-pioneer.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_dimensions/ru/attributes/sustainability-pioneer.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_dimensions/ru/attributes/sustainability-pioneer.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_dimensions/ru/attributes/sustainability-pioneer.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_dimensions/ru/attributes/sustainability-pioneer.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_dimensions/ru/attributes/sustainability-pioneer.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_dimensions/ru/attributes/sustainability-pioneer.md
sed -i '' 's/site.tags/site.dimensions/g' ./_dimensions/ru/attributes/sustainability-pioneer.md
sed -i '' 's/page.tags/page.dimensions/g' ./_dimensions/ru/attributes/sustainability-pioneer.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_dimensions/ru/attributes/sustainability-pioneer.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_dimensions/ru/attributes/founder-led.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_dimensions/ru/attributes/founder-led.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_dimensions/ru/attributes/founder-led.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_dimensions/ru/attributes/founder-led.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_dimensions/ru/attributes/founder-led.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_dimensions/ru/attributes/founder-led.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_dimensions/ru/attributes/founder-led.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_dimensions/ru/attributes/founder-led.md
sed -i '' 's/site.tags/site.dimensions/g' ./_dimensions/ru/attributes/founder-led.md
sed -i '' 's/page.tags/page.dimensions/g' ./_dimensions/ru/attributes/founder-led.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_dimensions/ru/attributes/founder-led.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_dimensions/ru/attributes/regional-icon.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_dimensions/ru/attributes/regional-icon.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_dimensions/ru/attributes/regional-icon.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_dimensions/ru/attributes/regional-icon.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_dimensions/ru/attributes/regional-icon.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_dimensions/ru/attributes/regional-icon.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_dimensions/ru/attributes/regional-icon.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_dimensions/ru/attributes/regional-icon.md
sed -i '' 's/site.tags/site.dimensions/g' ./_dimensions/ru/attributes/regional-icon.md
sed -i '' 's/page.tags/page.dimensions/g' ./_dimensions/ru/attributes/regional-icon.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_dimensions/ru/attributes/regional-icon.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_dimensions/ru/attributes/heritage-brand.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_dimensions/ru/attributes/heritage-brand.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_dimensions/ru/attributes/heritage-brand.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_dimensions/ru/attributes/heritage-brand.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_dimensions/ru/attributes/heritage-brand.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_dimensions/ru/attributes/heritage-brand.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_dimensions/ru/attributes/heritage-brand.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_dimensions/ru/attributes/heritage-brand.md
sed -i '' 's/site.tags/site.dimensions/g' ./_dimensions/ru/attributes/heritage-brand.md
sed -i '' 's/page.tags/page.dimensions/g' ./_dimensions/ru/attributes/heritage-brand.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_dimensions/ru/attributes/heritage-brand.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_dimensions/ru/markets/china.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_dimensions/ru/markets/china.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_dimensions/ru/markets/china.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_dimensions/ru/markets/china.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_dimensions/ru/markets/china.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_dimensions/ru/markets/china.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_dimensions/ru/markets/china.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_dimensions/ru/markets/china.md
sed -i '' 's/site.tags/site.dimensions/g' ./_dimensions/ru/markets/china.md
sed -i '' 's/page.tags/page.dimensions/g' ./_dimensions/ru/markets/china.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_dimensions/ru/markets/china.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_dimensions/ru/markets/brazil.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_dimensions/ru/markets/brazil.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_dimensions/ru/markets/brazil.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_dimensions/ru/markets/brazil.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_dimensions/ru/markets/brazil.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_dimensions/ru/markets/brazil.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_dimensions/ru/markets/brazil.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_dimensions/ru/markets/brazil.md
sed -i '' 's/site.tags/site.dimensions/g' ./_dimensions/ru/markets/brazil.md
sed -i '' 's/page.tags/page.dimensions/g' ./_dimensions/ru/markets/brazil.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_dimensions/ru/markets/brazil.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_dimensions/ru/markets/south-africa.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_dimensions/ru/markets/south-africa.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_dimensions/ru/markets/south-africa.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_dimensions/ru/markets/south-africa.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_dimensions/ru/markets/south-africa.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_dimensions/ru/markets/south-africa.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_dimensions/ru/markets/south-africa.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_dimensions/ru/markets/south-africa.md
sed -i '' 's/site.tags/site.dimensions/g' ./_dimensions/ru/markets/south-africa.md
sed -i '' 's/page.tags/page.dimensions/g' ./_dimensions/ru/markets/south-africa.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_dimensions/ru/markets/south-africa.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_dimensions/ru/markets/india.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_dimensions/ru/markets/india.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_dimensions/ru/markets/india.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_dimensions/ru/markets/india.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_dimensions/ru/markets/india.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_dimensions/ru/markets/india.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_dimensions/ru/markets/india.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_dimensions/ru/markets/india.md
sed -i '' 's/site.tags/site.dimensions/g' ./_dimensions/ru/markets/india.md
sed -i '' 's/page.tags/page.dimensions/g' ./_dimensions/ru/markets/india.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_dimensions/ru/markets/india.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_dimensions/ru/markets/russia.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_dimensions/ru/markets/russia.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_dimensions/ru/markets/russia.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_dimensions/ru/markets/russia.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_dimensions/ru/markets/russia.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_dimensions/ru/markets/russia.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_dimensions/ru/markets/russia.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_dimensions/ru/markets/russia.md
sed -i '' 's/site.tags/site.dimensions/g' ./_dimensions/ru/markets/russia.md
sed -i '' 's/page.tags/page.dimensions/g' ./_dimensions/ru/markets/russia.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_dimensions/ru/markets/russia.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_dimensions/zh/sectors/natural-supplements.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_dimensions/zh/sectors/natural-supplements.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_dimensions/zh/sectors/natural-supplements.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_dimensions/zh/sectors/natural-supplements.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_dimensions/zh/sectors/natural-supplements.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_dimensions/zh/sectors/natural-supplements.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_dimensions/zh/sectors/natural-supplements.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_dimensions/zh/sectors/natural-supplements.md
sed -i '' 's/site.tags/site.dimensions/g' ./_dimensions/zh/sectors/natural-supplements.md
sed -i '' 's/page.tags/page.dimensions/g' ./_dimensions/zh/sectors/natural-supplements.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_dimensions/zh/sectors/natural-supplements.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_dimensions/zh/sectors/artisan-ceramics.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_dimensions/zh/sectors/artisan-ceramics.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_dimensions/zh/sectors/artisan-ceramics.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_dimensions/zh/sectors/artisan-ceramics.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_dimensions/zh/sectors/artisan-ceramics.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_dimensions/zh/sectors/artisan-ceramics.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_dimensions/zh/sectors/artisan-ceramics.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_dimensions/zh/sectors/artisan-ceramics.md
sed -i '' 's/site.tags/site.dimensions/g' ./_dimensions/zh/sectors/artisan-ceramics.md
sed -i '' 's/page.tags/page.dimensions/g' ./_dimensions/zh/sectors/artisan-ceramics.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_dimensions/zh/sectors/artisan-ceramics.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_dimensions/zh/sectors/gourmet-foods.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_dimensions/zh/sectors/gourmet-foods.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_dimensions/zh/sectors/gourmet-foods.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_dimensions/zh/sectors/gourmet-foods.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_dimensions/zh/sectors/gourmet-foods.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_dimensions/zh/sectors/gourmet-foods.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_dimensions/zh/sectors/gourmet-foods.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_dimensions/zh/sectors/gourmet-foods.md
sed -i '' 's/site.tags/site.dimensions/g' ./_dimensions/zh/sectors/gourmet-foods.md
sed -i '' 's/page.tags/page.dimensions/g' ./_dimensions/zh/sectors/gourmet-foods.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_dimensions/zh/sectors/gourmet-foods.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_dimensions/zh/sectors/fermented-dairy.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_dimensions/zh/sectors/fermented-dairy.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_dimensions/zh/sectors/fermented-dairy.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_dimensions/zh/sectors/fermented-dairy.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_dimensions/zh/sectors/fermented-dairy.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_dimensions/zh/sectors/fermented-dairy.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_dimensions/zh/sectors/fermented-dairy.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_dimensions/zh/sectors/fermented-dairy.md
sed -i '' 's/site.tags/site.dimensions/g' ./_dimensions/zh/sectors/fermented-dairy.md
sed -i '' 's/page.tags/page.dimensions/g' ./_dimensions/zh/sectors/fermented-dairy.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_dimensions/zh/sectors/fermented-dairy.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_dimensions/zh/sectors/honey-bee-products.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_dimensions/zh/sectors/honey-bee-products.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_dimensions/zh/sectors/honey-bee-products.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_dimensions/zh/sectors/honey-bee-products.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_dimensions/zh/sectors/honey-bee-products.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_dimensions/zh/sectors/honey-bee-products.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_dimensions/zh/sectors/honey-bee-products.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_dimensions/zh/sectors/honey-bee-products.md
sed -i '' 's/site.tags/site.dimensions/g' ./_dimensions/zh/sectors/honey-bee-products.md
sed -i '' 's/page.tags/page.dimensions/g' ./_dimensions/zh/sectors/honey-bee-products.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_dimensions/zh/sectors/honey-bee-products.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_dimensions/zh/sectors/artisanal-spirits.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_dimensions/zh/sectors/artisanal-spirits.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_dimensions/zh/sectors/artisanal-spirits.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_dimensions/zh/sectors/artisanal-spirits.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_dimensions/zh/sectors/artisanal-spirits.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_dimensions/zh/sectors/artisanal-spirits.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_dimensions/zh/sectors/artisanal-spirits.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_dimensions/zh/sectors/artisanal-spirits.md
sed -i '' 's/site.tags/site.dimensions/g' ./_dimensions/zh/sectors/artisanal-spirits.md
sed -i '' 's/page.tags/page.dimensions/g' ./_dimensions/zh/sectors/artisanal-spirits.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_dimensions/zh/sectors/artisanal-spirits.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_dimensions/zh/sectors/specialty-cheeses.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_dimensions/zh/sectors/specialty-cheeses.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_dimensions/zh/sectors/specialty-cheeses.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_dimensions/zh/sectors/specialty-cheeses.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_dimensions/zh/sectors/specialty-cheeses.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_dimensions/zh/sectors/specialty-cheeses.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_dimensions/zh/sectors/specialty-cheeses.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_dimensions/zh/sectors/specialty-cheeses.md
sed -i '' 's/site.tags/site.dimensions/g' ./_dimensions/zh/sectors/specialty-cheeses.md
sed -i '' 's/page.tags/page.dimensions/g' ./_dimensions/zh/sectors/specialty-cheeses.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_dimensions/zh/sectors/specialty-cheeses.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_dimensions/zh/sectors/mineral-waters.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_dimensions/zh/sectors/mineral-waters.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_dimensions/zh/sectors/mineral-waters.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_dimensions/zh/sectors/mineral-waters.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_dimensions/zh/sectors/mineral-waters.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_dimensions/zh/sectors/mineral-waters.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_dimensions/zh/sectors/mineral-waters.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_dimensions/zh/sectors/mineral-waters.md
sed -i '' 's/site.tags/site.dimensions/g' ./_dimensions/zh/sectors/mineral-waters.md
sed -i '' 's/page.tags/page.dimensions/g' ./_dimensions/zh/sectors/mineral-waters.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_dimensions/zh/sectors/mineral-waters.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_dimensions/zh/sectors/cured-meats.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_dimensions/zh/sectors/cured-meats.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_dimensions/zh/sectors/cured-meats.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_dimensions/zh/sectors/cured-meats.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_dimensions/zh/sectors/cured-meats.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_dimensions/zh/sectors/cured-meats.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_dimensions/zh/sectors/cured-meats.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_dimensions/zh/sectors/cured-meats.md
sed -i '' 's/site.tags/site.dimensions/g' ./_dimensions/zh/sectors/cured-meats.md
sed -i '' 's/page.tags/page.dimensions/g' ./_dimensions/zh/sectors/cured-meats.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_dimensions/zh/sectors/cured-meats.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_dimensions/zh/sectors/natural-beauty.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_dimensions/zh/sectors/natural-beauty.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_dimensions/zh/sectors/natural-beauty.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_dimensions/zh/sectors/natural-beauty.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_dimensions/zh/sectors/natural-beauty.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_dimensions/zh/sectors/natural-beauty.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_dimensions/zh/sectors/natural-beauty.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_dimensions/zh/sectors/natural-beauty.md
sed -i '' 's/site.tags/site.dimensions/g' ./_dimensions/zh/sectors/natural-beauty.md
sed -i '' 's/page.tags/page.dimensions/g' ./_dimensions/zh/sectors/natural-beauty.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_dimensions/zh/sectors/natural-beauty.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_dimensions/zh/sectors/jewelry-watches.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_dimensions/zh/sectors/jewelry-watches.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_dimensions/zh/sectors/jewelry-watches.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_dimensions/zh/sectors/jewelry-watches.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_dimensions/zh/sectors/jewelry-watches.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_dimensions/zh/sectors/jewelry-watches.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_dimensions/zh/sectors/jewelry-watches.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_dimensions/zh/sectors/jewelry-watches.md
sed -i '' 's/site.tags/site.dimensions/g' ./_dimensions/zh/sectors/jewelry-watches.md
sed -i '' 's/page.tags/page.dimensions/g' ./_dimensions/zh/sectors/jewelry-watches.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_dimensions/zh/sectors/jewelry-watches.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_dimensions/zh/sectors/artisan-confectionery.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_dimensions/zh/sectors/artisan-confectionery.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_dimensions/zh/sectors/artisan-confectionery.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_dimensions/zh/sectors/artisan-confectionery.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_dimensions/zh/sectors/artisan-confectionery.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_dimensions/zh/sectors/artisan-confectionery.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_dimensions/zh/sectors/artisan-confectionery.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_dimensions/zh/sectors/artisan-confectionery.md
sed -i '' 's/site.tags/site.dimensions/g' ./_dimensions/zh/sectors/artisan-confectionery.md
sed -i '' 's/page.tags/page.dimensions/g' ./_dimensions/zh/sectors/artisan-confectionery.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_dimensions/zh/sectors/artisan-confectionery.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_dimensions/zh/sectors/fashion-accessories.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_dimensions/zh/sectors/fashion-accessories.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_dimensions/zh/sectors/fashion-accessories.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_dimensions/zh/sectors/fashion-accessories.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_dimensions/zh/sectors/fashion-accessories.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_dimensions/zh/sectors/fashion-accessories.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_dimensions/zh/sectors/fashion-accessories.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_dimensions/zh/sectors/fashion-accessories.md
sed -i '' 's/site.tags/site.dimensions/g' ./_dimensions/zh/sectors/fashion-accessories.md
sed -i '' 's/page.tags/page.dimensions/g' ./_dimensions/zh/sectors/fashion-accessories.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_dimensions/zh/sectors/fashion-accessories.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_dimensions/zh/sectors/halal-foods.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_dimensions/zh/sectors/halal-foods.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_dimensions/zh/sectors/halal-foods.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_dimensions/zh/sectors/halal-foods.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_dimensions/zh/sectors/halal-foods.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_dimensions/zh/sectors/halal-foods.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_dimensions/zh/sectors/halal-foods.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_dimensions/zh/sectors/halal-foods.md
sed -i '' 's/site.tags/site.dimensions/g' ./_dimensions/zh/sectors/halal-foods.md
sed -i '' 's/page.tags/page.dimensions/g' ./_dimensions/zh/sectors/halal-foods.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_dimensions/zh/sectors/halal-foods.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_dimensions/zh/sectors/hotels-resorts.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_dimensions/zh/sectors/hotels-resorts.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_dimensions/zh/sectors/hotels-resorts.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_dimensions/zh/sectors/hotels-resorts.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_dimensions/zh/sectors/hotels-resorts.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_dimensions/zh/sectors/hotels-resorts.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_dimensions/zh/sectors/hotels-resorts.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_dimensions/zh/sectors/hotels-resorts.md
sed -i '' 's/site.tags/site.dimensions/g' ./_dimensions/zh/sectors/hotels-resorts.md
sed -i '' 's/page.tags/page.dimensions/g' ./_dimensions/zh/sectors/hotels-resorts.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_dimensions/zh/sectors/hotels-resorts.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_dimensions/zh/sectors/wine.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_dimensions/zh/sectors/wine.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_dimensions/zh/sectors/wine.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_dimensions/zh/sectors/wine.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_dimensions/zh/sectors/wine.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_dimensions/zh/sectors/wine.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_dimensions/zh/sectors/wine.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_dimensions/zh/sectors/wine.md
sed -i '' 's/site.tags/site.dimensions/g' ./_dimensions/zh/sectors/wine.md
sed -i '' 's/page.tags/page.dimensions/g' ./_dimensions/zh/sectors/wine.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_dimensions/zh/sectors/wine.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_dimensions/zh/signals/investment-ready.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_dimensions/zh/signals/investment-ready.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_dimensions/zh/signals/investment-ready.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_dimensions/zh/signals/investment-ready.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_dimensions/zh/signals/investment-ready.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_dimensions/zh/signals/investment-ready.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_dimensions/zh/signals/investment-ready.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_dimensions/zh/signals/investment-ready.md
sed -i '' 's/site.tags/site.dimensions/g' ./_dimensions/zh/signals/investment-ready.md
sed -i '' 's/page.tags/page.dimensions/g' ./_dimensions/zh/signals/investment-ready.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_dimensions/zh/signals/investment-ready.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_dimensions/zh/signals/export-ready.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_dimensions/zh/signals/export-ready.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_dimensions/zh/signals/export-ready.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_dimensions/zh/signals/export-ready.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_dimensions/zh/signals/export-ready.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_dimensions/zh/signals/export-ready.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_dimensions/zh/signals/export-ready.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_dimensions/zh/signals/export-ready.md
sed -i '' 's/site.tags/site.dimensions/g' ./_dimensions/zh/signals/export-ready.md
sed -i '' 's/page.tags/page.dimensions/g' ./_dimensions/zh/signals/export-ready.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_dimensions/zh/signals/export-ready.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_dimensions/zh/signals/franchise-ready.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_dimensions/zh/signals/franchise-ready.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_dimensions/zh/signals/franchise-ready.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_dimensions/zh/signals/franchise-ready.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_dimensions/zh/signals/franchise-ready.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_dimensions/zh/signals/franchise-ready.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_dimensions/zh/signals/franchise-ready.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_dimensions/zh/signals/franchise-ready.md
sed -i '' 's/site.tags/site.dimensions/g' ./_dimensions/zh/signals/franchise-ready.md
sed -i '' 's/page.tags/page.dimensions/g' ./_dimensions/zh/signals/franchise-ready.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_dimensions/zh/signals/franchise-ready.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_dimensions/zh/signals/rapid-growth.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_dimensions/zh/signals/rapid-growth.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_dimensions/zh/signals/rapid-growth.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_dimensions/zh/signals/rapid-growth.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_dimensions/zh/signals/rapid-growth.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_dimensions/zh/signals/rapid-growth.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_dimensions/zh/signals/rapid-growth.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_dimensions/zh/signals/rapid-growth.md
sed -i '' 's/site.tags/site.dimensions/g' ./_dimensions/zh/signals/rapid-growth.md
sed -i '' 's/page.tags/page.dimensions/g' ./_dimensions/zh/signals/rapid-growth.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_dimensions/zh/signals/rapid-growth.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_dimensions/zh/attributes/premium-positioning.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_dimensions/zh/attributes/premium-positioning.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_dimensions/zh/attributes/premium-positioning.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_dimensions/zh/attributes/premium-positioning.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_dimensions/zh/attributes/premium-positioning.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_dimensions/zh/attributes/premium-positioning.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_dimensions/zh/attributes/premium-positioning.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_dimensions/zh/attributes/premium-positioning.md
sed -i '' 's/site.tags/site.dimensions/g' ./_dimensions/zh/attributes/premium-positioning.md
sed -i '' 's/page.tags/page.dimensions/g' ./_dimensions/zh/attributes/premium-positioning.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_dimensions/zh/attributes/premium-positioning.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_dimensions/zh/attributes/innovation-leader.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_dimensions/zh/attributes/innovation-leader.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_dimensions/zh/attributes/innovation-leader.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_dimensions/zh/attributes/innovation-leader.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_dimensions/zh/attributes/innovation-leader.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_dimensions/zh/attributes/innovation-leader.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_dimensions/zh/attributes/innovation-leader.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_dimensions/zh/attributes/innovation-leader.md
sed -i '' 's/site.tags/site.dimensions/g' ./_dimensions/zh/attributes/innovation-leader.md
sed -i '' 's/page.tags/page.dimensions/g' ./_dimensions/zh/attributes/innovation-leader.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_dimensions/zh/attributes/innovation-leader.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_dimensions/zh/attributes/cultural-ambassador.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_dimensions/zh/attributes/cultural-ambassador.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_dimensions/zh/attributes/cultural-ambassador.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_dimensions/zh/attributes/cultural-ambassador.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_dimensions/zh/attributes/cultural-ambassador.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_dimensions/zh/attributes/cultural-ambassador.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_dimensions/zh/attributes/cultural-ambassador.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_dimensions/zh/attributes/cultural-ambassador.md
sed -i '' 's/site.tags/site.dimensions/g' ./_dimensions/zh/attributes/cultural-ambassador.md
sed -i '' 's/page.tags/page.dimensions/g' ./_dimensions/zh/attributes/cultural-ambassador.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_dimensions/zh/attributes/cultural-ambassador.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_dimensions/zh/attributes/artisanal-excellence.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_dimensions/zh/attributes/artisanal-excellence.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_dimensions/zh/attributes/artisanal-excellence.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_dimensions/zh/attributes/artisanal-excellence.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_dimensions/zh/attributes/artisanal-excellence.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_dimensions/zh/attributes/artisanal-excellence.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_dimensions/zh/attributes/artisanal-excellence.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_dimensions/zh/attributes/artisanal-excellence.md
sed -i '' 's/site.tags/site.dimensions/g' ./_dimensions/zh/attributes/artisanal-excellence.md
sed -i '' 's/page.tags/page.dimensions/g' ./_dimensions/zh/attributes/artisanal-excellence.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_dimensions/zh/attributes/artisanal-excellence.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_dimensions/zh/attributes/sustainability-pioneer.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_dimensions/zh/attributes/sustainability-pioneer.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_dimensions/zh/attributes/sustainability-pioneer.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_dimensions/zh/attributes/sustainability-pioneer.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_dimensions/zh/attributes/sustainability-pioneer.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_dimensions/zh/attributes/sustainability-pioneer.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_dimensions/zh/attributes/sustainability-pioneer.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_dimensions/zh/attributes/sustainability-pioneer.md
sed -i '' 's/site.tags/site.dimensions/g' ./_dimensions/zh/attributes/sustainability-pioneer.md
sed -i '' 's/page.tags/page.dimensions/g' ./_dimensions/zh/attributes/sustainability-pioneer.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_dimensions/zh/attributes/sustainability-pioneer.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_dimensions/zh/attributes/founder-led.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_dimensions/zh/attributes/founder-led.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_dimensions/zh/attributes/founder-led.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_dimensions/zh/attributes/founder-led.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_dimensions/zh/attributes/founder-led.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_dimensions/zh/attributes/founder-led.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_dimensions/zh/attributes/founder-led.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_dimensions/zh/attributes/founder-led.md
sed -i '' 's/site.tags/site.dimensions/g' ./_dimensions/zh/attributes/founder-led.md
sed -i '' 's/page.tags/page.dimensions/g' ./_dimensions/zh/attributes/founder-led.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_dimensions/zh/attributes/founder-led.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_dimensions/zh/attributes/regional-icon.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_dimensions/zh/attributes/regional-icon.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_dimensions/zh/attributes/regional-icon.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_dimensions/zh/attributes/regional-icon.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_dimensions/zh/attributes/regional-icon.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_dimensions/zh/attributes/regional-icon.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_dimensions/zh/attributes/regional-icon.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_dimensions/zh/attributes/regional-icon.md
sed -i '' 's/site.tags/site.dimensions/g' ./_dimensions/zh/attributes/regional-icon.md
sed -i '' 's/page.tags/page.dimensions/g' ./_dimensions/zh/attributes/regional-icon.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_dimensions/zh/attributes/regional-icon.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_dimensions/zh/attributes/heritage-brand.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_dimensions/zh/attributes/heritage-brand.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_dimensions/zh/attributes/heritage-brand.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_dimensions/zh/attributes/heritage-brand.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_dimensions/zh/attributes/heritage-brand.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_dimensions/zh/attributes/heritage-brand.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_dimensions/zh/attributes/heritage-brand.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_dimensions/zh/attributes/heritage-brand.md
sed -i '' 's/site.tags/site.dimensions/g' ./_dimensions/zh/attributes/heritage-brand.md
sed -i '' 's/page.tags/page.dimensions/g' ./_dimensions/zh/attributes/heritage-brand.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_dimensions/zh/attributes/heritage-brand.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_dimensions/zh/markets/china.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_dimensions/zh/markets/china.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_dimensions/zh/markets/china.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_dimensions/zh/markets/china.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_dimensions/zh/markets/china.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_dimensions/zh/markets/china.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_dimensions/zh/markets/china.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_dimensions/zh/markets/china.md
sed -i '' 's/site.tags/site.dimensions/g' ./_dimensions/zh/markets/china.md
sed -i '' 's/page.tags/page.dimensions/g' ./_dimensions/zh/markets/china.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_dimensions/zh/markets/china.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_dimensions/zh/markets/brazil.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_dimensions/zh/markets/brazil.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_dimensions/zh/markets/brazil.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_dimensions/zh/markets/brazil.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_dimensions/zh/markets/brazil.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_dimensions/zh/markets/brazil.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_dimensions/zh/markets/brazil.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_dimensions/zh/markets/brazil.md
sed -i '' 's/site.tags/site.dimensions/g' ./_dimensions/zh/markets/brazil.md
sed -i '' 's/page.tags/page.dimensions/g' ./_dimensions/zh/markets/brazil.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_dimensions/zh/markets/brazil.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_dimensions/zh/markets/south-africa.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_dimensions/zh/markets/south-africa.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_dimensions/zh/markets/south-africa.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_dimensions/zh/markets/south-africa.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_dimensions/zh/markets/south-africa.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_dimensions/zh/markets/south-africa.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_dimensions/zh/markets/south-africa.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_dimensions/zh/markets/south-africa.md
sed -i '' 's/site.tags/site.dimensions/g' ./_dimensions/zh/markets/south-africa.md
sed -i '' 's/page.tags/page.dimensions/g' ./_dimensions/zh/markets/south-africa.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_dimensions/zh/markets/south-africa.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_dimensions/zh/markets/india.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_dimensions/zh/markets/india.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_dimensions/zh/markets/india.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_dimensions/zh/markets/india.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_dimensions/zh/markets/india.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_dimensions/zh/markets/india.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_dimensions/zh/markets/india.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_dimensions/zh/markets/india.md
sed -i '' 's/site.tags/site.dimensions/g' ./_dimensions/zh/markets/india.md
sed -i '' 's/page.tags/page.dimensions/g' ./_dimensions/zh/markets/india.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_dimensions/zh/markets/india.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_dimensions/zh/markets/russia.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_dimensions/zh/markets/russia.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_dimensions/zh/markets/russia.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_dimensions/zh/markets/russia.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_dimensions/zh/markets/russia.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_dimensions/zh/markets/russia.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_dimensions/zh/markets/russia.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_dimensions/zh/markets/russia.md
sed -i '' 's/site.tags/site.dimensions/g' ./_dimensions/zh/markets/russia.md
sed -i '' 's/page.tags/page.dimensions/g' ./_dimensions/zh/markets/russia.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_dimensions/zh/markets/russia.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_dimensions/en/sectors/natural-supplements.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_dimensions/en/sectors/natural-supplements.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_dimensions/en/sectors/natural-supplements.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_dimensions/en/sectors/natural-supplements.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_dimensions/en/sectors/natural-supplements.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_dimensions/en/sectors/natural-supplements.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_dimensions/en/sectors/natural-supplements.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_dimensions/en/sectors/natural-supplements.md
sed -i '' 's/site.tags/site.dimensions/g' ./_dimensions/en/sectors/natural-supplements.md
sed -i '' 's/page.tags/page.dimensions/g' ./_dimensions/en/sectors/natural-supplements.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_dimensions/en/sectors/natural-supplements.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_dimensions/en/sectors/artisan-ceramics.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_dimensions/en/sectors/artisan-ceramics.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_dimensions/en/sectors/artisan-ceramics.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_dimensions/en/sectors/artisan-ceramics.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_dimensions/en/sectors/artisan-ceramics.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_dimensions/en/sectors/artisan-ceramics.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_dimensions/en/sectors/artisan-ceramics.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_dimensions/en/sectors/artisan-ceramics.md
sed -i '' 's/site.tags/site.dimensions/g' ./_dimensions/en/sectors/artisan-ceramics.md
sed -i '' 's/page.tags/page.dimensions/g' ./_dimensions/en/sectors/artisan-ceramics.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_dimensions/en/sectors/artisan-ceramics.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_dimensions/en/sectors/gourmet-foods.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_dimensions/en/sectors/gourmet-foods.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_dimensions/en/sectors/gourmet-foods.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_dimensions/en/sectors/gourmet-foods.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_dimensions/en/sectors/gourmet-foods.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_dimensions/en/sectors/gourmet-foods.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_dimensions/en/sectors/gourmet-foods.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_dimensions/en/sectors/gourmet-foods.md
sed -i '' 's/site.tags/site.dimensions/g' ./_dimensions/en/sectors/gourmet-foods.md
sed -i '' 's/page.tags/page.dimensions/g' ./_dimensions/en/sectors/gourmet-foods.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_dimensions/en/sectors/gourmet-foods.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_dimensions/en/sectors/fermented-dairy.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_dimensions/en/sectors/fermented-dairy.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_dimensions/en/sectors/fermented-dairy.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_dimensions/en/sectors/fermented-dairy.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_dimensions/en/sectors/fermented-dairy.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_dimensions/en/sectors/fermented-dairy.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_dimensions/en/sectors/fermented-dairy.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_dimensions/en/sectors/fermented-dairy.md
sed -i '' 's/site.tags/site.dimensions/g' ./_dimensions/en/sectors/fermented-dairy.md
sed -i '' 's/page.tags/page.dimensions/g' ./_dimensions/en/sectors/fermented-dairy.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_dimensions/en/sectors/fermented-dairy.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_dimensions/en/sectors/honey-bee-products.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_dimensions/en/sectors/honey-bee-products.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_dimensions/en/sectors/honey-bee-products.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_dimensions/en/sectors/honey-bee-products.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_dimensions/en/sectors/honey-bee-products.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_dimensions/en/sectors/honey-bee-products.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_dimensions/en/sectors/honey-bee-products.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_dimensions/en/sectors/honey-bee-products.md
sed -i '' 's/site.tags/site.dimensions/g' ./_dimensions/en/sectors/honey-bee-products.md
sed -i '' 's/page.tags/page.dimensions/g' ./_dimensions/en/sectors/honey-bee-products.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_dimensions/en/sectors/honey-bee-products.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_dimensions/en/sectors/artisanal-spirits.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_dimensions/en/sectors/artisanal-spirits.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_dimensions/en/sectors/artisanal-spirits.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_dimensions/en/sectors/artisanal-spirits.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_dimensions/en/sectors/artisanal-spirits.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_dimensions/en/sectors/artisanal-spirits.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_dimensions/en/sectors/artisanal-spirits.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_dimensions/en/sectors/artisanal-spirits.md
sed -i '' 's/site.tags/site.dimensions/g' ./_dimensions/en/sectors/artisanal-spirits.md
sed -i '' 's/page.tags/page.dimensions/g' ./_dimensions/en/sectors/artisanal-spirits.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_dimensions/en/sectors/artisanal-spirits.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_dimensions/en/sectors/specialty-cheeses.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_dimensions/en/sectors/specialty-cheeses.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_dimensions/en/sectors/specialty-cheeses.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_dimensions/en/sectors/specialty-cheeses.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_dimensions/en/sectors/specialty-cheeses.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_dimensions/en/sectors/specialty-cheeses.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_dimensions/en/sectors/specialty-cheeses.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_dimensions/en/sectors/specialty-cheeses.md
sed -i '' 's/site.tags/site.dimensions/g' ./_dimensions/en/sectors/specialty-cheeses.md
sed -i '' 's/page.tags/page.dimensions/g' ./_dimensions/en/sectors/specialty-cheeses.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_dimensions/en/sectors/specialty-cheeses.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_dimensions/en/sectors/halal-food-products.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_dimensions/en/sectors/halal-food-products.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_dimensions/en/sectors/halal-food-products.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_dimensions/en/sectors/halal-food-products.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_dimensions/en/sectors/halal-food-products.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_dimensions/en/sectors/halal-food-products.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_dimensions/en/sectors/halal-food-products.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_dimensions/en/sectors/halal-food-products.md
sed -i '' 's/site.tags/site.dimensions/g' ./_dimensions/en/sectors/halal-food-products.md
sed -i '' 's/page.tags/page.dimensions/g' ./_dimensions/en/sectors/halal-food-products.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_dimensions/en/sectors/halal-food-products.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_dimensions/en/sectors/mineral-waters.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_dimensions/en/sectors/mineral-waters.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_dimensions/en/sectors/mineral-waters.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_dimensions/en/sectors/mineral-waters.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_dimensions/en/sectors/mineral-waters.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_dimensions/en/sectors/mineral-waters.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_dimensions/en/sectors/mineral-waters.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_dimensions/en/sectors/mineral-waters.md
sed -i '' 's/site.tags/site.dimensions/g' ./_dimensions/en/sectors/mineral-waters.md
sed -i '' 's/page.tags/page.dimensions/g' ./_dimensions/en/sectors/mineral-waters.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_dimensions/en/sectors/mineral-waters.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_dimensions/en/sectors/cured-meats.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_dimensions/en/sectors/cured-meats.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_dimensions/en/sectors/cured-meats.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_dimensions/en/sectors/cured-meats.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_dimensions/en/sectors/cured-meats.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_dimensions/en/sectors/cured-meats.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_dimensions/en/sectors/cured-meats.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_dimensions/en/sectors/cured-meats.md
sed -i '' 's/site.tags/site.dimensions/g' ./_dimensions/en/sectors/cured-meats.md
sed -i '' 's/page.tags/page.dimensions/g' ./_dimensions/en/sectors/cured-meats.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_dimensions/en/sectors/cured-meats.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_dimensions/en/sectors/natural-beauty.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_dimensions/en/sectors/natural-beauty.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_dimensions/en/sectors/natural-beauty.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_dimensions/en/sectors/natural-beauty.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_dimensions/en/sectors/natural-beauty.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_dimensions/en/sectors/natural-beauty.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_dimensions/en/sectors/natural-beauty.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_dimensions/en/sectors/natural-beauty.md
sed -i '' 's/site.tags/site.dimensions/g' ./_dimensions/en/sectors/natural-beauty.md
sed -i '' 's/page.tags/page.dimensions/g' ./_dimensions/en/sectors/natural-beauty.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_dimensions/en/sectors/natural-beauty.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_dimensions/en/sectors/jewelry-watches.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_dimensions/en/sectors/jewelry-watches.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_dimensions/en/sectors/jewelry-watches.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_dimensions/en/sectors/jewelry-watches.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_dimensions/en/sectors/jewelry-watches.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_dimensions/en/sectors/jewelry-watches.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_dimensions/en/sectors/jewelry-watches.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_dimensions/en/sectors/jewelry-watches.md
sed -i '' 's/site.tags/site.dimensions/g' ./_dimensions/en/sectors/jewelry-watches.md
sed -i '' 's/page.tags/page.dimensions/g' ./_dimensions/en/sectors/jewelry-watches.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_dimensions/en/sectors/jewelry-watches.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_dimensions/en/sectors/artisan-confectionery.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_dimensions/en/sectors/artisan-confectionery.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_dimensions/en/sectors/artisan-confectionery.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_dimensions/en/sectors/artisan-confectionery.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_dimensions/en/sectors/artisan-confectionery.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_dimensions/en/sectors/artisan-confectionery.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_dimensions/en/sectors/artisan-confectionery.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_dimensions/en/sectors/artisan-confectionery.md
sed -i '' 's/site.tags/site.dimensions/g' ./_dimensions/en/sectors/artisan-confectionery.md
sed -i '' 's/page.tags/page.dimensions/g' ./_dimensions/en/sectors/artisan-confectionery.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_dimensions/en/sectors/artisan-confectionery.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_dimensions/en/sectors/fashion-accessories.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_dimensions/en/sectors/fashion-accessories.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_dimensions/en/sectors/fashion-accessories.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_dimensions/en/sectors/fashion-accessories.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_dimensions/en/sectors/fashion-accessories.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_dimensions/en/sectors/fashion-accessories.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_dimensions/en/sectors/fashion-accessories.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_dimensions/en/sectors/fashion-accessories.md
sed -i '' 's/site.tags/site.dimensions/g' ./_dimensions/en/sectors/fashion-accessories.md
sed -i '' 's/page.tags/page.dimensions/g' ./_dimensions/en/sectors/fashion-accessories.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_dimensions/en/sectors/fashion-accessories.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_dimensions/en/sectors/hotels-resorts.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_dimensions/en/sectors/hotels-resorts.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_dimensions/en/sectors/hotels-resorts.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_dimensions/en/sectors/hotels-resorts.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_dimensions/en/sectors/hotels-resorts.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_dimensions/en/sectors/hotels-resorts.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_dimensions/en/sectors/hotels-resorts.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_dimensions/en/sectors/hotels-resorts.md
sed -i '' 's/site.tags/site.dimensions/g' ./_dimensions/en/sectors/hotels-resorts.md
sed -i '' 's/page.tags/page.dimensions/g' ./_dimensions/en/sectors/hotels-resorts.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_dimensions/en/sectors/hotels-resorts.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_dimensions/en/sectors/wine.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_dimensions/en/sectors/wine.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_dimensions/en/sectors/wine.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_dimensions/en/sectors/wine.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_dimensions/en/sectors/wine.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_dimensions/en/sectors/wine.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_dimensions/en/sectors/wine.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_dimensions/en/sectors/wine.md
sed -i '' 's/site.tags/site.dimensions/g' ./_dimensions/en/sectors/wine.md
sed -i '' 's/page.tags/page.dimensions/g' ./_dimensions/en/sectors/wine.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_dimensions/en/sectors/wine.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_dimensions/en/signals/investment-ready.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_dimensions/en/signals/investment-ready.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_dimensions/en/signals/investment-ready.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_dimensions/en/signals/investment-ready.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_dimensions/en/signals/investment-ready.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_dimensions/en/signals/investment-ready.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_dimensions/en/signals/investment-ready.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_dimensions/en/signals/investment-ready.md
sed -i '' 's/site.tags/site.dimensions/g' ./_dimensions/en/signals/investment-ready.md
sed -i '' 's/page.tags/page.dimensions/g' ./_dimensions/en/signals/investment-ready.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_dimensions/en/signals/investment-ready.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_dimensions/en/signals/export-ready.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_dimensions/en/signals/export-ready.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_dimensions/en/signals/export-ready.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_dimensions/en/signals/export-ready.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_dimensions/en/signals/export-ready.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_dimensions/en/signals/export-ready.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_dimensions/en/signals/export-ready.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_dimensions/en/signals/export-ready.md
sed -i '' 's/site.tags/site.dimensions/g' ./_dimensions/en/signals/export-ready.md
sed -i '' 's/page.tags/page.dimensions/g' ./_dimensions/en/signals/export-ready.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_dimensions/en/signals/export-ready.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_dimensions/en/signals/franchise-ready.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_dimensions/en/signals/franchise-ready.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_dimensions/en/signals/franchise-ready.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_dimensions/en/signals/franchise-ready.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_dimensions/en/signals/franchise-ready.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_dimensions/en/signals/franchise-ready.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_dimensions/en/signals/franchise-ready.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_dimensions/en/signals/franchise-ready.md
sed -i '' 's/site.tags/site.dimensions/g' ./_dimensions/en/signals/franchise-ready.md
sed -i '' 's/page.tags/page.dimensions/g' ./_dimensions/en/signals/franchise-ready.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_dimensions/en/signals/franchise-ready.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_dimensions/en/signals/rapid-growth.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_dimensions/en/signals/rapid-growth.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_dimensions/en/signals/rapid-growth.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_dimensions/en/signals/rapid-growth.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_dimensions/en/signals/rapid-growth.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_dimensions/en/signals/rapid-growth.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_dimensions/en/signals/rapid-growth.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_dimensions/en/signals/rapid-growth.md
sed -i '' 's/site.tags/site.dimensions/g' ./_dimensions/en/signals/rapid-growth.md
sed -i '' 's/page.tags/page.dimensions/g' ./_dimensions/en/signals/rapid-growth.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_dimensions/en/signals/rapid-growth.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_dimensions/en/attributes/premium-positioning.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_dimensions/en/attributes/premium-positioning.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_dimensions/en/attributes/premium-positioning.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_dimensions/en/attributes/premium-positioning.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_dimensions/en/attributes/premium-positioning.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_dimensions/en/attributes/premium-positioning.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_dimensions/en/attributes/premium-positioning.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_dimensions/en/attributes/premium-positioning.md
sed -i '' 's/site.tags/site.dimensions/g' ./_dimensions/en/attributes/premium-positioning.md
sed -i '' 's/page.tags/page.dimensions/g' ./_dimensions/en/attributes/premium-positioning.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_dimensions/en/attributes/premium-positioning.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_dimensions/en/attributes/innovation-leader.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_dimensions/en/attributes/innovation-leader.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_dimensions/en/attributes/innovation-leader.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_dimensions/en/attributes/innovation-leader.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_dimensions/en/attributes/innovation-leader.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_dimensions/en/attributes/innovation-leader.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_dimensions/en/attributes/innovation-leader.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_dimensions/en/attributes/innovation-leader.md
sed -i '' 's/site.tags/site.dimensions/g' ./_dimensions/en/attributes/innovation-leader.md
sed -i '' 's/page.tags/page.dimensions/g' ./_dimensions/en/attributes/innovation-leader.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_dimensions/en/attributes/innovation-leader.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_dimensions/en/attributes/cultural-ambassador.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_dimensions/en/attributes/cultural-ambassador.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_dimensions/en/attributes/cultural-ambassador.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_dimensions/en/attributes/cultural-ambassador.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_dimensions/en/attributes/cultural-ambassador.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_dimensions/en/attributes/cultural-ambassador.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_dimensions/en/attributes/cultural-ambassador.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_dimensions/en/attributes/cultural-ambassador.md
sed -i '' 's/site.tags/site.dimensions/g' ./_dimensions/en/attributes/cultural-ambassador.md
sed -i '' 's/page.tags/page.dimensions/g' ./_dimensions/en/attributes/cultural-ambassador.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_dimensions/en/attributes/cultural-ambassador.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_dimensions/en/attributes/artisanal-excellence.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_dimensions/en/attributes/artisanal-excellence.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_dimensions/en/attributes/artisanal-excellence.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_dimensions/en/attributes/artisanal-excellence.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_dimensions/en/attributes/artisanal-excellence.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_dimensions/en/attributes/artisanal-excellence.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_dimensions/en/attributes/artisanal-excellence.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_dimensions/en/attributes/artisanal-excellence.md
sed -i '' 's/site.tags/site.dimensions/g' ./_dimensions/en/attributes/artisanal-excellence.md
sed -i '' 's/page.tags/page.dimensions/g' ./_dimensions/en/attributes/artisanal-excellence.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_dimensions/en/attributes/artisanal-excellence.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_dimensions/en/attributes/sustainability-pioneer.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_dimensions/en/attributes/sustainability-pioneer.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_dimensions/en/attributes/sustainability-pioneer.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_dimensions/en/attributes/sustainability-pioneer.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_dimensions/en/attributes/sustainability-pioneer.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_dimensions/en/attributes/sustainability-pioneer.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_dimensions/en/attributes/sustainability-pioneer.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_dimensions/en/attributes/sustainability-pioneer.md
sed -i '' 's/site.tags/site.dimensions/g' ./_dimensions/en/attributes/sustainability-pioneer.md
sed -i '' 's/page.tags/page.dimensions/g' ./_dimensions/en/attributes/sustainability-pioneer.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_dimensions/en/attributes/sustainability-pioneer.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_dimensions/en/attributes/founder-led.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_dimensions/en/attributes/founder-led.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_dimensions/en/attributes/founder-led.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_dimensions/en/attributes/founder-led.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_dimensions/en/attributes/founder-led.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_dimensions/en/attributes/founder-led.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_dimensions/en/attributes/founder-led.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_dimensions/en/attributes/founder-led.md
sed -i '' 's/site.tags/site.dimensions/g' ./_dimensions/en/attributes/founder-led.md
sed -i '' 's/page.tags/page.dimensions/g' ./_dimensions/en/attributes/founder-led.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_dimensions/en/attributes/founder-led.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_dimensions/en/attributes/regional-icon.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_dimensions/en/attributes/regional-icon.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_dimensions/en/attributes/regional-icon.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_dimensions/en/attributes/regional-icon.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_dimensions/en/attributes/regional-icon.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_dimensions/en/attributes/regional-icon.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_dimensions/en/attributes/regional-icon.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_dimensions/en/attributes/regional-icon.md
sed -i '' 's/site.tags/site.dimensions/g' ./_dimensions/en/attributes/regional-icon.md
sed -i '' 's/page.tags/page.dimensions/g' ./_dimensions/en/attributes/regional-icon.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_dimensions/en/attributes/regional-icon.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_dimensions/en/attributes/heritage-brand.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_dimensions/en/attributes/heritage-brand.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_dimensions/en/attributes/heritage-brand.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_dimensions/en/attributes/heritage-brand.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_dimensions/en/attributes/heritage-brand.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_dimensions/en/attributes/heritage-brand.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_dimensions/en/attributes/heritage-brand.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_dimensions/en/attributes/heritage-brand.md
sed -i '' 's/site.tags/site.dimensions/g' ./_dimensions/en/attributes/heritage-brand.md
sed -i '' 's/page.tags/page.dimensions/g' ./_dimensions/en/attributes/heritage-brand.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_dimensions/en/attributes/heritage-brand.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_dimensions/en/markets/china.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_dimensions/en/markets/china.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_dimensions/en/markets/china.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_dimensions/en/markets/china.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_dimensions/en/markets/china.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_dimensions/en/markets/china.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_dimensions/en/markets/china.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_dimensions/en/markets/china.md
sed -i '' 's/site.tags/site.dimensions/g' ./_dimensions/en/markets/china.md
sed -i '' 's/page.tags/page.dimensions/g' ./_dimensions/en/markets/china.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_dimensions/en/markets/china.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_dimensions/en/markets/brazil.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_dimensions/en/markets/brazil.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_dimensions/en/markets/brazil.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_dimensions/en/markets/brazil.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_dimensions/en/markets/brazil.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_dimensions/en/markets/brazil.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_dimensions/en/markets/brazil.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_dimensions/en/markets/brazil.md
sed -i '' 's/site.tags/site.dimensions/g' ./_dimensions/en/markets/brazil.md
sed -i '' 's/page.tags/page.dimensions/g' ./_dimensions/en/markets/brazil.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_dimensions/en/markets/brazil.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_dimensions/en/markets/south-africa.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_dimensions/en/markets/south-africa.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_dimensions/en/markets/south-africa.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_dimensions/en/markets/south-africa.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_dimensions/en/markets/south-africa.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_dimensions/en/markets/south-africa.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_dimensions/en/markets/south-africa.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_dimensions/en/markets/south-africa.md
sed -i '' 's/site.tags/site.dimensions/g' ./_dimensions/en/markets/south-africa.md
sed -i '' 's/page.tags/page.dimensions/g' ./_dimensions/en/markets/south-africa.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_dimensions/en/markets/south-africa.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_dimensions/en/markets/india.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_dimensions/en/markets/india.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_dimensions/en/markets/india.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_dimensions/en/markets/india.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_dimensions/en/markets/india.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_dimensions/en/markets/india.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_dimensions/en/markets/india.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_dimensions/en/markets/india.md
sed -i '' 's/site.tags/site.dimensions/g' ./_dimensions/en/markets/india.md
sed -i '' 's/page.tags/page.dimensions/g' ./_dimensions/en/markets/india.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_dimensions/en/markets/india.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_dimensions/en/markets/russia.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_dimensions/en/markets/russia.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_dimensions/en/markets/russia.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_dimensions/en/markets/russia.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_dimensions/en/markets/russia.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_dimensions/en/markets/russia.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_dimensions/en/markets/russia.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_dimensions/en/markets/russia.md
sed -i '' 's/site.tags/site.dimensions/g' ./_dimensions/en/markets/russia.md
sed -i '' 's/page.tags/page.dimensions/g' ./_dimensions/en/markets/russia.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_dimensions/en/markets/russia.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_archive/tag-list.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_archive/tag-list.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_archive/tag-list.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_archive/tag-list.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_archive/tag-list.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_archive/tag-list.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_archive/tag-list.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_archive/tag-list.html
sed -i '' 's/site.tags/site.dimensions/g' ./_archive/tag-list.html
sed -i '' 's/page.tags/page.dimensions/g' ./_archive/tag-list.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_archive/tag-list.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_archive/map.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_archive/map.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_archive/map.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_archive/map.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_archive/map.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_archive/map.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_archive/map.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_archive/map.html
sed -i '' 's/site.tags/site.dimensions/g' ./_archive/map.html
sed -i '' 's/page.tags/page.dimensions/g' ./_archive/map.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_archive/map.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_archive/form.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_archive/form.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_archive/form.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_archive/form.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_archive/form.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_archive/form.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_archive/form.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_archive/form.html
sed -i '' 's/site.tags/site.dimensions/g' ./_archive/form.html
sed -i '' 's/page.tags/page.dimensions/g' ./_archive/form.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_archive/form.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_archive/pagination.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_archive/pagination.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_archive/pagination.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_archive/pagination.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_archive/pagination.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_archive/pagination.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_archive/pagination.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_archive/pagination.html
sed -i '' 's/site.tags/site.dimensions/g' ./_archive/pagination.html
sed -i '' 's/page.tags/page.dimensions/g' ./_archive/pagination.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_archive/pagination.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_archive/search-filter.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_archive/search-filter.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_archive/search-filter.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_archive/search-filter.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_archive/search-filter.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_archive/search-filter.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_archive/search-filter.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_archive/search-filter.html
sed -i '' 's/site.tags/site.dimensions/g' ./_archive/search-filter.html
sed -i '' 's/page.tags/page.dimensions/g' ./_archive/search-filter.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_archive/search-filter.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_archive/language-selector.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_archive/language-selector.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_archive/language-selector.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_archive/language-selector.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_archive/language-selector.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_archive/language-selector.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_archive/language-selector.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_archive/language-selector.html
sed -i '' 's/site.tags/site.dimensions/g' ./_archive/language-selector.html
sed -i '' 's/page.tags/page.dimensions/g' ./_archive/language-selector.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_archive/language-selector.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_archive/brand-image.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_archive/brand-image.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_archive/brand-image.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_archive/brand-image.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_archive/brand-image.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_archive/brand-image.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_archive/brand-image.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_archive/brand-image.html
sed -i '' 's/site.tags/site.dimensions/g' ./_archive/brand-image.html
sed -i '' 's/page.tags/page.dimensions/g' ./_archive/brand-image.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_archive/brand-image.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_archive/brand-card.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_archive/brand-card.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_archive/brand-card.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_archive/brand-card.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_archive/brand-card.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_archive/brand-card.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_archive/brand-card.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_archive/brand-card.html
sed -i '' 's/site.tags/site.dimensions/g' ./_archive/brand-card.html
sed -i '' 's/page.tags/page.dimensions/g' ./_archive/brand-card.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_archive/brand-card.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_archive/simple-search.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_archive/simple-search.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_archive/simple-search.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_archive/simple-search.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_archive/simple-search.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_archive/simple-search.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_archive/simple-search.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_archive/simple-search.html
sed -i '' 's/site.tags/site.dimensions/g' ./_archive/simple-search.html
sed -i '' 's/page.tags/page.dimensions/g' ./_archive/simple-search.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_archive/simple-search.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_archive/tag.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_archive/tag.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_archive/tag.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_archive/tag.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_archive/tag.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_archive/tag.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_archive/tag.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_archive/tag.html
sed -i '' 's/site.tags/site.dimensions/g' ./_archive/tag.html
sed -i '' 's/page.tags/page.dimensions/g' ./_archive/tag.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_archive/tag.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_archive/featured-brands-carousel.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_archive/featured-brands-carousel.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_archive/featured-brands-carousel.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_archive/featured-brands-carousel.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_archive/featured-brands-carousel.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_archive/featured-brands-carousel.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_archive/featured-brands-carousel.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_archive/featured-brands-carousel.html
sed -i '' 's/site.tags/site.dimensions/g' ./_archive/featured-brands-carousel.html
sed -i '' 's/page.tags/page.dimensions/g' ./_archive/featured-brands-carousel.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_archive/featured-brands-carousel.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_archive/button.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_archive/button.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_archive/button.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_archive/button.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_archive/button.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_archive/button.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_archive/button.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_archive/button.html
sed -i '' 's/site.tags/site.dimensions/g' ./_archive/button.html
sed -i '' 's/page.tags/page.dimensions/g' ./_archive/button.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_archive/button.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_archive/insights-feed.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_archive/insights-feed.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_archive/insights-feed.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_archive/insights-feed.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_archive/insights-feed.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_archive/insights-feed.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_archive/insights-feed.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_archive/insights-feed.html
sed -i '' 's/site.tags/site.dimensions/g' ./_archive/insights-feed.html
sed -i '' 's/page.tags/page.dimensions/g' ./_archive/insights-feed.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_archive/insights-feed.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_archive/discovery-dimensions-grid.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_archive/discovery-dimensions-grid.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_archive/discovery-dimensions-grid.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_archive/discovery-dimensions-grid.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_archive/discovery-dimensions-grid.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_archive/discovery-dimensions-grid.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_archive/discovery-dimensions-grid.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_archive/discovery-dimensions-grid.html
sed -i '' 's/site.tags/site.dimensions/g' ./_archive/discovery-dimensions-grid.html
sed -i '' 's/page.tags/page.dimensions/g' ./_archive/discovery-dimensions-grid.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_archive/discovery-dimensions-grid.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_archive/icon.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_archive/icon.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_archive/icon.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_archive/icon.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_archive/icon.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_archive/icon.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_archive/icon.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_archive/icon.html
sed -i '' 's/site.tags/site.dimensions/g' ./_archive/icon.html
sed -i '' 's/page.tags/page.dimensions/g' ./_archive/icon.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_archive/icon.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_archive/google-analytics.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_archive/google-analytics.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_archive/google-analytics.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_archive/google-analytics.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_archive/google-analytics.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_archive/google-analytics.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_archive/google-analytics.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_archive/google-analytics.html
sed -i '' 's/site.tags/site.dimensions/g' ./_archive/google-analytics.html
sed -i '' 's/page.tags/page.dimensions/g' ./_archive/google-analytics.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_archive/google-analytics.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_archive/latest-insights-grid.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_archive/latest-insights-grid.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_archive/latest-insights-grid.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_archive/latest-insights-grid.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_archive/latest-insights-grid.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_archive/latest-insights-grid.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_archive/latest-insights-grid.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_archive/latest-insights-grid.html
sed -i '' 's/site.tags/site.dimensions/g' ./_archive/latest-insights-grid.html
sed -i '' 's/page.tags/page.dimensions/g' ./_archive/latest-insights-grid.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_archive/latest-insights-grid.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_archive/site-structure.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_archive/site-structure.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_archive/site-structure.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_archive/site-structure.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_archive/site-structure.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_archive/site-structure.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_archive/site-structure.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_archive/site-structure.md
sed -i '' 's/site.tags/site.dimensions/g' ./_archive/site-structure.md
sed -i '' 's/page.tags/page.dimensions/g' ./_archive/site-structure.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_archive/site-structure.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_archive/related-brands-list.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_archive/related-brands-list.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_archive/related-brands-list.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_archive/related-brands-list.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_archive/related-brands-list.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_archive/related-brands-list.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_archive/related-brands-list.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_archive/related-brands-list.html
sed -i '' 's/site.tags/site.dimensions/g' ./_archive/related-brands-list.html
sed -i '' 's/page.tags/page.dimensions/g' ./_archive/related-brands-list.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_archive/related-brands-list.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_archive/dimension-cloud.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_archive/dimension-cloud.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_archive/dimension-cloud.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_archive/dimension-cloud.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_archive/dimension-cloud.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_archive/dimension-cloud.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_archive/dimension-cloud.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_archive/dimension-cloud.html
sed -i '' 's/site.tags/site.dimensions/g' ./_archive/dimension-cloud.html
sed -i '' 's/page.tags/page.dimensions/g' ./_archive/dimension-cloud.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_archive/dimension-cloud.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_archive/claude-context.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_archive/claude-context.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_archive/claude-context.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_archive/claude-context.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_archive/claude-context.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_archive/claude-context.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_archive/claude-context.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_archive/claude-context.md
sed -i '' 's/site.tags/site.dimensions/g' ./_archive/claude-context.md
sed -i '' 's/page.tags/page.dimensions/g' ./_archive/claude-context.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_archive/claude-context.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_archive/FIXES for new Insights Areas of Focus.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_archive/FIXES for new Insights Areas of Focus.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_archive/FIXES for new Insights Areas of Focus.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_archive/FIXES for new Insights Areas of Focus.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_archive/FIXES for new Insights Areas of Focus.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_archive/FIXES for new Insights Areas of Focus.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_archive/FIXES for new Insights Areas of Focus.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_archive/FIXES for new Insights Areas of Focus.md
sed -i '' 's/site.tags/site.dimensions/g' ./_archive/FIXES for new Insights Areas of Focus.md
sed -i '' 's/page.tags/page.dimensions/g' ./_archive/FIXES for new Insights Areas of Focus.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_archive/FIXES for new Insights Areas of Focus.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_archive/PROJECT_LOG.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_archive/PROJECT_LOG.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_archive/PROJECT_LOG.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_archive/PROJECT_LOG.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_archive/PROJECT_LOG.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_archive/PROJECT_LOG.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_archive/PROJECT_LOG.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_archive/PROJECT_LOG.md
sed -i '' 's/site.tags/site.dimensions/g' ./_archive/PROJECT_LOG.md
sed -i '' 's/page.tags/page.dimensions/g' ./_archive/PROJECT_LOG.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_archive/PROJECT_LOG.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_archive/discovery-navigation.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_archive/discovery-navigation.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_archive/discovery-navigation.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_archive/discovery-navigation.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_archive/discovery-navigation.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_archive/discovery-navigation.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_archive/discovery-navigation.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_archive/discovery-navigation.html
sed -i '' 's/site.tags/site.dimensions/g' ./_archive/discovery-navigation.html
sed -i '' 's/page.tags/page.dimensions/g' ./_archive/discovery-navigation.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_archive/discovery-navigation.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_archive/footer.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_archive/footer.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_archive/footer.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_archive/footer.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_archive/footer.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_archive/footer.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_archive/footer.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_archive/footer.html
sed -i '' 's/site.tags/site.dimensions/g' ./_archive/footer.html
sed -i '' 's/page.tags/page.dimensions/g' ./_archive/footer.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_archive/footer.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_archive/featured-brand.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_archive/featured-brand.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_archive/featured-brand.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_archive/featured-brand.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_archive/featured-brand.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_archive/featured-brand.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_archive/featured-brand.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_archive/featured-brand.html
sed -i '' 's/site.tags/site.dimensions/g' ./_archive/featured-brand.html
sed -i '' 's/page.tags/page.dimensions/g' ./_archive/featured-brand.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_archive/featured-brand.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_archive/FIXES for Focus Areas.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_archive/FIXES for Focus Areas.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_archive/FIXES for Focus Areas.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_archive/FIXES for Focus Areas.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_archive/FIXES for Focus Areas.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_archive/FIXES for Focus Areas.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_archive/FIXES for Focus Areas.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_archive/FIXES for Focus Areas.html
sed -i '' 's/site.tags/site.dimensions/g' ./_archive/FIXES for Focus Areas.html
sed -i '' 's/page.tags/page.dimensions/g' ./_archive/FIXES for Focus Areas.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_archive/FIXES for Focus Areas.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_archive/responsive-image.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_archive/responsive-image.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_archive/responsive-image.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_archive/responsive-image.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_archive/responsive-image.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_archive/responsive-image.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_archive/responsive-image.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_archive/responsive-image.html
sed -i '' 's/site.tags/site.dimensions/g' ./_archive/responsive-image.html
sed -i '' 's/page.tags/page.dimensions/g' ./_archive/responsive-image.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_archive/responsive-image.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_archive/image-attribution.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_archive/image-attribution.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_archive/image-attribution.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_archive/image-attribution.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_archive/image-attribution.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_archive/image-attribution.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_archive/image-attribution.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_archive/image-attribution.html
sed -i '' 's/site.tags/site.dimensions/g' ./_archive/image-attribution.html
sed -i '' 's/page.tags/page.dimensions/g' ./_archive/image-attribution.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_archive/image-attribution.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_archive/insight-card.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_archive/insight-card.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_archive/insight-card.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_archive/insight-card.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_archive/insight-card.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_archive/insight-card.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_archive/insight-card.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_archive/insight-card.html
sed -i '' 's/site.tags/site.dimensions/g' ./_archive/insight-card.html
sed -i '' 's/page.tags/page.dimensions/g' ./_archive/insight-card.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_archive/insight-card.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_archive/tag-cloud.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_archive/tag-cloud.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_archive/tag-cloud.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_archive/tag-cloud.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_archive/tag-cloud.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_archive/tag-cloud.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_archive/tag-cloud.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_archive/tag-cloud.html
sed -i '' 's/site.tags/site.dimensions/g' ./_archive/tag-cloud.html
sed -i '' 's/page.tags/page.dimensions/g' ./_archive/tag-cloud.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_archive/tag-cloud.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_archive/markets-map.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_archive/markets-map.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_archive/markets-map.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_archive/markets-map.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_archive/markets-map.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_archive/markets-map.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_archive/markets-map.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_archive/markets-map.html
sed -i '' 's/site.tags/site.dimensions/g' ./_archive/markets-map.html
sed -i '' 's/page.tags/page.dimensions/g' ./_archive/markets-map.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_archive/markets-map.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_archive/header.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_archive/header.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_archive/header.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_archive/header.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_archive/header.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_archive/header.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_archive/header.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_archive/header.html
sed -i '' 's/site.tags/site.dimensions/g' ./_archive/header.html
sed -i '' 's/page.tags/page.dimensions/g' ./_archive/header.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_archive/header.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_archive/content-type-indicator.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_archive/content-type-indicator.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_archive/content-type-indicator.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_archive/content-type-indicator.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_archive/content-type-indicator.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_archive/content-type-indicator.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_archive/content-type-indicator.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_archive/content-type-indicator.html
sed -i '' 's/site.tags/site.dimensions/g' ./_archive/content-type-indicator.html
sed -i '' 's/page.tags/page.dimensions/g' ./_archive/content-type-indicator.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_archive/content-type-indicator.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_archive/dimension-list.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_archive/dimension-list.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_archive/dimension-list.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_archive/dimension-list.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_archive/dimension-list.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_archive/dimension-list.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_archive/dimension-list.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_archive/dimension-list.html
sed -i '' 's/site.tags/site.dimensions/g' ./_archive/dimension-list.html
sed -i '' 's/page.tags/page.dimensions/g' ./_archive/dimension-list.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_archive/dimension-list.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_archive/featured-content.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_archive/featured-content.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_archive/featured-content.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_archive/featured-content.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_archive/featured-content.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_archive/featured-content.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_archive/featured-content.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_archive/featured-content.html
sed -i '' 's/site.tags/site.dimensions/g' ./_archive/featured-content.html
sed -i '' 's/page.tags/page.dimensions/g' ./_archive/featured-content.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_archive/featured-content.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_archive/site-image.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_archive/site-image.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_archive/site-image.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_archive/site-image.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_archive/site-image.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_archive/site-image.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_archive/site-image.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_archive/site-image.html
sed -i '' 's/site.tags/site.dimensions/g' ./_archive/site-image.html
sed -i '' 's/page.tags/page.dimensions/g' ./_archive/site-image.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_archive/site-image.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./_archive/navigation.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./_archive/navigation.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./_archive/navigation.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./_archive/navigation.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./_archive/navigation.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./_archive/navigation.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./_archive/navigation.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./_archive/navigation.html
sed -i '' 's/site.tags/site.dimensions/g' ./_archive/navigation.html
sed -i '' 's/page.tags/page.dimensions/g' ./_archive/navigation.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./_archive/navigation.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./pages/ru/brands.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./pages/ru/brands.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./pages/ru/brands.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./pages/ru/brands.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./pages/ru/brands.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./pages/ru/brands.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./pages/ru/brands.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./pages/ru/brands.md
sed -i '' 's/site.tags/site.dimensions/g' ./pages/ru/brands.md
sed -i '' 's/page.tags/page.dimensions/g' ./pages/ru/brands.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./pages/ru/brands.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./pages/ru/search.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./pages/ru/search.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./pages/ru/search.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./pages/ru/search.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./pages/ru/search.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./pages/ru/search.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./pages/ru/search.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./pages/ru/search.md
sed -i '' 's/site.tags/site.dimensions/g' ./pages/ru/search.md
sed -i '' 's/page.tags/page.dimensions/g' ./pages/ru/search.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./pages/ru/search.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./pages/ru/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./pages/ru/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./pages/ru/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./pages/ru/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./pages/ru/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./pages/ru/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./pages/ru/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./pages/ru/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./pages/ru/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./pages/ru/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./pages/ru/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./pages/ru/privacy.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./pages/ru/privacy.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./pages/ru/privacy.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./pages/ru/privacy.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./pages/ru/privacy.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./pages/ru/privacy.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./pages/ru/privacy.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./pages/ru/privacy.md
sed -i '' 's/site.tags/site.dimensions/g' ./pages/ru/privacy.md
sed -i '' 's/page.tags/page.dimensions/g' ./pages/ru/privacy.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./pages/ru/privacy.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./pages/ru/insights.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./pages/ru/insights.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./pages/ru/insights.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./pages/ru/insights.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./pages/ru/insights.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./pages/ru/insights.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./pages/ru/insights.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./pages/ru/insights.md
sed -i '' 's/site.tags/site.dimensions/g' ./pages/ru/insights.md
sed -i '' 's/page.tags/page.dimensions/g' ./pages/ru/insights.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./pages/ru/insights.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./pages/ru/discovery.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./pages/ru/discovery.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./pages/ru/discovery.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./pages/ru/discovery.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./pages/ru/discovery.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./pages/ru/discovery.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./pages/ru/discovery.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./pages/ru/discovery.md
sed -i '' 's/site.tags/site.dimensions/g' ./pages/ru/discovery.md
sed -i '' 's/page.tags/page.dimensions/g' ./pages/ru/discovery.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./pages/ru/discovery.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./pages/ru/404.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./pages/ru/404.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./pages/ru/404.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./pages/ru/404.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./pages/ru/404.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./pages/ru/404.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./pages/ru/404.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./pages/ru/404.md
sed -i '' 's/site.tags/site.dimensions/g' ./pages/ru/404.md
sed -i '' 's/page.tags/page.dimensions/g' ./pages/ru/404.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./pages/ru/404.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./pages/ru/about.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./pages/ru/about.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./pages/ru/about.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./pages/ru/about.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./pages/ru/about.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./pages/ru/about.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./pages/ru/about.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./pages/ru/about.md
sed -i '' 's/site.tags/site.dimensions/g' ./pages/ru/about.md
sed -i '' 's/page.tags/page.dimensions/g' ./pages/ru/about.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./pages/ru/about.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./pages/ru/image-credits.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./pages/ru/image-credits.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./pages/ru/image-credits.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./pages/ru/image-credits.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./pages/ru/image-credits.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./pages/ru/image-credits.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./pages/ru/image-credits.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./pages/ru/image-credits.md
sed -i '' 's/site.tags/site.dimensions/g' ./pages/ru/image-credits.md
sed -i '' 's/page.tags/page.dimensions/g' ./pages/ru/image-credits.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./pages/ru/image-credits.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./pages/ru/discover/markets.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./pages/ru/discover/markets.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./pages/ru/discover/markets.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./pages/ru/discover/markets.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./pages/ru/discover/markets.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./pages/ru/discover/markets.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./pages/ru/discover/markets.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./pages/ru/discover/markets.md
sed -i '' 's/site.tags/site.dimensions/g' ./pages/ru/discover/markets.md
sed -i '' 's/page.tags/page.dimensions/g' ./pages/ru/discover/markets.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./pages/ru/discover/markets.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./pages/ru/discover/sectors.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./pages/ru/discover/sectors.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./pages/ru/discover/sectors.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./pages/ru/discover/sectors.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./pages/ru/discover/sectors.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./pages/ru/discover/sectors.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./pages/ru/discover/sectors.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./pages/ru/discover/sectors.md
sed -i '' 's/site.tags/site.dimensions/g' ./pages/ru/discover/sectors.md
sed -i '' 's/page.tags/page.dimensions/g' ./pages/ru/discover/sectors.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./pages/ru/discover/sectors.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./pages/ru/discover/attributes.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./pages/ru/discover/attributes.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./pages/ru/discover/attributes.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./pages/ru/discover/attributes.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./pages/ru/discover/attributes.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./pages/ru/discover/attributes.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./pages/ru/discover/attributes.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./pages/ru/discover/attributes.md
sed -i '' 's/site.tags/site.dimensions/g' ./pages/ru/discover/attributes.md
sed -i '' 's/page.tags/page.dimensions/g' ./pages/ru/discover/attributes.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./pages/ru/discover/attributes.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./pages/ru/discover/russian-sectors.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./pages/ru/discover/russian-sectors.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./pages/ru/discover/russian-sectors.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./pages/ru/discover/russian-sectors.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./pages/ru/discover/russian-sectors.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./pages/ru/discover/russian-sectors.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./pages/ru/discover/russian-sectors.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./pages/ru/discover/russian-sectors.md
sed -i '' 's/site.tags/site.dimensions/g' ./pages/ru/discover/russian-sectors.md
sed -i '' 's/page.tags/page.dimensions/g' ./pages/ru/discover/russian-sectors.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./pages/ru/discover/russian-sectors.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./pages/ru/discover/signals.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./pages/ru/discover/signals.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./pages/ru/discover/signals.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./pages/ru/discover/signals.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./pages/ru/discover/signals.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./pages/ru/discover/signals.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./pages/ru/discover/signals.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./pages/ru/discover/signals.md
sed -i '' 's/site.tags/site.dimensions/g' ./pages/ru/discover/signals.md
sed -i '' 's/page.tags/page.dimensions/g' ./pages/ru/discover/signals.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./pages/ru/discover/signals.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./pages/zh/brands.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./pages/zh/brands.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./pages/zh/brands.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./pages/zh/brands.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./pages/zh/brands.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./pages/zh/brands.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./pages/zh/brands.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./pages/zh/brands.md
sed -i '' 's/site.tags/site.dimensions/g' ./pages/zh/brands.md
sed -i '' 's/page.tags/page.dimensions/g' ./pages/zh/brands.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./pages/zh/brands.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./pages/zh/search.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./pages/zh/search.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./pages/zh/search.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./pages/zh/search.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./pages/zh/search.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./pages/zh/search.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./pages/zh/search.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./pages/zh/search.md
sed -i '' 's/site.tags/site.dimensions/g' ./pages/zh/search.md
sed -i '' 's/page.tags/page.dimensions/g' ./pages/zh/search.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./pages/zh/search.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./pages/zh/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./pages/zh/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./pages/zh/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./pages/zh/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./pages/zh/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./pages/zh/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./pages/zh/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./pages/zh/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./pages/zh/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./pages/zh/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./pages/zh/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./pages/zh/privacy.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./pages/zh/privacy.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./pages/zh/privacy.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./pages/zh/privacy.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./pages/zh/privacy.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./pages/zh/privacy.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./pages/zh/privacy.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./pages/zh/privacy.md
sed -i '' 's/site.tags/site.dimensions/g' ./pages/zh/privacy.md
sed -i '' 's/page.tags/page.dimensions/g' ./pages/zh/privacy.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./pages/zh/privacy.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./pages/zh/insights.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./pages/zh/insights.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./pages/zh/insights.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./pages/zh/insights.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./pages/zh/insights.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./pages/zh/insights.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./pages/zh/insights.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./pages/zh/insights.md
sed -i '' 's/site.tags/site.dimensions/g' ./pages/zh/insights.md
sed -i '' 's/page.tags/page.dimensions/g' ./pages/zh/insights.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./pages/zh/insights.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./pages/zh/discovery.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./pages/zh/discovery.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./pages/zh/discovery.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./pages/zh/discovery.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./pages/zh/discovery.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./pages/zh/discovery.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./pages/zh/discovery.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./pages/zh/discovery.md
sed -i '' 's/site.tags/site.dimensions/g' ./pages/zh/discovery.md
sed -i '' 's/page.tags/page.dimensions/g' ./pages/zh/discovery.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./pages/zh/discovery.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./pages/zh/404.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./pages/zh/404.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./pages/zh/404.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./pages/zh/404.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./pages/zh/404.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./pages/zh/404.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./pages/zh/404.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./pages/zh/404.md
sed -i '' 's/site.tags/site.dimensions/g' ./pages/zh/404.md
sed -i '' 's/page.tags/page.dimensions/g' ./pages/zh/404.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./pages/zh/404.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./pages/zh/about.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./pages/zh/about.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./pages/zh/about.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./pages/zh/about.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./pages/zh/about.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./pages/zh/about.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./pages/zh/about.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./pages/zh/about.md
sed -i '' 's/site.tags/site.dimensions/g' ./pages/zh/about.md
sed -i '' 's/page.tags/page.dimensions/g' ./pages/zh/about.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./pages/zh/about.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./pages/zh/image-credits.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./pages/zh/image-credits.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./pages/zh/image-credits.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./pages/zh/image-credits.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./pages/zh/image-credits.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./pages/zh/image-credits.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./pages/zh/image-credits.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./pages/zh/image-credits.md
sed -i '' 's/site.tags/site.dimensions/g' ./pages/zh/image-credits.md
sed -i '' 's/page.tags/page.dimensions/g' ./pages/zh/image-credits.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./pages/zh/image-credits.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./pages/zh/discover/markets.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./pages/zh/discover/markets.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./pages/zh/discover/markets.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./pages/zh/discover/markets.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./pages/zh/discover/markets.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./pages/zh/discover/markets.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./pages/zh/discover/markets.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./pages/zh/discover/markets.md
sed -i '' 's/site.tags/site.dimensions/g' ./pages/zh/discover/markets.md
sed -i '' 's/page.tags/page.dimensions/g' ./pages/zh/discover/markets.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./pages/zh/discover/markets.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./pages/zh/discover/sectors.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./pages/zh/discover/sectors.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./pages/zh/discover/sectors.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./pages/zh/discover/sectors.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./pages/zh/discover/sectors.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./pages/zh/discover/sectors.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./pages/zh/discover/sectors.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./pages/zh/discover/sectors.md
sed -i '' 's/site.tags/site.dimensions/g' ./pages/zh/discover/sectors.md
sed -i '' 's/page.tags/page.dimensions/g' ./pages/zh/discover/sectors.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./pages/zh/discover/sectors.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./pages/zh/discover/attributes.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./pages/zh/discover/attributes.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./pages/zh/discover/attributes.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./pages/zh/discover/attributes.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./pages/zh/discover/attributes.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./pages/zh/discover/attributes.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./pages/zh/discover/attributes.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./pages/zh/discover/attributes.md
sed -i '' 's/site.tags/site.dimensions/g' ./pages/zh/discover/attributes.md
sed -i '' 's/page.tags/page.dimensions/g' ./pages/zh/discover/attributes.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./pages/zh/discover/attributes.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./pages/zh/discover/russian-sectors.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./pages/zh/discover/russian-sectors.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./pages/zh/discover/russian-sectors.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./pages/zh/discover/russian-sectors.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./pages/zh/discover/russian-sectors.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./pages/zh/discover/russian-sectors.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./pages/zh/discover/russian-sectors.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./pages/zh/discover/russian-sectors.md
sed -i '' 's/site.tags/site.dimensions/g' ./pages/zh/discover/russian-sectors.md
sed -i '' 's/page.tags/page.dimensions/g' ./pages/zh/discover/russian-sectors.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./pages/zh/discover/russian-sectors.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./pages/zh/discover/signals.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./pages/zh/discover/signals.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./pages/zh/discover/signals.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./pages/zh/discover/signals.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./pages/zh/discover/signals.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./pages/zh/discover/signals.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./pages/zh/discover/signals.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./pages/zh/discover/signals.md
sed -i '' 's/site.tags/site.dimensions/g' ./pages/zh/discover/signals.md
sed -i '' 's/page.tags/page.dimensions/g' ./pages/zh/discover/signals.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./pages/zh/discover/signals.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./pages/en/brands.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./pages/en/brands.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./pages/en/brands.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./pages/en/brands.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./pages/en/brands.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./pages/en/brands.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./pages/en/brands.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./pages/en/brands.md
sed -i '' 's/site.tags/site.dimensions/g' ./pages/en/brands.md
sed -i '' 's/page.tags/page.dimensions/g' ./pages/en/brands.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./pages/en/brands.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./pages/en/search.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./pages/en/search.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./pages/en/search.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./pages/en/search.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./pages/en/search.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./pages/en/search.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./pages/en/search.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./pages/en/search.md
sed -i '' 's/site.tags/site.dimensions/g' ./pages/en/search.md
sed -i '' 's/page.tags/page.dimensions/g' ./pages/en/search.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./pages/en/search.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./pages/en/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./pages/en/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./pages/en/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./pages/en/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./pages/en/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./pages/en/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./pages/en/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./pages/en/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./pages/en/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./pages/en/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./pages/en/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./pages/en/privacy.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./pages/en/privacy.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./pages/en/privacy.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./pages/en/privacy.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./pages/en/privacy.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./pages/en/privacy.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./pages/en/privacy.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./pages/en/privacy.md
sed -i '' 's/site.tags/site.dimensions/g' ./pages/en/privacy.md
sed -i '' 's/page.tags/page.dimensions/g' ./pages/en/privacy.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./pages/en/privacy.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./pages/en/test-dimensions.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./pages/en/test-dimensions.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./pages/en/test-dimensions.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./pages/en/test-dimensions.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./pages/en/test-dimensions.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./pages/en/test-dimensions.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./pages/en/test-dimensions.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./pages/en/test-dimensions.md
sed -i '' 's/site.tags/site.dimensions/g' ./pages/en/test-dimensions.md
sed -i '' 's/page.tags/page.dimensions/g' ./pages/en/test-dimensions.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./pages/en/test-dimensions.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./pages/en/insights.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./pages/en/insights.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./pages/en/insights.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./pages/en/insights.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./pages/en/insights.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./pages/en/insights.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./pages/en/insights.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./pages/en/insights.md
sed -i '' 's/site.tags/site.dimensions/g' ./pages/en/insights.md
sed -i '' 's/page.tags/page.dimensions/g' ./pages/en/insights.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./pages/en/insights.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./pages/en/discovery.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./pages/en/discovery.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./pages/en/discovery.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./pages/en/discovery.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./pages/en/discovery.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./pages/en/discovery.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./pages/en/discovery.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./pages/en/discovery.md
sed -i '' 's/site.tags/site.dimensions/g' ./pages/en/discovery.md
sed -i '' 's/page.tags/page.dimensions/g' ./pages/en/discovery.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./pages/en/discovery.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./pages/en/404.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./pages/en/404.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./pages/en/404.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./pages/en/404.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./pages/en/404.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./pages/en/404.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./pages/en/404.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./pages/en/404.md
sed -i '' 's/site.tags/site.dimensions/g' ./pages/en/404.md
sed -i '' 's/page.tags/page.dimensions/g' ./pages/en/404.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./pages/en/404.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./pages/en/about.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./pages/en/about.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./pages/en/about.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./pages/en/about.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./pages/en/about.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./pages/en/about.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./pages/en/about.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./pages/en/about.md
sed -i '' 's/site.tags/site.dimensions/g' ./pages/en/about.md
sed -i '' 's/page.tags/page.dimensions/g' ./pages/en/about.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./pages/en/about.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./pages/en/image-credits.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./pages/en/image-credits.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./pages/en/image-credits.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./pages/en/image-credits.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./pages/en/image-credits.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./pages/en/image-credits.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./pages/en/image-credits.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./pages/en/image-credits.md
sed -i '' 's/site.tags/site.dimensions/g' ./pages/en/image-credits.md
sed -i '' 's/page.tags/page.dimensions/g' ./pages/en/image-credits.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./pages/en/image-credits.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./pages/en/discover/markets.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./pages/en/discover/markets.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./pages/en/discover/markets.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./pages/en/discover/markets.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./pages/en/discover/markets.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./pages/en/discover/markets.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./pages/en/discover/markets.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./pages/en/discover/markets.md
sed -i '' 's/site.tags/site.dimensions/g' ./pages/en/discover/markets.md
sed -i '' 's/page.tags/page.dimensions/g' ./pages/en/discover/markets.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./pages/en/discover/markets.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./pages/en/discover/sectors.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./pages/en/discover/sectors.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./pages/en/discover/sectors.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./pages/en/discover/sectors.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./pages/en/discover/sectors.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./pages/en/discover/sectors.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./pages/en/discover/sectors.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./pages/en/discover/sectors.md
sed -i '' 's/site.tags/site.dimensions/g' ./pages/en/discover/sectors.md
sed -i '' 's/page.tags/page.dimensions/g' ./pages/en/discover/sectors.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./pages/en/discover/sectors.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./pages/en/discover/attributes.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./pages/en/discover/attributes.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./pages/en/discover/attributes.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./pages/en/discover/attributes.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./pages/en/discover/attributes.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./pages/en/discover/attributes.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./pages/en/discover/attributes.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./pages/en/discover/attributes.md
sed -i '' 's/site.tags/site.dimensions/g' ./pages/en/discover/attributes.md
sed -i '' 's/page.tags/page.dimensions/g' ./pages/en/discover/attributes.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./pages/en/discover/attributes.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./pages/en/discover/russian-sectors.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./pages/en/discover/russian-sectors.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./pages/en/discover/russian-sectors.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./pages/en/discover/russian-sectors.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./pages/en/discover/russian-sectors.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./pages/en/discover/russian-sectors.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./pages/en/discover/russian-sectors.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./pages/en/discover/russian-sectors.md
sed -i '' 's/site.tags/site.dimensions/g' ./pages/en/discover/russian-sectors.md
sed -i '' 's/page.tags/page.dimensions/g' ./pages/en/discover/russian-sectors.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./pages/en/discover/russian-sectors.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./pages/en/discover/signals.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./pages/en/discover/signals.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./pages/en/discover/signals.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./pages/en/discover/signals.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./pages/en/discover/signals.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./pages/en/discover/signals.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./pages/en/discover/signals.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./pages/en/discover/signals.md
sed -i '' 's/site.tags/site.dimensions/g' ./pages/en/discover/signals.md
sed -i '' 's/page.tags/page.dimensions/g' ./pages/en/discover/signals.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./pages/en/discover/signals.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./pages/en/styleguide/index.html
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./pages/en/styleguide/index.html
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./pages/en/styleguide/index.html
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./pages/en/styleguide/index.html
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./pages/en/styleguide/index.html
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./pages/en/styleguide/index.html
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./pages/en/styleguide/index.html
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./pages/en/styleguide/index.html
sed -i '' 's/site.tags/site.dimensions/g' ./pages/en/styleguide/index.html
sed -i '' 's/page.tags/page.dimensions/g' ./pages/en/styleguide/index.html
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./pages/en/styleguide/index.html
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./pages/en/styleguide/patterns/content-display.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./pages/en/styleguide/patterns/content-display.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./pages/en/styleguide/patterns/content-display.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./pages/en/styleguide/patterns/content-display.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./pages/en/styleguide/patterns/content-display.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./pages/en/styleguide/patterns/content-display.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./pages/en/styleguide/patterns/content-display.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./pages/en/styleguide/patterns/content-display.md
sed -i '' 's/site.tags/site.dimensions/g' ./pages/en/styleguide/patterns/content-display.md
sed -i '' 's/page.tags/page.dimensions/g' ./pages/en/styleguide/patterns/content-display.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./pages/en/styleguide/patterns/content-display.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./pages/en/styleguide/patterns/image-handling.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./pages/en/styleguide/patterns/image-handling.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./pages/en/styleguide/patterns/image-handling.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./pages/en/styleguide/patterns/image-handling.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./pages/en/styleguide/patterns/image-handling.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./pages/en/styleguide/patterns/image-handling.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./pages/en/styleguide/patterns/image-handling.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./pages/en/styleguide/patterns/image-handling.md
sed -i '' 's/site.tags/site.dimensions/g' ./pages/en/styleguide/patterns/image-handling.md
sed -i '' 's/page.tags/page.dimensions/g' ./pages/en/styleguide/patterns/image-handling.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./pages/en/styleguide/patterns/image-handling.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./pages/en/styleguide/patterns/navigation.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./pages/en/styleguide/patterns/navigation.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./pages/en/styleguide/patterns/navigation.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./pages/en/styleguide/patterns/navigation.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./pages/en/styleguide/patterns/navigation.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./pages/en/styleguide/patterns/navigation.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./pages/en/styleguide/patterns/navigation.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./pages/en/styleguide/patterns/navigation.md
sed -i '' 's/site.tags/site.dimensions/g' ./pages/en/styleguide/patterns/navigation.md
sed -i '' 's/page.tags/page.dimensions/g' ./pages/en/styleguide/patterns/navigation.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./pages/en/styleguide/patterns/navigation.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./pages/en/styleguide/patterns/multilingual.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./pages/en/styleguide/patterns/multilingual.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./pages/en/styleguide/patterns/multilingual.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./pages/en/styleguide/patterns/multilingual.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./pages/en/styleguide/patterns/multilingual.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./pages/en/styleguide/patterns/multilingual.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./pages/en/styleguide/patterns/multilingual.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./pages/en/styleguide/patterns/multilingual.md
sed -i '' 's/site.tags/site.dimensions/g' ./pages/en/styleguide/patterns/multilingual.md
sed -i '' 's/page.tags/page.dimensions/g' ./pages/en/styleguide/patterns/multilingual.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./pages/en/styleguide/patterns/multilingual.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./pages/en/styleguide/foundations/colors.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./pages/en/styleguide/foundations/colors.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./pages/en/styleguide/foundations/colors.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./pages/en/styleguide/foundations/colors.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./pages/en/styleguide/foundations/colors.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./pages/en/styleguide/foundations/colors.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./pages/en/styleguide/foundations/colors.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./pages/en/styleguide/foundations/colors.md
sed -i '' 's/site.tags/site.dimensions/g' ./pages/en/styleguide/foundations/colors.md
sed -i '' 's/page.tags/page.dimensions/g' ./pages/en/styleguide/foundations/colors.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./pages/en/styleguide/foundations/colors.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./pages/en/styleguide/foundations/layouts.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./pages/en/styleguide/foundations/layouts.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./pages/en/styleguide/foundations/layouts.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./pages/en/styleguide/foundations/layouts.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./pages/en/styleguide/foundations/layouts.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./pages/en/styleguide/foundations/layouts.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./pages/en/styleguide/foundations/layouts.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./pages/en/styleguide/foundations/layouts.md
sed -i '' 's/site.tags/site.dimensions/g' ./pages/en/styleguide/foundations/layouts.md
sed -i '' 's/page.tags/page.dimensions/g' ./pages/en/styleguide/foundations/layouts.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./pages/en/styleguide/foundations/layouts.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./pages/en/styleguide/foundations/spacing.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./pages/en/styleguide/foundations/spacing.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./pages/en/styleguide/foundations/spacing.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./pages/en/styleguide/foundations/spacing.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./pages/en/styleguide/foundations/spacing.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./pages/en/styleguide/foundations/spacing.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./pages/en/styleguide/foundations/spacing.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./pages/en/styleguide/foundations/spacing.md
sed -i '' 's/site.tags/site.dimensions/g' ./pages/en/styleguide/foundations/spacing.md
sed -i '' 's/page.tags/page.dimensions/g' ./pages/en/styleguide/foundations/spacing.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./pages/en/styleguide/foundations/spacing.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./pages/en/styleguide/foundations/typography.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./pages/en/styleguide/foundations/typography.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./pages/en/styleguide/foundations/typography.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./pages/en/styleguide/foundations/typography.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./pages/en/styleguide/foundations/typography.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./pages/en/styleguide/foundations/typography.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./pages/en/styleguide/foundations/typography.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./pages/en/styleguide/foundations/typography.md
sed -i '' 's/site.tags/site.dimensions/g' ./pages/en/styleguide/foundations/typography.md
sed -i '' 's/page.tags/page.dimensions/g' ./pages/en/styleguide/foundations/typography.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./pages/en/styleguide/foundations/typography.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./pages/en/styleguide/foundations/brand-identity.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./pages/en/styleguide/foundations/brand-identity.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./pages/en/styleguide/foundations/brand-identity.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./pages/en/styleguide/foundations/brand-identity.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./pages/en/styleguide/foundations/brand-identity.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./pages/en/styleguide/foundations/brand-identity.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./pages/en/styleguide/foundations/brand-identity.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./pages/en/styleguide/foundations/brand-identity.md
sed -i '' 's/site.tags/site.dimensions/g' ./pages/en/styleguide/foundations/brand-identity.md
sed -i '' 's/page.tags/page.dimensions/g' ./pages/en/styleguide/foundations/brand-identity.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./pages/en/styleguide/foundations/brand-identity.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./pages/en/styleguide/components/text.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./pages/en/styleguide/components/text.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./pages/en/styleguide/components/text.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./pages/en/styleguide/components/text.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./pages/en/styleguide/components/text.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./pages/en/styleguide/components/text.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./pages/en/styleguide/components/text.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./pages/en/styleguide/components/text.md
sed -i '' 's/site.tags/site.dimensions/g' ./pages/en/styleguide/components/text.md
sed -i '' 's/page.tags/page.dimensions/g' ./pages/en/styleguide/components/text.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./pages/en/styleguide/components/text.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./pages/en/styleguide/components/buttons.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./pages/en/styleguide/components/buttons.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./pages/en/styleguide/components/buttons.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./pages/en/styleguide/components/buttons.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./pages/en/styleguide/components/buttons.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./pages/en/styleguide/components/buttons.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./pages/en/styleguide/components/buttons.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./pages/en/styleguide/components/buttons.md
sed -i '' 's/site.tags/site.dimensions/g' ./pages/en/styleguide/components/buttons.md
sed -i '' 's/page.tags/page.dimensions/g' ./pages/en/styleguide/components/buttons.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./pages/en/styleguide/components/buttons.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./pages/en/styleguide/components/forms.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./pages/en/styleguide/components/forms.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./pages/en/styleguide/components/forms.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./pages/en/styleguide/components/forms.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./pages/en/styleguide/components/forms.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./pages/en/styleguide/components/forms.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./pages/en/styleguide/components/forms.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./pages/en/styleguide/components/forms.md
sed -i '' 's/site.tags/site.dimensions/g' ./pages/en/styleguide/components/forms.md
sed -i '' 's/page.tags/page.dimensions/g' ./pages/en/styleguide/components/forms.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./pages/en/styleguide/components/forms.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./pages/en/styleguide/components/hero-panels.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./pages/en/styleguide/components/hero-panels.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./pages/en/styleguide/components/hero-panels.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./pages/en/styleguide/components/hero-panels.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./pages/en/styleguide/components/hero-panels.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./pages/en/styleguide/components/hero-panels.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./pages/en/styleguide/components/hero-panels.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./pages/en/styleguide/components/hero-panels.md
sed -i '' 's/site.tags/site.dimensions/g' ./pages/en/styleguide/components/hero-panels.md
sed -i '' 's/page.tags/page.dimensions/g' ./pages/en/styleguide/components/hero-panels.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./pages/en/styleguide/components/hero-panels.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./pages/en/styleguide/components/icons-test.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./pages/en/styleguide/components/icons-test.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./pages/en/styleguide/components/icons-test.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./pages/en/styleguide/components/icons-test.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./pages/en/styleguide/components/icons-test.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./pages/en/styleguide/components/icons-test.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./pages/en/styleguide/components/icons-test.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./pages/en/styleguide/components/icons-test.md
sed -i '' 's/site.tags/site.dimensions/g' ./pages/en/styleguide/components/icons-test.md
sed -i '' 's/page.tags/page.dimensions/g' ./pages/en/styleguide/components/icons-test.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./pages/en/styleguide/components/icons-test.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./pages/en/styleguide/components/dimensions.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./pages/en/styleguide/components/dimensions.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./pages/en/styleguide/components/dimensions.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./pages/en/styleguide/components/dimensions.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./pages/en/styleguide/components/dimensions.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./pages/en/styleguide/components/dimensions.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./pages/en/styleguide/components/dimensions.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./pages/en/styleguide/components/dimensions.md
sed -i '' 's/site.tags/site.dimensions/g' ./pages/en/styleguide/components/dimensions.md
sed -i '' 's/page.tags/page.dimensions/g' ./pages/en/styleguide/components/dimensions.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./pages/en/styleguide/components/dimensions.md
sed -i '' 's/class="([^"]*)tag([^"]*)"/class="\1dimension\2"/g' ./pages/en/styleguide/components/cards.md
sed -i '' 's/class="([^"]*)tag--([^"]*)"/class="\1dimension--\2"/g' ./pages/en/styleguide/components/cards.md
sed -i '' 's/class="([^"]*)tag__([^"]*)"/class="\1dimension__\2"/g' ./pages/en/styleguide/components/cards.md
sed -i '' 's/class="([^"]*)-tag([^"]*)"/class="\1-dimension\2"/g' ./pages/en/styleguide/components/cards.md
sed -i '' 's/class="([^"]*)tag-([^"]*)"/class="\1dimension-\2"/g' ./pages/en/styleguide/components/cards.md
sed -i '' 's/{%\s*for\s+tag\s+in/{% for dimension in/g' ./pages/en/styleguide/components/cards.md
sed -i '' 's/{%\s*assign\s+tags/{% assign dimensions/g' ./pages/en/styleguide/components/cards.md
sed -i '' 's/include[^}]*tag-([^}]*)/include dimension-\1/g' ./pages/en/styleguide/components/cards.md
sed -i '' 's/site.tags/site.dimensions/g' ./pages/en/styleguide/components/cards.md
sed -i '' 's/page.tags/page.dimensions/g' ./pages/en/styleguide/components/cards.md
sed -i '' 's/include[^}]*tag_([^}]*)/include dimension_\1/g' ./pages/en/styleguide/components/cards.md
