#!/bin/bash
# =============================================================================
# migrate_dimensions_to_subdirectories.sh - Secure Dimensions Migration
# =============================================================================
# 
# PURPOSE:
#   Migrates dimensions from flat structure to subdirectory structure
#   to match brands/founders/insights architectural patterns
#
# BEFORE:
#   assets/images/dimensions/markets/russia-800w.jpg
#   assets/images/dimensions/markets/originals/russia.jpg
#
# AFTER:
#   assets/images/dimensions/markets/russia/russia-hero-kremlin-800w.jpg
#   assets/images/dimensions/markets/russia/originals/hero-kremlin.jpg
#
# SAFETY FEATURES:
#   - Dry-run mode to preview changes
#   - Creates backups before moving files
#   - Stage-by-stage execution with verification
#   - Rollback capability if issues occur
#
# =============================================================================

set -e  # Exit on any error

# Command line arguments
DRY_RUN=${1:-"--dry-run"}  # Default to dry-run for safety
STAGE=${2:-"all"}          # Which stage to execute

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# =============================================================================
# LOGGING AND SAFETY FUNCTIONS
# =============================================================================

log_info() {
    echo -e "${BLUE}ℹ️  INFO:${NC} $1"
}

log_success() {
    echo -e "${GREEN}✅ SUCCESS:${NC} $1"
}

log_warning() {
    echo -e "${YELLOW}⚠️  WARNING:${NC} $1"
}

log_error() {
    echo -e "${RED}❌ ERROR:${NC} $1"
}

create_backup() {
    local category=$1
    local backup_dir="assets/images/dimensions/${category}.backup.$(date +%Y%m%d_%H%M%S)"
    
    if [ "$DRY_RUN" = "--execute" ]; then
        log_info "Creating backup: $backup_dir"
        cp -r "assets/images/dimensions/$category" "$backup_dir"
        log_success "Backup created: $backup_dir"
    else
        log_info "DRY RUN: Would create backup: $backup_dir"
    fi
}

verify_prerequisites() {
    log_info "Verifying prerequisites..."
    
    # Check if we're in the right directory
    if [ ! -d "assets/images/dimensions" ]; then
        log_error "Not in Brandmine root directory or dimensions folder missing"
        exit 1
    fi
    
    # Check if directories exist
    for category in markets attributes signals; do
        if [ ! -d "assets/images/dimensions/$category" ]; then
            log_error "Category directory missing: assets/images/dimensions/$category"
            exit 1
        fi
    done
    
    log_success "Prerequisites verified"
}

# =============================================================================
# SEMANTIC CONTEXT MAPPING
# =============================================================================

get_semantic_context() {
    local dimension=$1
    local category=$2
    
    # Normalize dimension to lowercase for consistent matching
    local normalized_dimension=$(echo "$dimension" | tr '[:upper:]' '[:lower:]')
    
    case $category in
        "markets")
            case $normalized_dimension in
                "russia") echo "kremlin" ;;
                "china") echo "temple" ;;
                "brazil") echo "cityscape" ;;
                "egypt") echo "pyramid" ;;
                "ethiopia") echo "highlands" ;;
                "india") echo "palace" ;;
                "indonesia") echo "temple" ;;
                "iran") echo "architecture" ;;
                "malaysia") echo "skyline" ;;
                "mongolia") echo "landscape" ;;
                "south-africa") echo "landscape" ;;
                "uae") echo "skyline" ;;
                *) echo "heritage" ;;  # Default fallback
            esac
            ;;
        "attributes")
            case $normalized_dimension in
                "artisanal-excellence") echo "craftsmanship" ;;
                "cultural-bridge") echo "connection" ;;
                "founder-led") echo "leadership" ;;
                "heritage-brand") echo "tradition" ;;
                "innovation-leader") echo "innovation" ;;
                "premium-positioning") echo "luxury" ;;
                "regional-icon") echo "heritage" ;;
                "sustainability-pioneer") echo "sustainability" ;;
                *) echo "concept" ;;  # Default fallback
            esac
            ;;
        "signals")
            case $normalized_dimension in
                "export-ready") echo "shipping" ;;
                "franchise-ready") echo "expansion" ;;
                "investment-ready") echo "meeting" ;;
                "rapid-growth") echo "growth" ;;
                *) echo "business" ;;  # Default fallback
            esac
            ;;
        *)
            echo "hero"  # Default fallback
            ;;
    esac
}

# Function to normalize dimension names to lowercase
normalize_dimension_name() {
    echo "$1" | tr '[:upper:]' '[:lower:]'
}

# =============================================================================
# STAGE 1: ANALYZE CURRENT STRUCTURE
# =============================================================================

stage_1_analyze() {
    log_info "STAGE 1: Analyzing current structure..."
    echo ""
    
    for category in markets attributes signals; do
        local category_dir="assets/images/dimensions/$category"
        
        if [ -d "$category_dir" ]; then
            log_info "Category: $category"
            
            # Count processed images
            local processed_count=$(ls -1 "$category_dir"/*.jpg 2>/dev/null | grep -v originals | wc -l || echo "0")
            log_info "  Processed images: $processed_count"
            
            # List dimensions found
            log_info "  Dimensions found:"
            ls -1 "$category_dir"/*.jpg 2>/dev/null | sed 's/.*\///g' | sed 's/-[0-9]*w\.jpg$//' | sort -u | while read dim; do
                echo "    - $dim"
            done
            
            # Check originals
            if [ -d "$category_dir/originals" ]; then
                local originals_count=$(ls -1 "$category_dir/originals"/*.jpg 2>/dev/null | wc -l || echo "0")
                log_info "  Original images: $originals_count"
            else
                log_warning "  No originals directory found"
            fi
            
            echo ""
        fi
    done
    
    log_success "STAGE 1 Complete: Analysis finished"
}

# =============================================================================
# STAGE 2: CREATE SUBDIRECTORIES
# =============================================================================

stage_2_create_subdirs() {
    log_info "STAGE 2: Creating subdirectories..."
    echo ""
    
    for category in markets attributes signals; do
        local category_dir="assets/images/dimensions/$category"
        
        log_info "Processing category: $category"
        
        # Find all unique dimensions by examining existing files
        local dimensions=$(ls -1 "$category_dir"/*.jpg 2>/dev/null | sed 's/.*\///g' | sed 's/-[0-9]*w\.jpg$//' | sort -u)
        
        for dimension in $dimensions; do
            # Normalize dimension name to lowercase
            local normalized_dimension=$(normalize_dimension_name "$dimension")
            local subdir="$category_dir/$normalized_dimension"
            
            if [ "$dimension" != "$normalized_dimension" ]; then
                log_warning "  Case normalization: $dimension → $normalized_dimension"
            fi
            
            if [ "$DRY_RUN" = "--execute" ]; then
                mkdir -p "$subdir/originals"
                log_success "  Created: $subdir/"
            else
                log_info "  DRY RUN: Would create $subdir/"
            fi
        done
        
        echo ""
    done
    
    log_success "STAGE 2 Complete: Subdirectories created"
}

# =============================================================================
# STAGE 3: MIGRATE PROCESSED IMAGES
# =============================================================================

stage_3_migrate_processed() {
    log_info "STAGE 3: Migrating processed images..."
    echo ""
    
    for category in markets attributes signals; do
        local category_dir="assets/images/dimensions/$category"
        
        log_info "Processing category: $category"
        
        # Process each image file
        for img_file in "$category_dir"/*.jpg; do
            if [ -f "$img_file" ] && [[ ! "$img_file" =~ /originals/ ]]; then
                local filename=$(basename "$img_file")
                local dimension=$(echo "$filename" | sed 's/-[0-9]*w\.jpg$//')
                local normalized_dimension=$(normalize_dimension_name "$dimension")
                local context=$(get_semantic_context "$dimension" "$category")
                
                # Build new semantic filename with normalized dimension name
                local new_filename="${normalized_dimension}-hero-${context}-$(echo "$filename" | grep -o '[0-9]*w\.jpg')"
                local dest_dir="$category_dir/$normalized_dimension"
                local dest_file="$dest_dir/$new_filename"
                
                if [ "$dimension" != "$normalized_dimension" ]; then
                    log_warning "  Normalizing case: $dimension → $normalized_dimension"
                fi
                
                if [ "$DRY_RUN" = "--execute" ]; then
                    mv "$img_file" "$dest_file"
                    log_success "  Moved: $filename → $normalized_dimension/$new_filename"
                else
                    log_info "  DRY RUN: Would move $filename → $normalized_dimension/$new_filename"
                fi
            fi
        done
        
        echo ""
    done
    
    log_success "STAGE 3 Complete: Processed images migrated"
}

# =============================================================================
# STAGE 4: MIGRATE ORIGINALS
# =============================================================================

stage_4_migrate_originals() {
    log_info "STAGE 4: Migrating original images..."
    echo ""
    
    for category in markets attributes signals; do
        local category_dir="assets/images/dimensions/$category"
        local originals_dir="$category_dir/originals"
        
        if [ -d "$originals_dir" ]; then
            log_info "Processing category: $category"
            
            for orig_file in "$originals_dir"/*.jpg; do
                if [ -f "$orig_file" ]; then
                    local filename=$(basename "$orig_file")
                    local dimension=$(echo "$filename" | sed 's/\.jpg$//')
                    local normalized_dimension=$(normalize_dimension_name "$dimension")
                    local context=$(get_semantic_context "$dimension" "$category")
                    
                    # Build new semantic filename
                    local new_filename="hero-${context}.jpg"
                    local dest_dir="$category_dir/$normalized_dimension/originals"
                    local dest_file="$dest_dir/$new_filename"
                    
                    if [ "$dimension" != "$normalized_dimension" ]; then
                        log_warning "  Normalizing case: $dimension → $normalized_dimension"
                    fi
                    
                    if [ "$DRY_RUN" = "--execute" ]; then
                        mv "$orig_file" "$dest_file"
                        log_success "  Moved: $filename → $normalized_dimension/originals/$new_filename"
                    else
                        log_info "  DRY RUN: Would move $filename → $normalized_dimension/originals/$new_filename"
                    fi
                fi
            done
            
            # Remove old originals directory if empty
            if [ "$DRY_RUN" = "--execute" ] && [ -d "$originals_dir" ]; then
                rmdir "$originals_dir" 2>/dev/null || log_warning "  Could not remove old originals directory (not empty)"
            fi
            
            echo ""
        fi
    done
    
    log_success "STAGE 4 Complete: Original images migrated"
}

# =============================================================================
# STAGE 5: VERIFICATION
# =============================================================================

stage_5_verify() {
    log_info "STAGE 5: Verifying migration..."
    echo ""
    
    local total_errors=0
    
    for category in markets attributes signals; do
        local category_dir="assets/images/dimensions/$category"
        
        log_info "Verifying category: $category"
        
        # Find all subdirectories
        for subdir in "$category_dir"/*/; do
            if [ -d "$subdir" ] && [[ ! "$subdir" =~ \.backup ]]; then
                local dimension=$(basename "$subdir")
                
                # Check for processed images
                local processed_count=$(ls -1 "$subdir"/*.jpg 2>/dev/null | wc -l || echo "0")
                if [ "$processed_count" -eq 0 ]; then
                    log_error "  No processed images in $dimension/"
                    total_errors=$((total_errors + 1))
                else
                    log_success "  $dimension/: $processed_count processed images"
                fi
                
                # Check for originals
                if [ -d "$subdir/originals" ]; then
                    local originals_count=$(ls -1 "$subdir/originals"/*.jpg 2>/dev/null | wc -l || echo "0")
                    if [ "$originals_count" -eq 0 ]; then
                        log_warning "  No original images in $dimension/originals/"
                    else
                        log_success "  $dimension/originals/: $originals_count original images"
                    fi
                else
                    log_warning "  No originals directory in $dimension/"
                fi
            fi
        done
        
        echo ""
    done
    
    if [ $total_errors -eq 0 ]; then
        log_success "STAGE 5 Complete: Migration verified successfully"
    else
        log_error "STAGE 5 Complete: $total_errors errors found"
        return 1
    fi
}

# =============================================================================
# MAIN EXECUTION
# =============================================================================

main() {
    echo "🚀 Dimensions Migration Script"
    echo "==============================="
    echo ""
    
    if [ "$DRY_RUN" = "--dry-run" ]; then
        log_warning "DRY RUN MODE - No files will be modified"
    else
        log_info "EXECUTION MODE - Files will be modified"
    fi
    echo ""
    
    verify_prerequisites
    echo ""
    
    case $STAGE in
        "1"|"analyze")
            stage_1_analyze
            ;;
        "2"|"subdirs")
            stage_2_create_subdirs
            ;;
        "3"|"processed")
            create_backup "markets"
            create_backup "attributes"  
            create_backup "signals"
            stage_3_migrate_processed
            ;;
        "4"|"originals")
            stage_4_migrate_originals
            ;;
        "5"|"verify")
            stage_5_verify
            ;;
        "all")
            stage_1_analyze
            echo ""
            stage_2_create_subdirs
            echo ""
            if [ "$DRY_RUN" = "--execute" ]; then
                create_backup "markets"
                create_backup "attributes"
                create_backup "signals"
            fi
            stage_3_migrate_processed
            echo ""
            stage_4_migrate_originals
            echo ""
            stage_5_verify
            ;;
        *)
            log_error "Invalid stage: $STAGE"
            echo ""
            echo "Usage: $0 [--dry-run|--execute] [stage]"
            echo ""
            echo "Stages:"
            echo "  1, analyze    - Analyze current structure"
            echo "  2, subdirs    - Create subdirectories"
            echo "  3, processed  - Migrate processed images"
            echo "  4, originals  - Migrate original images"
            echo "  5, verify     - Verify migration"
            echo "  all           - Run all stages"
            echo ""
            echo "Examples:"
            echo "  $0 --dry-run all      # Preview all changes"
            echo "  $0 --execute 1        # Analyze only"
            echo "  $0 --execute all      # Execute full migration"
            exit 1
            ;;
    esac
    
    echo ""
    log_success "🎉 Migration script completed!"
    
    if [ "$DRY_RUN" = "--dry-run" ]; then
        echo ""
        log_info "Next steps:"
        echo "  1. Review the dry-run output above"
        echo "  2. Run: $0 --execute all"
        echo "  3. Test your site: bundle exec jekyll serve"
        echo "  4. Update collection-image.html if needed"
    fi
}

# Execute main function
main "$@"