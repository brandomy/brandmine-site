# 2025-03-11 Multilingual Newsletter Implementation

## Problem Statement

The Brandmine website needed to provide language-specific newsletter signup forms for each supported language (English, Russian, and Chinese). The existing implementation had only an English form embedded in the footer across all language versions of the site.

## Approach

After analyzing the options, we decided to implement multiple language-specific forms using:

1. **Separate Mailerlite forms** - Create dedicated forms for each language with appropriate translations
2. **Jekyll Liquid conditionals** - Display the correct form based on the current page language
3. **Consistent styling** - Maintain the existing CSS styling across all language variations

This approach was chosen over alternatives like JavaScript-based translations because it:
- Provides full control over form elements in each language through the Mailerlite interface
- Allows language-specific success messages and confirmation emails
- Enables tracking of subscribers by language
- Avoids issues with asynchronous loading and manipulation of form elements

## Implementation

### 1. Form Creation in Mailerlite

Three separate forms were created in Mailerlite:
- English form (ID: `480swE`)
- Russian form (ID: `WVRNPI`)
- Chinese form (ID: `WRga0a`)

Each form was configured with appropriate language text for:
- Form headings and descriptions
- Input field labels and placeholders
- Submit button text
- Success messages
- Privacy notices

### 2. Code Changes

The footer template (`footer.html`) was updated to conditionally display the appropriate form based on the page language:

```html
<div class="newsletter-container">
  {% if page.lang == 'ru' %}
    <div class="ml-embedded" data-form="WVRNPI"></div>
  {% elsif page.lang == 'zh' %}
    <div class="ml-embedded" data-form="WRga0a"></div>
  {% else %}
    <div class="ml-embedded" data-form="480swE"></div>
  {% endif %}
</div>
```

The universal Mailerlite JavaScript remained unchanged in the `default.html` layout:

```html
<!-- MailerLite Universal -->
<script>
  (function(w,d,e,u,f,l,n){w[f]=w[f]||function(){(w[f].q=w[f].q||[])
  .push(arguments);},l=d.createElement(e),l.async=1,l.src=u,
  n=d.getElementsByTagName(e)[0],n.parentNode.insertBefore(l,n);})
  (window,document,'script','https://assets.mailerlite.com/js/universal.js','ml');
  ml('account', '1377139');
</script>
<!-- End MailerLite Universal -->
```

### 3. Language Translations

#### Newsletter Form Text

| Element | English | Russian | Chinese |
|---------|---------|---------|---------|
| Heading | Stay Connected | Оставайтесь на связи | 保持联系 |
| Description | Get the latest updates on emerging BRICS+ brands. | Получайте последние новости о развивающихся брендах стран БРИКС+. | 获取有关新兴金砖国家+品牌的最新动态。 |
| Email placeholder | Your email | Ваш электронный адрес | 您的电子邮箱 |
| Subscribe button | Subscribe | Подписаться | 订阅 |
| Privacy notice | By subscribing, you agree to receive marketing emails from Brandmine | Подписываясь, вы соглашаетесь получать маркетинговые письма от Brandmine | 通过订阅，您同意接收来自Brandmine的营销电子邮件 |

#### Success Messages

| Element | English | Russian | Chinese |
|---------|---------|---------|---------|
| Thank you message | Thank you! | Спасибо! | 谢谢！ |
| Confirmation | You have successfully joined our subscriber list. | Вы успешно присоединились к нашему списку подписчиков. | 您已成功加入我们的订阅者名单。 |

### 4. Error Messages

| Element | English | Russian | Chinese |
|---------|---------|---------|---------|
| Required field | This field is required | Это поле обязательно для заполнения | 此字段为必填项 |
| Invalid email | Enter a valid email | Введите действительный электронный адрес | 请输入有效的电子邮箱 |

## Key Insights and Learning Points

### Liquid Syntax in Jekyll

Liquid is the templating language used by Jekyll that enables dynamic content generation in static sites. Key aspects we utilized:

1. **Conditional logic** with `{% if %}`, `{% elsif %}`, and `{% endif %}` tags to select the appropriate form based on the page language.

2. **Variable access** using `{{ }}` syntax to check the current page language (`page.lang`).

3. **Default behavior** by using the `else` clause in our conditional to handle any undefined languages or edge cases.

### Jekyll Multilingual Site Structure

The implementation relies on the existing multilingual structure where:

1. Each page has a `lang` variable in its front matter that identifies its language.

2. Pages are organized in language-specific directories (`/en/`, `/ru/`, `/zh/`).

3. Default language settings are configured in `_config.yml` to automatically set the language based on file location.

### Mailerlite Integration

The implementation maintains a single universal JavaScript loader while allowing multiple form embeds. This approach:

1. Minimizes JavaScript overhead (one loader for all forms)
2. Simplifies maintenance (one account connection point)
3. Enables tracking multiple forms through a single analytics interface

## Next Actions and Open Items

1. **Testing**: Thoroughly test the forms in all three languages to ensure:
   - Forms display correctly on all device sizes
   - Submissions are recorded properly in Mailerlite
   - Success messages appear in the correct language

2. **Analytics setup**: Configure Mailerlite segments based on form submissions to track subscriber language preferences.

3. **Future enhancement**: Consider implementing a language preference toggle that allows users to switch languages while maintaining their form input.

4. **Documentation**: Update the Brandmine development documentation to note the multilingual newsletter implementation and the form IDs used.

## Resources

- Mailerlite Dashboard: https://dashboard.mailerlite.com/
- Form IDs:
  - English: `480swE`
  - Russian: `WVRNPI`
  - Chinese: `WRga0a`
- Jekyll Documentation on Liquid: https://jekyllrb.com/docs/liquid/
