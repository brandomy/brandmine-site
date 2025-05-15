# Development Journal: Multilingual Tally Form Integration

**Date: March 12, 2025**

## 1. Problem Statement

We needed to integrate the Tally contact form into the Brandmine website's About page with several specific requirements:

- **Visibility issue**: Understanding how the form would display against the teal background of the Contact section
- **Multilingual support**: The form needed to be available in all three supported languages (English, Russian, Chinese)
- **Styling limitations**: We encountered challenges because Tally forms are embedded in iframes
- **Technical constraints**: We were using the free tier of Tally, which has limited customization options

## 2. Approach

After exploring several options, we implemented a solution focusing on:

1. **Multilingual form creation**: Create separate Tally forms for each language
2. **Minimal styling**: Work within Tally's default styling limitations
3. **Language-specific forms**: Embed the appropriate form based on page language

This approach allowed us to:
- Work within the limitations of Tally's free tier
- Provide language support for all users
- Create a flexible system that can be easily updated

## 3. Implementation Details

### 3.1 Form Integration

We embedded the Tally form directly in the About page:

```html
<!-- Contact Form Container -->
<div class="contact-form-container">
  <!-- Tally form with full Tally parameters -->
  <iframe data-tally-src="https://tally.so/embed/3qvVaY?alignLeft=1&hideTitle=0&transparentBackground=0&dynamicHeight=1" loading="lazy" width="100%" height="400" frameborder="0" marginheight="0" marginwidth="0" title="Contact Form"></iframe>
  
  <script>var d=document,w="https://tally.so/widgets/embed.js",v=function(){"undefined"!=typeof Tally?Tally.loadEmbeds():d.querySelectorAll("iframe[data-tally-src]:not([src])").forEach((function(e){e.src=e.dataset.tallySrc}))};if("undefined"!=typeof Tally)v();else if(d.querySelector('script[src="'+w+'"]')==null){var s=d.createElement("script");s.src=w,s.onload=v,s.onerror=v,d.body.appendChild(s);}</script>
</div>
```

### 3.2 Tally Configuration Parameters

Key Tally URL parameters used:
- `alignLeft=1`: Align form contents to the left
- `hideTitle=0`: Keep the form title visible (as per your preference)
- `transparentBackground=0`: Use a white background for the form
- `dynamicHeight=1`: Allow the form to adjust its height based on content

### 3.3 Multilingual Form Setup

Each language version used its own dedicated Tally form with language-appropriate labels and text:

**English**: `https://tally.so/r/3qvVaY`
**Russian**: `https://tally.so/r/wov08x`
**Chinese**: `https://tally.so/r/nG5oOk`

## 4. Decisions Made

### 4.1 Styling Approach

Due to Tally's iframe and free tier limitations, we were unable to implement custom styling. We accepted the default Tally form styling, focusing instead on:
- Proper form functionality
- Language-specific form creation
- Consistent form availability across language versions

### 4.2 Multilingual Implementation

We created separate Tally forms for each language to ensure:
- Native language labels and placeholders
- Language-specific validation messages
- Customized field types for each language if needed

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

Key technical concepts learned:
- **iframes and limitations**: Tally forms in iframes have restricted styling options
- **Multilingual form strategies**: Creating language-specific forms provides better localization
- **Minimal customization**: Working within platform constraints requires flexibility

### 6.2 Multilingual Implementation

Lessons about multilingual integration:
- Different languages require nuanced form approaches
- Language-specific forms allow for more natural user experience
- Maintaining consistent form functionality across languages is crucial

## 7. Next Actions

### 7.1 Immediate Next Steps

- [ ] Test all forms to ensure proper submission and validation
- [ ] Check mobile display of forms across different device sizes
- [ ] Verify form accessibility and readability
- [ ] Set up proper form submission notifications

### 7.2 Future Enhancements to Consider

- [ ] Explore Tally Pro upgrade for enhanced capabilities
- [ ] Consider alternative form solutions if limitations persist
- [ ] Add analytics tracking to form submissions
- [ ] Implement form success tracking by language

### 7.3 Open Questions

- How will form data be processed and integrated with CRM systems?
- What additional form fields might provide valuable segmentation data?
- How can we improve form user experience within Tally's constraints?

This implementation provides a foundational approach to multilingual user engagement while working within the current technical limitations.