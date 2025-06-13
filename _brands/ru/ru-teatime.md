---
layout: brand-profile
ref: ru-teatime  # Global ID (country-brandslug format)
title: "TeaTime"  # Display name, fallback if JSON lookup fails
description: "Премиальное чайное заведение Москвы, предлагающее ремесленные чайные смеси и исключительные чайные церемонии в современной обстановке с традиционным русским влиянием."
slogan: "Чайные традиции с русской душой"  # Optional
lang: ru
permalink: /ru/brands/ru-teatime/

# JSON Generation Control
generate_json: true  # Set to true to include in brands.json output
sample_data: true    # Flag for sample/test data

# === SECTION CONTROL (CRITICAL - Drives page layout) ===
sections:
  - breadcrumbs           # Navigation breadcrumbs
  - identity              # Brand hero, logo, basic info (replaces hero)
  - founder-narrative     # Founder story and journey
  - content              # Markdown content area (NEW - enables rich content)
  - business-intelligence # Business signals and opportunities
  - location-intelligence # Map and geographic context
  - connections          # Related brands and insights

# === CORE INFORMATION ===
# Basic Information
founding_year: 1998
website: "https://teatime.ru"
email: "info@teatime.ru"  # Optional contact email
founders: ["ru-alexei-sokolov"]  # Array of founder keys for JSON lookup
founder_led: true  # Boolean: Is the founder still actively leading?

# Taxonomy
sectors: ["gourmet-foods"]  # From existing taxonomy
markets: ["russia"]  # From existing taxonomy
attributes: ["founder-led", "artisanal-excellence"]  # Optional attributes
signals: ["export-ready"]  # Optional signals

# Display Options
featured: true
featured_level: 2  # 0=basic listing, 1=standard featured, 2=premium featured

# === LOCATION (Structured for collection-image compatibility) ===
location:
  lat: 55.7558  # Latitude coordinate
  lng: 37.6173  # Longitude coordinate
  city: "Москва"  # City name (translatable)
  region: "Московская область"  # Region/state/province (translatable, optional)
  country: "ru"  # ISO country code

# === IMAGES (Semantic structure that works with collection-image) ===
images:
  logo:
    name: "color"     # Becomes logo-color-400w.png
    ext: "png"
    alt: "Логотип TeaTime с элегантной кириллической надписью и орнаментальным дизайном чайника в традиционном русском стиле"
  hero:
    name: "storefront"  # Becomes hero-tearoom-400w.jpg
    ext: "jpg"
    alt: "Флагманская чайная TeaTime в историческом районе Арбат в Москве с большими окнами, демонстрирующими традиционную русскую чайную сервировку и теплое окружающее освещение"
  founder:
    name: "portrait"    # Becomes founder-portrait-400w.jpg
    ext: "jpg"
    alt: "Алексей Соколов, основатель TeaTime, готовит традиционную русскую чайную церемонию с антикварным латунным самоваром в элегантной обстановке чайной"

# Location - Flat structure for Airtable integration
location_lng: 37.6173  # Longitude coordinate
location_lat: 55.7558  # Latitude coordinate
location_city: "Москва"  # trx
location_region: "Московская область"  # trx (optional)
location_country: "ru"  # ISO country code
---

## О бренде TeaTime

TeaTime зарекомендовал себя как премиальный московский чайный бренд, предлагающий исключительные чайные смеси, которые сочетают традиционную русскую чайную культуру с современными вкусами и подачей. Основанный в конце 1990-х годов во время культурного возрождения Москвы, бренд быстро получил признание за тщательный подбор сырья и инновационный подход к традиционной чайной церемонии.

## Путь основателя

Алексей Соколов открыл свою страсть к чаю во время путешествий по Китаю и Индии в молодости. Вернувшись в Москву с обширными знаниями о выращивании и приготовлении чая, он основал TeaTime с видением поднять русскую чайную культуру на новый уровень. Его опыт в бизнесе и кулинарном искусстве сформировал уникальный подход бренда к чаю как к премиальному продукту и захватывающему культурному опыту.

## Присутствие на рынке

Бренд управляет тремя флагманскими чайными домами в культурных районах Москвы, а также развивающимся оптовым бизнесом, поставляющим продукцию в премиальные отели и рестораны по всей России. В последнее время TeaTime начал расширяться на международные рынки, фокусируясь на премиальных универмагах и специализированных продуктовых ритейлерах в Европе и Азии. Характерная упаковка бренда и аутентичное повествование о русской чайной культуре особенно хорошо резонируют с потребителями, стремящимися к подлинному культурному опыту.
