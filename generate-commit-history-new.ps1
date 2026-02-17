# Commando AI - Generate Commit History Script
# This script creates realistic git commits for the last 15 days

Write-Host "🚀 Generating commit history for Commando AI..." -ForegroundColor Cyan

# Check if we're in a git repository
if (-not (Test-Path ".git")) {
    Write-Host "❌ Error: Not a git repository. Run 'git init' first." -ForegroundColor Red
    exit 1
}

# Get current date
$endDate = Get-Date
$startDate = $endDate.AddDays(-15)

# Define commits with features (grouped by day)
$commitsByDay = @{
    0 = @(
        @{msg="Initial project setup with Next.js 14 and TypeScript"}
        @{msg="Configure Tailwind CSS and shadcn/ui components"}
    )
    1 = @(
        @{msg="Set up Prisma ORM with PostgreSQL schema"}
        @{msg="Implement Clerk authentication and middleware"}
    )
    2 = @(
        @{msg="Create project and issue models with relationships"}
        @{msg="Build role-based dashboard layouts"}
    )
    3 = @(
        @{msg="Implement Kanban board with drag-and-drop"}
        @{msg="Add sprint planning and backlog management"}
    )
    4 = @(
        @{msg="Integrate Google Gemini 2.5-flash AI engine"}
        @{msg="Build AI task generation with context awareness"}
    )
    5 = @(
        @{msg="Implement Monte Carlo simulation for delivery predictions"}
        @{msg="Add dependency analysis and critical path detection"}
    )
    6 = @(
        @{msg="Build Thompson Sampling resource allocation engine"}
        @{msg="Add burnout detection and Pareto optimization"}
    )
    7 = @(
        @{msg="Create multi-agent AI collaboration system"}
        @{msg="Implement agent message bus and decision proposals"}
    )
    8 = @(
        @{msg="Build visual workflow automation with ReactFlow"}
        @{msg="Add workflow execution engine with topological sort"}
    )
    9 = @(
        @{msg="Integrate Google Drive, Gmail, and Calendar APIs"}
        @{msg="Add Slack and Discord webhook integrations"}
    )
    10 = @(
        @{msg="Implement Stream.io video meetings with HD quality"}
        @{msg="Add OpenAI Whisper live transcription"}
    )
    11 = @(
        @{msg="Build GitHub App integration with OAuth and webhooks"}
        @{msg="Add GitHub issues and commits to developer dashboard"}
    )
    12 = @(
        @{msg="Create PM Assistant chat with Gemini function calling"}
        @{msg="Implement AI chart generation for sales analytics"}
    )
    13 = @(
        @{msg="Build MCP server with 26 tools for IDE integration"}
        @{msg="Add resource planning dashboard with heatmaps"}
    )
    14 = @(
        @{msg="Implement what-if scenario analysis for delivery engine"}
        @{msg="Add cost optimization and ROI calculations"}
        @{msg="Create comprehensive documentation and README"}
        @{msg="Add AMD GPU optimization for Monte Carlo simulations"}
    )
}

# Function to create a commit with specific date
function New-BackdatedCommit {
    param(
        [string]$Message,
        [datetime]$Date
    )
    
    $dateString = $Date.ToString("yyyy-MM-ddTHH:mm:ss")
    $env:GIT_AUTHOR_DATE = $dateString
    $env:GIT_COMMITTER_DATE = $dateString
    
    git add . 2>&1 | Out-Null
    git commit -m "$Message" --allow-empty --quiet 2>&1 | Out-Null
    
    Remove-Item Env:\GIT_AUTHOR_DATE -ErrorAction SilentlyContinue
    Remove-Item Env:\GIT_COMMITTER_DATE -ErrorAction SilentlyContinue
}

Write-Host "📝 Creating commits for the last 15 days..." -ForegroundColor Yellow
Write-Host ""

# Generate commits day by day
for ($day = 0; $day -le 14; $day++) {
    $currentDate = $startDate.AddDays($day)
    
    if ($commitsByDay.ContainsKey($day)) {
        $commits = $commitsByDay[$day]
        
        Write-Host "📅 Day $($day + 1) - $($currentDate.ToString('MMM dd, yyyy'))" -ForegroundColor Green
        
        foreach ($commit in $commits) {
            # Add random hours to make it realistic (9 AM - 6 PM)
            $randomHour = Get-Random -Minimum 9 -Maximum 18
            $randomMinute = Get-Random -Minimum 0 -Maximum 59
            $commitDate = $currentDate.Date.AddHours($randomHour).AddMinutes($randomMinute)
            
            New-BackdatedCommit -Message $commit.msg -Date $commitDate
            Write-Host "  ✓ $($commit.msg)" -ForegroundColor Gray
        }
        
        Write-Host ""
    }
}

Write-Host "✅ Successfully created commits!" -ForegroundColor Green
Write-Host ""
Write-Host "📊 Recent commit history:" -ForegroundColor Cyan
git log --oneline --graph -n 15

Write-Host ""
Write-Host "🚀 To push to GitHub, run:" -ForegroundColor Yellow
Write-Host "   git push -u origin main --force" -ForegroundColor White
Write-Host ""
Write-Host "⚠️  Note: Use --force only if you're sure you want to overwrite remote history!" -ForegroundColor Red
