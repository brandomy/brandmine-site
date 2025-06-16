# Brandmine Feature Development Workflow Template

## Overview
This template guides the systematic development of new features using a four-step process: Strategy → Analysis → Review → Implementation across Claude Console and Code interfaces.

---

## STEP 1: Strategy Development (Claude Console)

### Initial Strategy Prompt
```
I want to add [FEATURE NAME] to Brandmine, my multilingual Jekyll site showcasing BRICS+ consumer brands.

Help me design the component/feature strategy including:

**Core Requirements:**
- Purpose and user experience goals
- Component specifications and parameters
- Data structure requirements
- Integration points with existing system
- Multilingual considerations (EN/RU/ZH)

**Design Considerations:**
- Alignment with existing card component system
- BEM CSS methodology compliance
- "Logic Light" architecture patterns
- Design token usage (primary teal, secondary orange, etc.)
- Mobile-first responsive design

**Documentation Needs:**
- Component usage examples
- Translation key requirements
- Testing scenarios

Then prepare a comprehensive brief for Claude Code to analyze implementation requirements.

**Context:** [PROVIDE SPECIFIC CONTEXT ABOUT THE FEATURE NEED]
```

### Strategy Session Checklist
- [ ] Feature purpose clearly defined
- [ ] User experience flow mapped
- [ ] Component specifications documented
- [ ] Data structure designed
- [ ] Integration points identified
- [ ] Implementation brief prepared for Code
- [ ] Session summary created

### Session End Template
```
Create a session summary with:
- Feature specifications finalized
- Key design decisions made
- Implementation brief prepared
- Next step: Handoff to Claude Code for codebase analysis

Save this summary for reference.
```

---

## STEP 2: Implementation Analysis (Claude Code)

### Code Analysis Prompt
```
**Project:** Brandmine - Multilingual Jekyll site (EN/RU/ZH)
**Task:** Analyze codebase for [FEATURE NAME] implementation
**Context:** [BRIEF CONTEXT FROM CONSOLE SESSION]

Please analyze the existing Brandmine codebase and create a comprehensive implementation checklist for [FEATURE NAME].

**Implementation Brief from Strategy Session:**
[PASTE COMPLETE BRIEF FROM CONSOLE]

**Required Analysis:**
1. **Component Integration** - Review existing patterns in _includes/components/
2. **CSS Architecture** - Examine assets/css/ structure and design tokens
3. **Data Structure** - Analyze current markdown/YAML patterns
4. **Template Integration** - Review layout and include patterns
5. **Translation System** - Check _data/translations/ requirements
6. **Documentation** - Identify docs needing updates

**Deliverable Required:**
Detailed implementation checklist organized by category with:
- Specific file paths for creation/modification
- Exact changes required in each file
- Dependencies and implementation order
- Testing steps and verification methods
- Sample content for testing

Analyze thoroughly and provide the complete action plan.
```

### Code Session Checklist
- [ ] Codebase thoroughly analyzed
- [ ] All integration points identified
- [ ] File modification list complete
- [ ] Dependencies mapped
- [ ] Implementation sequence planned
- [ ] Testing strategy defined
- [ ] Comprehensive checklist delivered

---

## STEP 3: Plan Review & Refinement (Claude Console)

### Review Prompt Template
```
Review this implementation plan from Claude Code for [FEATURE NAME]:

**Original Feature Goal:** [BRIEF SUMMARY]

**Implementation Plan from Code:**
[PASTE COMPLETE CHECKLIST FROM CODE]

**Review Requirements:**
Analyze for:
- **Completeness** - Are all necessary components covered?
- **Architecture Alignment** - Does it follow Brandmine patterns?
- **Integration Risks** - Any potential conflicts or issues?
- **Implementation Sequence** - Is the order logical and efficient?
- **Missing Elements** - What might have been overlooked?
- **Strategic Fit** - Does it align with business goals?

**Specific Considerations:**
- Multilingual implementation (EN/RU/ZH)
- Mobile-first responsive design
- Component reusability
- Future scalability
- Performance impact

Provide recommendations for plan refinement before implementation approval.
```

### Review Session Checklist
- [ ] Implementation plan thoroughly reviewed
- [ ] Completeness verified
- [ ] Risks and issues identified
- [ ] Sequence optimization suggested
- [ ] Strategic alignment confirmed
- [ ] Refinement recommendations provided
- [ ] Final approval criteria established

### Approval Decision Template
```
**Implementation Plan Status:** [APPROVED / NEEDS REVISION]

**If Approved:**
- Key strengths of the plan
- Any minor adjustments needed
- Implementation priority/timeline
- Success criteria defined

**If Needs Revision:**
- Specific issues identified
- Required changes
- Areas needing re-analysis

**Next Step:** [Proceed to Implementation / Return to Code for revision]
```

---

## STEP 4: Implementation Execution (Claude Code)

### Implementation Prompt Template
```
**Project:** Brandmine [FEATURE NAME] Implementation
**Status:** Approved for implementation

Execute the approved implementation plan:

**Final Approved Checklist:**
[PASTE FINAL APPROVED PLAN]

**Implementation Requirements:**
- Follow the checklist systematically
- Implement in the specified sequence
- Test each component as completed
- Provide progress updates for major milestones
- Report any issues encountered with solutions
- Verify multilingual functionality (EN/RU/ZH)
- Confirm responsive design implementation

**Reporting Format:**
For each major component:
1. Implementation status
2. Files created/modified
3. Testing results
4. Any issues and resolutions

Proceed with systematic implementation.
```

### Implementation Session Checklist
- [ ] Implementation plan executed systematically
- [ ] All specified files created/modified
- [ ] Component testing completed
- [ ] Integration testing verified
- [ ] Multilingual functionality confirmed
- [ ] Responsive design validated
- [ ] Documentation updated
- [ ] Final implementation report provided

---

## Workflow Management

### Session Transitions

**Console → Code Handoff:**
```
"Session Summary: [FEATURE] strategy complete. 
Implementation brief prepared.
Next: Code analysis and action plan development."
```

**Code → Console Handoff:**
```
"Implementation plan complete for [FEATURE].
Ready for strategic review and approval.
Plan attached for analysis."
```

**Console → Code Final Handoff:**
```
"Implementation approved for [FEATURE].
Final checklist provided.
Proceed with systematic execution."
```

### Conversation Capacity Management

**Monitor Usage:** Watch for 80% conversation capacity warnings

**Transition Strategy:**
- Complete current phase before transitioning
- Create comprehensive handoff summaries
- Ensure all critical information transfers
- Reference this template in new sessions

---

## Feature Types & Variations

### UI Components
Focus on: Component architecture, CSS integration, responsive design

### Data Features  
Focus on: YAML structure, collection integration, search functionality

### Content Types
Focus on: Template creation, translation structure, editorial workflow

### System Features
Focus on: Site architecture, performance, maintenance automation

---

## Success Criteria Template

**For Any Feature Implementation:**
- [ ] Follows existing Brandmine patterns
- [ ] Works across all languages (EN/RU/ZH)  
- [ ] Responsive design implemented
- [ ] Component documentation complete
- [ ] Translation keys added
- [ ] Testing completed successfully
- [ ] No breaking changes introduced
- [ ] Performance impact acceptable

---

## Quick Reference Commands

**Strategy:** `"Design [FEATURE] strategy and prepare Code brief"`
**Analysis:** `"Analyze implementation for [FEATURE] per attached brief"`  
**Review:** `"Review and refine this implementation plan: [PLAN]"`
**Implementation:** `"Execute approved plan: [CHECKLIST]"`

---

## Template Usage Notes

1. **Customize for Feature Type:** Adjust emphasis based on component vs. data vs. content features
2. **Scale for Complexity:** Simple features may skip formal review step
3. **Document Decisions:** Keep records of strategic choices for future reference
4. **Iterate as Needed:** Don't hesitate to cycle back if issues arise

This systematic approach ensures comprehensive feature development while leveraging each Claude interface's strengths.