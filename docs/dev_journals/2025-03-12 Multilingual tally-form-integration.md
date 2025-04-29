# Development Journal: Multilingual Tally Form Integration

**Date: March 12, 2025**

## 1. Problem Statement

We needed to integrate the Tally contact form into the Brandmine website's About page with several specific requirements:

- **Visibility issue**: The default form had poor contrast when displayed against the teal background of the Contact section
- **Multilingual support**: The form needed to be available in all three supported languages (English, Russian, Chinese)
- **Styling limitations**: We encountered challenges because Tally forms are embedded in iframes, which limit CSS customization options
- **Technical constraints**: We were using the free tier of Tally, which doesn't allow custom CSS

## 2. Approach

After exploring several options, we implemented a three-part solution:

1. **Container styling**: Create a styled container around the Tally iframe to improve visual presentation
2. **External CSS file**: Create a dedicated `tally-styles.css` file for easy switching between styling approaches
3. **Language-specific forms**: Create separate Tally forms for each language and embed the appropriate form based on page language

This approach allowed us to:
- Work within the limitations of Tally's free tier
- Provide a consistent look and feel across the site
- Maintain proper language support for all users
- Create a flexible system that can be easily updated

## 3. Implementation Details

### 3.1 Container Styling

We created a container with a soft teal-gray background to improve the form's visual contrast:

```css
/* Soft teal-gray container */
.contact-form-container {
  background-color: #E6EEEF; /* Soft teal-gray */
  border-radius: 8px;
  padding: 24px;
  margin: 2rem 0;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
}

.contact-form-container iframe {
  border: none;
  background: transparent;
}
```

### 3.2 Form Integration

We replaced the placeholder button in the About page with the actual Tally form embed:

```html
<!-- Contact Form Container -->
<div class="contact-form-container">
  <!-- Link to external Tally styles -->
  <link rel="stylesheet" href="{{ '/assets/css/tally-styles.css' | relative_url }}">
  
  <!-- Tally form with proper parameters -->
  <iframe data-tally-src="https://tally.so/embed/3qvVaY?alignLeft=1&hideTitle=1&transparentBackground=0&dynamicHeight=1" loading="lazy" width="100%" height="400" frameborder="0" marginheight="0" marginwidth="0" title="Contact Form"></iframe>
  
  <script>var d=document,w="https://tally.so/widgets/embed.js",v=function(){"undefined"!=typeof Tally?Tally.loadEmbeds():d.querySelectorAll("iframe[data-tally-src]:not([src])").forEach((function(e){e.src=e.dataset.tallySrc}))};if("undefined"!=typeof Tally)v();else if(d.querySelector('script[src="'+w+'"]')==null){var s=d.createElement("script");s.src=w,s.onload=v,s.onerror=v,d.body.appendChild(s);}</script>
</div>
```

### 3.3 Tally Configuration Parameters

Key Tally URL parameters used:
- `alignLeft=1`: Align form contents to the left
- `hideTitle=1`: Hide the default form title
- `transparentBackground=0`: Use a white background for the form
- `dynamicHeight=1`: Allow the form to adjust its height based on content

### 3.4 Multilingual Form Setup

Each language version used its own dedicated Tally form with language-appropriate labels and text:

**English**: `https://tally.so/r/3qvVaY`
**Russian**: `https://tally.so/r/wov08x`
**Chinese**: `https://tally.so/r/nG5oOk`

## 4. Decisions Made

### 4.1 Styling Approach

We explored three potential styling approaches:
1. ~~Improved contrast with current design~~ (ineffective due to iframe limitations)
2. **White card design with soft background** (chosen solution)
3. ~~Light teal background with dark text~~ (too similar to the page background)

We selected the white card design because:
- It provides clear visual separation from the background
- It maintains good readability for form fields
- It works well with Tally's iframe limitations
- It creates a consistent, card-based UI pattern throughout the site

### 4.2 CSS Implementation Strategy

We decided to use an external CSS file rather than inline styles because:
- It allows for easier testing of different styling approaches
- It maintains cleaner template code
- It centralizes styling rules for easier maintenance
- It follows the established pattern of separate concerns

### 4.3 Container Background Color

After testing several options, we selected a soft teal-gray background (#E6EEEF) because:
- It provides subtle contrast with the white form fields
- It complements the primary teal color scheme
- It creates visual distinction without being too stark

### 4.4 Multilingual Implementation

We decided to create separate Tally forms for each language rather than using a single form with JavaScript-based translations because:
- It allows for native language labels and placeholders
- It provides language-specific validation messages
- It enables customized field types for each language if needed
- It simplifies the implementation by leveraging Tally's built-in functionality

## 5. Resources

### 5.1 Translation Table

| English | Russian (RU) | Chinese (ZH) |
|---------|-------------|--------------|
| Contact Form | Контактная форма | 联系表单 |
| First name | Имя | 名字 |
| Your email | Ваш email | 您的邮箱 |
| Type of inquiry | Тип запроса | 咨询类型 |
| Partnership Opportunities | Возможности партнерства | 合作机会 |
| Brand Visibility | Видимость бренда | 品牌曝光 |
| Market Research | Исследование рынка | 市场研究 |
| General Inquiry | Общий запрос | 一般咨询 |
| Your question | Ваш вопрос | 您的问题 |
| Thanks for contacting us | Спасибо, что связались с нами | 感谢您与我们联系 |
| Submit | Отправить | 提交 |
| Thanks for completing this form! | Спасибо за заполнение формы! | 感谢您填写此表单！ |
| Made with Tally, the simplest way to create forms for free. | Сделано с помощью Tally, самый простой способ создавать формы бесплатно. | 使用Tally制作，最简单的免费创建表单方式。 |

### 5.2 Form URLs

- English form: `https://tally.so/r/3qvVaY`
- Russian form: `https://tally.so/r/wov08x`
- Chinese form: `https://tally.so/r/nG5oOk`

## 6. Insights & Learning

### 6.1 Technical Understanding

The key technical concepts we learned:

- **iframes and security**: iframes create a sandboxed environment for security reasons, which prevents CSS from the parent page from affecting elements inside
- **Tally implementation nuances**: Tally forms are loaded within iframes, requiring specific strategies for styling
- **CSS inheritance limitations**: External CSS cannot directly style iframe contents due to cross-origin restrictions
- **Tally URL parameters**: Tally provides URL parameters that can modify certain aspects of form appearance, which offers limited styling options

### 6.2 Design Considerations

Important design principles encountered:

- **Visual hierarchy**: Creating clear distinction between form elements and background
- **Contrast and readability**: Ensuring text is easy to read across all supported languages
- **Consistency across languages**: Maintaining a unified look while supporting language-specific requirements
- **Background color subtlety**: Using softened, complementary colors rather than stark contrasts

### 6.3 Multilingual Implementation

Lessons about multilingual integration:

- **Content segregation**: Creating separate language-specific forms allows for proper localization
- **Language-specific field validation**: Different languages have different requirements for field validation and error messages
- **Cultural appropriateness**: Field labels and placeholder text should feel natural in each language
- **Cross-browser consistency**: Testing that multilingual text displays properly across browsers and operating systems

## 7. Next Actions

### 7.1 Immediate Next Steps

- [ ] Test all forms to ensure proper submission and validation
- [ ] Check mobile display of forms across different device sizes
- [ ] Test RTL support for potential future language additions
- [ ] Set up proper form submission notifications to the appropriate team members

### 7.2 Future Enhancements to Consider

- [ ] Explore Tally Pro upgrade for enhanced styling capabilities if needed
- [ ] Consider custom form implementation if Tally limitations become problematic
- [ ] Add analytics tracking to form submissions to measure engagement
- [ ] Implement form success tracking to measure completion rates by language

### 7.3 Open Questions

- How will form data be processed and integrated with CRM or contact management systems?
- Should we add field validation for international phone numbers?
- Would additional form fields (company, location, etc.) provide valuable segmentation data?
- What is the best way to handle form submission notifications across different languages?

This implementation provides a solid foundation for multilingual user engagement while maintaining visual consistency across the Brandmine site.
