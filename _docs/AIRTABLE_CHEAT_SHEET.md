# Airtable Setup Cheat Sheet - Brandmine Forms

Quick reference guide for connecting your forms to Airtable.

## 🚀 Quick Setup (30 minutes)

### Step 1: Create Airtable Base
1. Go to [airtable.com](https://airtable.com) → Create new base
2. Name it "Brandmine Data Hub"
3. Create these tables (see structures below)

### Step 2: Get API Credentials
1. Visit [airtable.com/create/tokens](https://airtable.com/create/tokens)
2. Click "Create new token"
3. Name: "Brandmine Website"
4. Scopes: `data:records:read`, `data:records:write`
5. Add access to "Brandmine Data Hub" base
6. **Copy token** (starts with `pat...`)

### Step 3: Get Base & Table IDs
1. Go to [airtable.com/api](https://airtable.com/api)
2. Click your "Brandmine Data Hub" base
3. Copy Base ID (starts with `app...`)
4. Copy Table IDs from API docs (start with `tbl...`)

### Step 4: Environment Setup
Add to your `.env` file:
```bash
AIRTABLE_PERSONAL_ACCESS_TOKEN=pat1234567890abcdef
AIRTABLE_BASE_ID=app1234567890abcdef
AIRTABLE_CONTACTS_TABLE_ID=tbl1234567890abcdef
AIRTABLE_BRANDS_TABLE_ID=tbl1234567890abcdef
AIRTABLE_PARTNERSHIPS_TABLE_ID=tbl1234567890abcdef
```

## 📋 Required Tables

### Table 1: Contact Forms
| Field | Type | Options |
|-------|------|---------|
| Name | Single line text | Required |
| Email | Email | Required |
| Subject | Single line text | |
| Message | Long text | Required |
| Form Type | Single select | General, Media, Support |
| Date | Date | Auto-fill with TODAY() |
| Status | Single select | New, In Progress, Resolved |
| Language | Single select | English, Russian, Chinese |

### Table 2: Brand Submissions  
| Field | Type | Options |
|-------|------|---------|
| Brand Name | Single line text | Required |
| Contact Name | Single line text | Required |
| Contact Email | Email | Required |
| Company | Single line text | |
| Country | Single select | All BRICS+ countries |
| Sector | Single select | Wine, Spirits, Food, etc. |
| Website | URL | |
| Description | Long text | Required |
| Why Brandmine | Long text | |
| Revenue Range | Single select | <$1M, $1M-$10M, $10M+ |
| Founding Year | Number | |
| Submission Date | Date | Auto-fill |
| Status | Single select | New, Reviewing, Approved, Declined |
| Data Level | Single select | 0-Basic, 1-Profiled, 2-Featured |

### Table 3: Partnership Inquiries
| Field | Type | Options |
|-------|------|---------|
| Organization | Single line text | Required |
| Contact Name | Single line text | Required |
| Contact Email | Email | Required |
| Partnership Type | Single select | Investment, Media, Distribution, Tech |
| Description | Long text | Required |
| Budget Range | Single select | <$10K, $10K-$50K, $50K+ |
| Timeline | Single select | Immediate, 1-3mo, 3-6mo, 6mo+ |
| Date | Date | Auto-fill |
| Status | Single select | New, Qualified, In Discussion, Closed |

### Table 4: Brand Database (Level 0)
| Field | Type | Options |
|-------|------|---------|
| Brand Name EN | Single line text | Required |
| Brand Name RU | Single line text | |
| Brand Name ZH | Single line text | |
| Slug | Single line text | Auto-generated |
| Country | Single select | All BRICS+ countries |
| City | Single line text | |
| Region | Single line text | |
| Sector | Single select | Wine, Spirits, Food, etc. |
| Founding Year | Number | |
| Website | URL | |
| Description EN | Long text | |
| Description RU | Long text | |
| Description ZH | Long text | |
| Data Level | Single select | 0-Basic, 1-Profiled, 2-Featured |
| Featured | Checkbox | |
| Status | Single select | Draft, Published, Archived |
| Last Updated | Date | Auto-fill |

## 🔌 Netlify Functions

### Create Functions Directory
```bash
mkdir netlify/functions
```

### Contact Form Handler
File: `netlify/functions/contact.js`
```javascript
const Airtable = require('airtable');
const base = new Airtable({apiKey: process.env.AIRTABLE_PERSONAL_ACCESS_TOKEN}).base(process.env.AIRTABLE_BASE_ID);

exports.handler = async (event, context) => {
  if (event.httpMethod !== 'POST') {
    return { statusCode: 405, body: JSON.stringify({ error: 'Method not allowed' }) };
  }

  try {
    const data = JSON.parse(event.body);
    
    const record = await base(process.env.AIRTABLE_CONTACTS_TABLE_ID).create({
      'Name': data.name,
      'Email': data.email,
      'Subject': data.subject || 'Website Contact',
      'Message': data.message,
      'Form Type': data.formType || 'General',
      'Language': data.language || 'English',
      'Status': 'New'
    });

    return {
      statusCode: 200,
      body: JSON.stringify({ success: true, message: 'Message sent successfully!' })
    };
  } catch (error) {
    return {
      statusCode: 500,
      body: JSON.stringify({ error: 'Failed to send message' })
    };
  }
};
```

### Brand Submission Handler
File: `netlify/functions/brand-submission.js`
```javascript
const Airtable = require('airtable');
const base = new Airtable({apiKey: process.env.AIRTABLE_PERSONAL_ACCESS_TOKEN}).base(process.env.AIRTABLE_BASE_ID);

exports.handler = async (event, context) => {
  if (event.httpMethod !== 'POST') {
    return { statusCode: 405, body: JSON.stringify({ error: 'Method not allowed' }) };
  }

  try {
    const data = JSON.parse(event.body);
    
    const record = await base(process.env.AIRTABLE_BRANDS_TABLE_ID).create({
      'Brand Name': data.brandName,
      'Contact Name': data.contactName,
      'Contact Email': data.contactEmail,
      'Company': data.company,
      'Country': data.country,
      'Sector': data.sector,
      'Website': data.website,
      'Description': data.description,
      'Why Brandmine': data.whyBrandmine,
      'Status': 'New',
      'Data Level': '0-Basic'
    });

    return {
      statusCode: 200,
      body: JSON.stringify({ success: true, message: 'Brand submitted successfully!' })
    };
  } catch (error) {
    return {
      statusCode: 500,
      body: JSON.stringify({ error: 'Failed to submit brand' })
    };
  }
};
```

## 🧪 Testing

### 1. Test Forms Page
Visit: `/en/test-forms/` to test all forms

### 2. Check Airtable
Verify submissions appear in your tables

### 3. Debug Issues
Check Netlify function logs:
```bash
netlify dev
# Submit forms and check console
```

## 🔧 Common Issues

**403 Forbidden**: Check API token permissions
**404 Table not found**: Verify table IDs
**422 Invalid data**: Check required fields match
**Rate limited**: Add delays between requests

## 📊 Views to Create

### Contact Forms View
- Filter: Status = "New"
- Sort: Date (newest first)
- Fields: Name, Email, Subject, Form Type, Date

### Brand Submissions View  
- Filter: Status = "New"
- Sort: Submission Date (newest first)
- Fields: Brand Name, Contact Name, Country, Sector, Status

### Partnership Pipeline
- Filter: Status ≠ "Closed"
- Sort: Status, then Date
- Fields: Organization, Partnership Type, Budget Range, Status

### Brand Database View
- Filter: Status = "Published"
- Sort: Last Updated (newest first)
- Group by: Data Level

## 🚀 Next Steps

1. Set up automated JSON export from Airtable
2. Create bulk import script for existing brand data
3. Build automated profile generation for Level 0 brands
4. Set up data validation rules
5. Create team workflows for data review

**Total setup time: ~30 minutes**
**Forms will be live and storing data in Airtable immediately!**