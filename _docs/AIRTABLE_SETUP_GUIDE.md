# Airtable Integration Setup Guide

Complete guide for setting up Airtable as your form data backend.

## 1. Airtable Base Setup

### Create Base Structure
Create a new Airtable base called "Brandmine Forms" with these tables:

#### Table 1: Contacts
| Field Name | Field Type | Description |
|------------|------------|-------------|
| Name | Single line text | Contact's full name |
| Email | Email | Contact's email address |
| Subject | Single line text | Message subject |
| Message | Long text | Full message content |
| Form Type | Single select | Options: General, Support, Media |
| Submission Date | Date | Auto-filled submission timestamp |
| Status | Single select | Options: New, In Progress, Resolved |
| Language | Single select | Options: English, Russian, Chinese |
| IP Address | Single line text | For analytics (optional) |

#### Table 2: Brand Submissions
| Field Name | Field Type | Description |
|------------|------------|-------------|
| Brand Name | Single line text | Name of the brand |
| Contact Name | Single line text | Submitter's name |
| Contact Email | Email | Submitter's email |
| Company | Single line text | Company/organization |
| Country | Single select | Brand's country of origin |
| Sector | Single select | Industry sector |
| Website | URL | Brand's website |
| Description | Long text | Brand description |
| Why Brandmine | Long text | Why they want to be featured |
| Submission Date | Date | Auto-filled timestamp |
| Status | Single select | Options: New, Under Review, Approved, Declined |

#### Table 3: Partnership Inquiries
| Field Name | Field Type | Description |
|------------|------------|-------------|
| Organization | Single line text | Partner organization name |
| Contact Name | Single line text | Contact person's name |
| Contact Email | Email | Contact email |
| Partnership Type | Single select | Options: Investment, Distribution, Media, Technology |
| Description | Long text | Partnership proposal details |
| Budget Range | Single select | Options: <$10K, $10K-$50K, $50K-$100K, $100K+ |
| Timeline | Single select | Options: Immediate, 1-3 months, 3-6 months, 6+ months |
| Submission Date | Date | Auto-filled timestamp |
| Status | Single select | Options: New, Qualified, In Discussion, Closed |

#### Table 4: Newsletter Subscriptions
| Field Name | Field Type | Description |
|------------|------------|-------------|
| Email | Email | Subscriber email |
| Language | Single select | Preferred language |
| Subscription Date | Date | Auto-filled timestamp |
| Source | Single line text | How they found us |
| Status | Single select | Options: Active, Unsubscribed |
| Interests | Multiple select | Options: Brands, Founders, Markets, Insights |

## 2. API Access Setup

### Step 1: Create Personal Access Token
1. Go to [airtable.com/create/tokens](https://airtable.com/create/tokens)
2. Click "Create new token"
3. Name it "Brandmine Website Forms"
4. Add these scopes:
   - `data:records:read`
   - `data:records:write`
   - `schema:bases:read`
5. Add access to your "Brandmine Forms" base
6. Click "Create token"
7. **Copy and save the token securely**

### Step 2: Get Base and Table IDs
1. Go to [airtable.com/api](https://airtable.com/api)
2. Click on your "Brandmine Forms" base
3. Copy the Base ID (starts with `app...`)
4. For each table, copy the Table ID from the API documentation

## 3. Environment Variables Setup

Create a `.env` file in your project root:

```bash
# Airtable Configuration
AIRTABLE_PERSONAL_ACCESS_TOKEN=patxxxxxxxxxxxxx
AIRTABLE_BASE_ID=appxxxxxxxxxxxxx
AIRTABLE_CONTACTS_TABLE_ID=tblxxxxxxxxxxxxx
AIRTABLE_BRANDS_TABLE_ID=tblxxxxxxxxxxxxx
AIRTABLE_PARTNERSHIPS_TABLE_ID=tblxxxxxxxxxxxxx
AIRTABLE_NEWSLETTER_TABLE_ID=tblxxxxxxxxxxxxx

# Site Configuration (for form processing)
SITE_URL=https://yourdomain.com
ADMIN_EMAIL=admin@yourdomain.com
```

## 4. Netlify Functions Setup

### Step 1: Install Dependencies
```bash
npm install @airtable/airtable node-fetch
```

### Step 2: Create Netlify Functions Directory
```bash
mkdir netlify/functions
```

### Step 3: Contact Form Handler
Create `netlify/functions/contact.js`:

```javascript
const Airtable = require('airtable');

const base = new Airtable({
  apiKey: process.env.AIRTABLE_PERSONAL_ACCESS_TOKEN
}).base(process.env.AIRTABLE_BASE_ID);

exports.handler = async (event, context) => {
  // Only allow POST requests
  if (event.httpMethod !== 'POST') {
    return {
      statusCode: 405,
      body: JSON.stringify({ error: 'Method not allowed' })
    };
  }

  try {
    const formData = JSON.parse(event.body);
    
    // Validate required fields
    if (!formData.name || !formData.email || !formData.message) {
      return {
        statusCode: 400,
        body: JSON.stringify({ error: 'Missing required fields' })
      };
    }

    // Create record in Airtable
    const record = await base(process.env.AIRTABLE_CONTACTS_TABLE_ID).create({
      'Name': formData.name,
      'Email': formData.email,
      'Subject': formData.subject || 'Website Contact',
      'Message': formData.message,
      'Form Type': formData.formType || 'General',
      'Submission Date': new Date().toISOString(),
      'Status': 'New',
      'Language': formData.language || 'English'
    });

    return {
      statusCode: 200,
      headers: {
        'Access-Control-Allow-Origin': '*',
        'Access-Control-Allow-Headers': 'Content-Type',
      },
      body: JSON.stringify({ 
        success: true, 
        message: 'Thank you for your message!',
        recordId: record.id 
      })
    };

  } catch (error) {
    console.error('Error creating record:', error);
    return {
      statusCode: 500,
      body: JSON.stringify({ 
        error: 'Failed to submit form. Please try again.' 
      })
    };
  }
};
```

### Step 4: Brand Submission Handler
Create `netlify/functions/brand-submission.js`:

```javascript
const Airtable = require('airtable');

const base = new Airtable({
  apiKey: process.env.AIRTABLE_PERSONAL_ACCESS_TOKEN
}).base(process.env.AIRTABLE_BASE_ID);

exports.handler = async (event, context) => {
  if (event.httpMethod !== 'POST') {
    return {
      statusCode: 405,
      body: JSON.stringify({ error: 'Method not allowed' })
    };
  }

  try {
    const formData = JSON.parse(event.body);
    
    // Validate required fields
    if (!formData.brandName || !formData.contactName || !formData.contactEmail) {
      return {
        statusCode: 400,
        body: JSON.stringify({ error: 'Missing required fields' })
      };
    }

    // Create record in Airtable
    const record = await base(process.env.AIRTABLE_BRANDS_TABLE_ID).create({
      'Brand Name': formData.brandName,
      'Contact Name': formData.contactName,
      'Contact Email': formData.contactEmail,
      'Company': formData.company,
      'Country': formData.country,
      'Sector': formData.sector,
      'Website': formData.website,
      'Description': formData.description,
      'Why Brandmine': formData.whyBrandmine,
      'Submission Date': new Date().toISOString(),
      'Status': 'New'
    });

    return {
      statusCode: 200,
      headers: {
        'Access-Control-Allow-Origin': '*',
        'Access-Control-Allow-Headers': 'Content-Type',
      },
      body: JSON.stringify({ 
        success: true, 
        message: 'Brand submission received! We\'ll review and get back to you.',
        recordId: record.id 
      })
    };

  } catch (error) {
    console.error('Error creating brand submission:', error);
    return {
      statusCode: 500,
      body: JSON.stringify({ 
        error: 'Failed to submit brand. Please try again.' 
      })
    };
  }
};
```

## 5. Frontend Form Integration

### Update Form Components
Modify your form components to POST to the Netlify functions:

```javascript
// Example form submission handler
async function handleFormSubmit(formData, endpoint) {
  try {
    const response = await fetch(`/.netlify/functions/${endpoint}`, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify(formData)
    });

    const result = await response.json();
    
    if (response.ok) {
      showSuccessMessage(result.message);
    } else {
      showErrorMessage(result.error);
    }
  } catch (error) {
    showErrorMessage('Network error. Please try again.');
  }
}
```

## 6. Testing Checklist

- [ ] Test each form with valid data
- [ ] Test form validation (empty fields, invalid emails)
- [ ] Verify data appears correctly in Airtable
- [ ] Test error handling (invalid API keys, network issues)
- [ ] Test rate limiting and spam protection
- [ ] Test on mobile devices
- [ ] Test in all supported languages

## 7. Security & Privacy

### GDPR Compliance
- Add privacy policy links to all forms
- Include data processing consent checkboxes
- Implement data retention policies in Airtable

### Spam Protection
- Add honeypot fields to forms
- Implement rate limiting
- Use reCAPTCHA for high-risk forms

### Data Security
- Never expose API keys in frontend code
- Use HTTPS for all form submissions
- Regularly rotate access tokens
- Monitor API usage for anomalies

## 8. Monitoring & Analytics

### Airtable Views
Create filtered views for:
- New submissions (last 24 hours)
- Pending brand reviews
- Active partnerships
- Newsletter growth metrics

### Integration Monitoring
- Set up error logging for failed submissions
- Monitor API rate limits
- Track form conversion rates
- Set up alerts for high-value submissions (partnerships, brand submissions)

## 9. Deployment

### Netlify Configuration
Add environment variables in Netlify dashboard:
1. Go to Site Settings > Environment Variables
2. Add all the variables from your `.env` file
3. Deploy your site

### Testing Production
1. Use the test forms page: `/en/test-forms/`
2. Submit test data to each form
3. Verify data appears in Airtable
4. Test error scenarios

Your forms are now fully integrated with Airtable as your single source of truth!