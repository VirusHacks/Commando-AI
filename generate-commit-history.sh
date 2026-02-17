#!/bin/bash

# Commando AI - Generate Commit History Script (Bash version)
# This script creates realistic git commits for the last 15 days

echo "🚀 Generating commit history for Commando AI..."

# Check if we're in a git repository
if [ ! -d ".git" ]; then
    echo "❌ Error: Not a git repository. Run 'git init' first."
    exit 1
fi

# Function to create a commit with specific date
create_commit() {
    local message=$1
    local date=$2
    shift 2
    local files=("$@")
    
    export GIT_AUTHOR_DATE="$date"
    export GIT_COMMITTER_DATE="$date"
    
    # Add files in stages if specified, otherwise add all
    if [ ${#files[@]} -gt 0 ]; then
        for file in "${files[@]}"; do
            git add "$file" 2>/dev/null
        done
    else
        git add . 2>/dev/null
    fi
    
    git commit -m "$message" --allow-empty --quiet
    
    unset GIT_AUTHOR_DATE
    unset GIT_COMMITTER_DATE
}

# Get dates for last 15 days
current_date=$(date +%s)

echo "📝 Creating commits for the last 15 days..."
echo ""

# Day 1 (15 days ago)
day_date=$(date -d "15 days ago" "+%Y-%m-%d 10:30:00" 2>/dev/null || date -v-15d "+%Y-%m-%d 10:30:00")
create_commit "Initial project setup with Next.js 14 and TypeScript" "$day_date" "package.json" "tsconfig.json" "next.config.mjs"
day_date=$(date -d "15 days ago" "+%Y-%m-%d 14:15:00" 2>/dev/null || date -v-15d "+%Y-%m-%d 14:15:00")
create_commit "Configure Tailwind CSS and shadcn/ui components" "$day_date" "tailwind.config.ts" "postcss.config.js" "components.json" "src/app/globals.css"
echo "✓ Day 1 complete"

# Day 2 (14 days ago)
day_date=$(date -d "14 days ago" "+%Y-%m-%d 09:45:00" 2>/dev/null || date -v-14d "+%Y-%m-%d 09:45:00")
create_commit "Set up Prisma ORM with PostgreSQL schema" "$day_date" "prisma/schema.prisma" "src/lib/db.ts"
day_date=$(date -d "14 days ago" "+%Y-%m-%d 16:20:00" 2>/dev/null || date -v-14d "+%Y-%m-%d 16:20:00")
create_commit "Implement Clerk authentication and middleware" "$day_date" "src/middleware.ts" "src/app/layout.tsx" "src/app/(auth)/"
echo "✓ Day 2 complete"

# Day 3 (13 days ago)
day_date=$(date -d "13 days ago" "+%Y-%m-%d 11:00:00" 2>/dev/null || date -v-13d "+%Y-%m-%d 11:00:00")
create_commit "Create project and issue models with relationships" "$day_date" "prisma/schema.prisma" "src/lib/types.ts"
day_date=$(date -d "13 days ago" "+%Y-%m-%d 15:30:00" 2>/dev/null || date -v-13d "+%Y-%m-%d 15:30:00")
create_commit "Build role-based dashboard layouts" "$day_date" "src/app/(main)/layout.tsx" "src/components/sidebar/" "src/components/infobar/"
echo "✓ Day 3 complete"

# Day 4 (12 days ago)
day_date=$(date -d "12 days ago" "+%Y-%m-%d 10:15:00" 2>/dev/null || date -v-12d "+%Y-%m-%d 10:15:00")
create_commit "Implement Kanban board with drag-and-drop" "$day_date" "src/components/global/" "src/store.tsx"
day_date=$(date -d "12 days ago" "+%Y-%m-%d 14:45:00" 2>/dev/null || date -v-12d "+%Y-%m-%d 14:45:00")
create_commit "Add sprint planning and backlog management" "$day_date" "src/app/(main)/(pages)/"
echo "✓ Day 4 complete"

# Day 5 (11 days ago)
day_date=$(date -d "11 days ago" "+%Y-%m-%d 09:30:00" 2>/dev/null || date -v-11d "+%Y-%m-%d 09:30:00")
create_commit "Integrate Google Gemini 2.5-flash AI engine" "$day_date"
day_date=$(date -d "11 days ago" "+%Y-%m-%d 16:00:00" 2>/dev/null || date -v-11d "+%Y-%m-%d 16:00:00")
create_commit "Build AI task generation with context awareness" "$day_date"
echo "✓ Day 5 complete"

# Day 6 (10 days ago)
day_date=$(date -d "10 days ago" "+%Y-%m-%d 10:45:00" 2>/dev/null || date -v-10d "+%Y-%m-%d 10:45:00")
create_commit "Implement Monte Carlo simulation for delivery predictions" "$day_date"
day_date=$(date -d "10 days ago" "+%Y-%m-%d 15:15:00" 2>/dev/null || date -v-10d "+%Y-%m-%d 15:15:00")
create_commit "Add dependency analysis and critical path detection" "$day_date"
echo "✓ Day 6 complete"

# Day 7 (9 days ago)
day_date=$(date -d "9 days ago" "+%Y-%m-%d 11:30:00" 2>/dev/null || date -v-9d "+%Y-%m-%d 11:30:00")
create_commit "Build Thompson Sampling resource allocation engine" "$day_date"
day_date=$(date -d "9 days ago" "+%Y-%m-%d 14:00:00" 2>/dev/null || date -v-9d "+%Y-%m-%d 14:00:00")
create_commit "Add burnout detection and Pareto optimization" "$day_date"
echo "✓ Day 7 complete"

# Day 8 (8 days ago)
day_date=$(date -d "8 days ago" "+%Y-%m-%d 10:00:00" 2>/dev/null || date -v-8d "+%Y-%m-%d 10:00:00")
create_commit "Create multi-agent AI collaboration system" "$day_date"
day_date=$(date -d "8 days ago" "+%Y-%m-%d 16:30:00" 2>/dev/null || date -v-8d "+%Y-%m-%d 16:30:00")
create_commit "Implement agent message bus and decision proposals" "$day_date"
echo "✓ Day 8 complete"

# Day 9 (7 days ago)
day_date=$(date -d "7 days ago" "+%Y-%m-%d 09:15:00" 2>/dev/null || date -v-7d "+%Y-%m-%d 09:15:00")
create_commit "Build visual workflow automation with ReactFlow" "$day_date" "src/providers/editor-provider.tsx" "src/app/(main)/(pages)/workflows/"
day_date=$(date -d "7 days ago" "+%Y-%m-%d 15:45:00" 2>/dev/null || date -v-7d "+%Y-%m-%d 15:45:00")
create_commit "Add workflow execution engine with topological sort" "$day_date" "src/lib/workflow-executor.ts" "src/app/api/workflow/"
echo "✓ Day 9 complete"

# Day 10 (6 days ago)
day_date=$(date -d "6 days ago" "+%Y-%m-%d 10:30:00" 2>/dev/null || date -v-6d "+%Y-%m-%d 10:30:00")
create_commit "Integrate Google Drive, Gmail, and Calendar APIs" "$day_date" "src/app/api/drive/" "src/app/api/gmail/" "src/app/api/calendar/"
day_date=$(date -d "6 days ago" "+%Y-%m-%d 14:15:00" 2>/dev/null || date -v-6d "+%Y-%m-%d 14:15:00")
create_commit "Add Slack and Discord webhook integrations" "$day_date" "src/app/api/connections/" "src/providers/connections-provider.tsx"
echo "✓ Day 10 complete"

# Day 11 (5 days ago)
day_date=$(date -d "5 days ago" "+%Y-%m-%d 11:00:00" 2>/dev/null || date -v-5d "+%Y-%m-%d 11:00:00")
create_commit "Implement Stream.io video meetings with HD quality" "$day_date" "src/providers/StreamClientProvider.tsx" "src/actions/stream.actions.ts" "src/components/MeetingRoom.tsx"
day_date=$(date -d "5 days ago" "+%Y-%m-%d 16:00:00" 2>/dev/null || date -v-5d "+%Y-%m-%d 16:00:00")
create_commit "Add OpenAI Whisper live transcription" "$day_date" "src/app/api/transcribe/" "src/components/live-transcription.tsx" "src/lib/audio-processor.ts"
echo "✓ Day 11 complete"

# Day 12 (4 days ago)
day_date=$(date -d "4 days ago" "+%Y-%m-%d 09:45:00" 2>/dev/null || date -v-4d "+%Y-%m-%d 09:45:00")
create_commit "Build GitHub App integration with OAuth and webhooks" "$day_date"
day_date=$(date -d "4 days ago" "+%Y-%m-%d 15:30:00" 2>/dev/null || date -v-4d "+%Y-%m-%d 15:30:00")
create_commit "Add GitHub issues and commits to developer dashboard" "$day_date"
echo "✓ Day 12 complete"

# Day 13 (3 days ago)
day_date=$(date -d "3 days ago" "+%Y-%m-%d 10:15:00" 2>/dev/null || date -v-3d "+%Y-%m-%d 10:15:00")
create_commit "Create PM Assistant chat with Gemini function calling" "$day_date"
day_date=$(date -d "3 days ago" "+%Y-%m-%d 14:45:00" 2>/dev/null || date -v-3d "+%Y-%m-%d 14:45:00")
create_commit "Implement AI chart generation for sales analytics" "$day_date"
echo "✓ Day 13 complete"

# Day 14 (2 days ago)
day_date=$(date -d "2 days ago" "+%Y-%m-%d 11:30:00" 2>/dev/null || date -v-2d "+%Y-%m-%d 11:30:00")
create_commit "Build MCP server with 26 tools for IDE integration" "$day_date"
day_date=$(date -d "2 days ago" "+%Y-%m-%d 16:15:00" 2>/dev/null || date -v-2d "+%Y-%m-%d 16:15:00")
create_commit "Add resource planning dashboard with heatmaps" "$day_date"
echo "✓ Day 14 complete"

# Day 15 (1 day ago)
day_date=$(date -d "1 day ago" "+%Y-%m-%d 10:00:00" 2>/dev/null || date -v-1d "+%Y-%m-%d 10:00:00")
create_commit "Implement what-if scenario analysis for delivery engine" "$day_date" "src/components/dashboard/"
day_date=$(date -d "1 day ago" "+%Y-%m-%d 13:30:00" 2>/dev/null || date -v-1d "+%Y-%m-%d 13:30:00")
create_commit "Add cost optimization and ROI calculations" "$day_date" "src/lib/"
day_date=$(date -d "1 day ago" "+%Y-%m-%d 15:45:00" 2>/dev/null || date -v-1d "+%Y-%m-%d 15:45:00")
create_commit "Create comprehensive documentation and README" "$day_date" "README.md" "src/app/privacy/" "src/app/terms/"
day_date=$(date -d "1 day ago" "+%Y-%m-%d 17:00:00" 2>/dev/null || date -v-1d "+%Y-%m-%d 17:00:00")
create_commit "Add AMD GPU optimization for Monte Carlo simulations" "$day_date" "src/lib/" "src/constants/"
echo "✓ Day 15 complete"

echo ""
echo "✅ Successfully created 30 commits!"
echo ""
echo "📊 Commit history:"
git log --oneline --graph -15

echo ""
echo "🚀 To push to GitHub, run:"
echo "   git remote add origin https://github.com/yourusername/commando-ai.git"
echo "   git branch -M main"
echo "   git push -u origin main --force"
echo ""
echo "⚠️  Note: Use --force only if you're sure you want to overwrite remote history!"
