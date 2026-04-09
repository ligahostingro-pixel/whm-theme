#!/usr/bin/env python3
"""Convert theme.css from light to dark theme by replacing hardcoded colors."""
import re

INPUT = '/workspaces/whm-theme/css/theme.css'
OUTPUT = '/workspaces/whm-theme/css/theme.css'

with open(INPUT, 'r') as f:
    lines = f.readlines()

# Track @media print blocks to skip
in_print = False
print_brace_depth = 0

# Track social button blocks to skip
in_social = False
social_brace_depth = 0

# Track .modal-localisation block to skip
in_modal_loc = False
modal_loc_brace_depth = 0

# Track .table-dark blocks to skip
in_table_dark = False
table_dark_brace_depth = 0

output_lines = []

for i, line in enumerate(lines):
    lineno = i + 1
    
    # --- Track @media print blocks ---
    if '@media print' in line:
        in_print = True
        print_brace_depth = 0
    
    if in_print:
        print_brace_depth += line.count('{') - line.count('}')
        if print_brace_depth <= 0:
            in_print = False
        output_lines.append(line)
        continue
    
    # --- Track social button blocks ---
    if re.search(r'\.btn-(facebook|twitter|google|linkedin|github|bitbucket)', line) and '{' in line:
        in_social = True
        social_brace_depth = 0
    
    if in_social:
        social_brace_depth += line.count('{') - line.count('}')
        if social_brace_depth <= 0:
            in_social = False
        output_lines.append(line)
        continue
    
    # --- Track .modal-localisation blocks ---
    if '.modal-localisation' in line and '{' in line:
        in_modal_loc = True
        modal_loc_brace_depth = 0
    
    if in_modal_loc:
        modal_loc_brace_depth += line.count('{') - line.count('}')
        if modal_loc_brace_depth <= 0:
            in_modal_loc = False
        output_lines.append(line)
        continue
    
    # --- Track .table-dark blocks ---
    if '.table-dark' in line and '{' in line and '.table-dark.' not in line:
        in_table_dark = True
        table_dark_brace_depth = 0
    
    if in_table_dark:
        table_dark_brace_depth += line.count('{') - line.count('}')
        if table_dark_brace_depth <= 0:
            in_table_dark = False
        output_lines.append(line)
        continue

    modified = line
    
    # =====================================================
    # BACKGROUND COLORS: white → dark
    # =====================================================
    # Skip alert colors: #fff3cd, #fff0f0
    # Skip #000 (already dark)
    
    # background-color: #fff !important → #0d1730 !important
    modified = re.sub(
        r'(background-color:\s*)#fff(\s*!important)',
        r'\g<1>#0d1730\2',
        modified
    )
    # background-color: #fff; (exact, not #fff3cd or #fff0f0)
    modified = re.sub(
        r'(background-color:\s*)#fff(\s*;)',
        r'\g<1>#0d1730\2',
        modified
    )
    # background: #fff (not background-image, etc.)
    modified = re.sub(
        r'(background:\s*)#fff(\s*[;!])',
        r'\g<1>#0d1730\2',
        modified
    )
    # background-color: white
    modified = re.sub(
        r'(background-color:\s*)white(\s*[;!])',
        r'\g<1>#0d1730\2',
        modified
    )
    # background: white
    modified = re.sub(
        r'(background:\s*)white(\s*[;!])',
        r'\g<1>#0d1730\2',
        modified
    )
    
    # =====================================================
    # LIGHT GREY BACKGROUNDS → dark
    # =====================================================
    # #f8f9fa → #111d3a
    modified = re.sub(
        r'(background(?:-color)?:\s*)#f8f9fa(\s*[;!])',
        r'\g<1>#111d3a\2',
        modified
    )
    # #f8f8f8 → #111d3a
    modified = re.sub(
        r'(background(?:-color)?:\s*)#f8f8f8(\s*[;!])',
        r'\g<1>#111d3a\2',
        modified
    )
    # #f9f9f9 → #111d3a
    modified = re.sub(
        r'(background(?:-color)?:\s*)#f9f9f9(\s*[;!])',
        r'\g<1>#111d3a\2',
        modified
    )
    # #f7f7f7 → #111d3a
    modified = re.sub(
        r'(background(?:-color)?:\s*)#f7f7f7(\s*[;!])',
        r'\g<1>#111d3a\2',
        modified
    )
    # #f6f6f6 → #111d3a
    modified = re.sub(
        r'(background(?:-color)?:\s*)#f6f6f6(\s*[;!])',
        r'\g<1>#111d3a\2',
        modified
    )

    # Medium greys → #1a2744
    # #e9ecef → #1a2744
    modified = re.sub(
        r'(background(?:-color)?:\s*)#e9ecef(\s*[;!])',
        r'\g<1>#1a2744\2',
        modified
    )
    # #efefef → #1a2744
    modified = re.sub(
        r'(background(?:-color)?:\s*)#efefef(\s*[;!])',
        r'\g<1>#1a2744\2',
        modified
    )
    # #eee → #1a2744 (background only)
    modified = re.sub(
        r'(background(?:-color)?:\s*)#eee(\s*[;!])',
        r'\g<1>#1a2744\2',
        modified
    )
    # #e6e6e6 → #1a2744
    modified = re.sub(
        r'(background(?:-color)?:\s*)#e6e6e6(\s*[;!])',
        r'\g<1>#1a2744\2',
        modified
    )
    # #dee2e6 → #1a2744
    modified = re.sub(
        r'(background(?:-color)?:\s*)#dee2e6(\s*[;!])',
        r'\g<1>#1a2744\2',
        modified
    )
    # #d4d4d4 → #1a2744
    modified = re.sub(
        r'(background(?:-color)?:\s*)#d4d4d4(\s*[;!])',
        r'\g<1>#1a2744\2',
        modified
    )
    # #ccc in background-color → #1a2744
    modified = re.sub(
        r'(background(?:-color)?:\s*)#ccc(\s*[;!])',
        r'\g<1>#1a2744\2',
        modified
    )
    # rgb(215, 215, 215) → #1a2744
    modified = re.sub(
        r'(background(?:-color)?:\s*)rgb\(215,\s*215,\s*215\)',
        r'\g<1>#1a2744',
        modified
    )
    # rgb(205, 205, 205) → #1e3a5f
    modified = re.sub(
        r'(background(?:-color)?:\s*)rgb\(205,\s*205,\s*205\)',
        r'\g<1>#1e3a5f',
        modified
    )
    
    # =====================================================
    # TEXT COLORS: dark → light
    # =====================================================
    # color: #212529 → #e2e8f0 (but NOT background-color: #212529)
    modified = re.sub(
        r'(?<!background-)(?<!background)(color:\s*)#212529(\s*[;!])',
        r'\g<1>#e2e8f0\2',
        modified
    )
    # color: #333 → #e2e8f0
    modified = re.sub(
        r'(?<!background-)(?<!background)(color:\s*)#333(\s*[;!])',
        r'\g<1>#e2e8f0\2',
        modified
    )
    # color: #343a40 → #e2e8f0
    modified = re.sub(
        r'(?<!background-)(?<!background)(color:\s*)#343a40(\s*[;!])',
        r'\g<1>#e2e8f0\2',
        modified
    )
    # color: #495057 → #a0aec0
    modified = re.sub(
        r'(?<!background-)(?<!background)(color:\s*)#495057(\s*[;!])',
        r'\g<1>#a0aec0\2',
        modified
    )
    # color: #444 → #cbd5e1
    modified = re.sub(
        r'(?<!background-)(?<!background)(color:\s*)#444(\s*[;!])',
        r'\g<1>#cbd5e1\2',
        modified
    )
    # color: #555 → #cbd5e1
    modified = re.sub(
        r'(?<!background-)(?<!background)(color:\s*)#555(\s*[;!])',
        r'\g<1>#cbd5e1\2',
        modified
    )
    # color: #666 → #8892a4
    modified = re.sub(
        r'(?<!background-)(?<!background)(color:\s*)#666(\s*[;!])',
        r'\g<1>#8892a4\2',
        modified
    )
    # color: #626262 → #a0aec0
    modified = re.sub(
        r'(?<!background-)(?<!background)(color:\s*)#626262(\s*[;!])',
        r'\g<1>#a0aec0\2',
        modified
    )
    # color: #777 → #8892a4
    modified = re.sub(
        r'(?<!background-)(?<!background)(color:\s*)#777(\s*[;!])',
        r'\g<1>#8892a4\2',
        modified
    )
    # color: #888 → #8892a4
    modified = re.sub(
        r'(?<!background-)(?<!background)(color:\s*)#888(\s*[;!])',
        r'\g<1>#8892a4\2',
        modified
    )
    # color: #999 → #8892a4
    modified = re.sub(
        r'(?<!background-)(?<!background)(color:\s*)#999(\s*[;!])',
        r'\g<1>#8892a4\2',
        modified
    )
    # color: #aaa → #8892a4
    modified = re.sub(
        r'(?<!background-)(?<!background)(color:\s*)#aaa(\s*[;!])',
        r'\g<1>#8892a4\2',
        modified
    )
    # color: #bbb → #8892a4
    modified = re.sub(
        r'(?<!background-)(?<!background)(color:\s*)#bbb(\s*[;!])',
        r'\g<1>#8892a4\2',
        modified
    )
    # color: #a5a5a5 → #8892a4
    modified = re.sub(
        r'(?<!background-)(?<!background)(color:\s*)#a5a5a5(\s*[;!])',
        r'\g<1>#8892a4\2',
        modified
    )
    # color: #ccc → #8892a4
    modified = re.sub(
        r'(?<!background-)(?<!background)(color:\s*)#ccc(\s*[;!])',
        r'\g<1>#8892a4\2',
        modified
    )
    # color: #6c757d → #8892a4 (for .text-muted)
    modified = re.sub(
        r'(?<!background-)(?<!background)(color:\s*)#6c757d(\s*[;!])',
        r'\g<1>#8892a4\2',
        modified
    )
    
    # =====================================================
    # BORDER COLORS
    # =====================================================
    # #dee2e6 → #1e3a5f
    modified = re.sub(
        r'(border(?:-(?:top|bottom|left|right))?:\s*1px\s+solid\s*)#dee2e6',
        r'\g<1>#1e3a5f',
        modified
    )
    modified = re.sub(
        r'(border-color:\s*)#dee2e6',
        r'\g<1>#1e3a5f',
        modified
    )
    
    # #ddd → #1a2744
    modified = re.sub(
        r'(border(?:-(?:top|bottom|left|right))?:\s*1px\s+solid\s*)#ddd',
        r'\g<1>#1a2744',
        modified
    )
    modified = re.sub(
        r'(border-color:\s*)#ddd',
        r'\g<1>#1a2744',
        modified
    )
    
    # #eee → #1a2744 (in borders)
    modified = re.sub(
        r'(border(?:-(?:top|bottom|left|right))?:\s*1px\s+solid\s*)#eee(\s*[;!])',
        r'\g<1>#1a2744\2',
        modified
    )
    
    # #ccc → #1a2744 (in borders)
    modified = re.sub(
        r'(border(?:-(?:top|bottom|left|right))?:\s*1px\s+solid\s*)#ccc',
        r'\g<1>#1a2744',
        modified
    )
    modified = re.sub(
        r'(border-color:\s*)#ccc',
        r'\g<1>#1a2744',
        modified
    )
    
    # #ced4da → #1e3a5f
    modified = re.sub(
        r'(border(?:-(?:top|bottom|left|right))?:\s*1px\s+solid\s*)#ced4da',
        r'\g<1>#1e3a5f',
        modified
    )
    
    # #e5e5e5 → #1a2744
    modified = re.sub(
        r'(border(?:-(?:top|bottom|left|right))?:\s*1px\s+solid\s*)#e5e5e5',
        r'\g<1>#1a2744',
        modified
    )
    
    # #f5f5f5 → #1a2744
    modified = re.sub(
        r'(border(?:-(?:top|bottom|left|right))?:\s*1px\s+solid\s*)#f5f5f5',
        r'\g<1>#1a2744',
        modified
    )
    
    # border-left: 5px solid #eeeeee → #1a2744
    modified = re.sub(
        r'(border-left:\s*5px\s+solid\s*)#eeeeee',
        r'\g<1>#1a2744',
        modified
    )
    
    # =====================================================
    # BOOTSTRAP UTILITY OVERRIDES
    # =====================================================
    # .bg-dark background-color: #343a40 → #0d1730
    # (This is handled contextually - the .bg-dark block was found at line 6016)
    modified = re.sub(
        r'(background-color:\s*)#343a40(\s*[;!])',
        r'\g<1>#0d1730\2',
        modified
    )
    
    output_lines.append(modified)

with open(OUTPUT, 'w') as f:
    f.writelines(output_lines)

# Report changes
changed = 0
for orig, new in zip(lines, output_lines):
    if orig != new:
        changed += 1
print(f"Modified {changed} lines out of {len(lines)} total.")
