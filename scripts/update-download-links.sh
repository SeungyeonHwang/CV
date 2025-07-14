#!/bin/bash

# Script to update download links in README after manual release creation
# Usage: ./scripts/update-download-links.sh <release-tag>

if [ $# -eq 0 ]; then
    echo "Usage: $0 <release-tag>"
    echo "Example: $0 v2025.01.14"
    exit 1
fi

RELEASE_TAG=$1
REPO_URL=$(git config --get remote.origin.url | sed 's/\.git$//' | sed 's/git@github.com:/https:\/\/github.com\//')

# Extract owner and repo name
if [[ $REPO_URL =~ github.com[:/]([^/]+)/([^/]+)$ ]]; then
    OWNER=${BASH_REMATCH[1]}
    REPO=${BASH_REMATCH[2]}
else
    echo "Error: Could not extract repository information from remote URL"
    exit 1
fi

ASSET_URL="https://github.com/${OWNER}/${REPO}/releases/download/${RELEASE_TAG}/resume-complete.pdf"

echo "📄 Updating download links..."
echo "Repository: ${OWNER}/${REPO}"
echo "Release tag: ${RELEASE_TAG}"
echo "Download URL: ${ASSET_URL}"

# Update README.md
if [ -f "README.md" ]; then
    # Update the download link pattern
    sed -i.bak "s|\[resume-complete.pdf\](output/resume-complete.pdf)|[resume-complete.pdf](${ASSET_URL})|g" README.md
    echo "✅ Updated README.md"
fi

# Update output/resume-complete.md if exists
if [ -f "output/resume-complete.md" ]; then
    sed -i.bak "s|\[resume-complete.pdf\](output/resume-complete.pdf)|[resume-complete.pdf](${ASSET_URL})|g" output/resume-complete.md
    echo "✅ Updated output/resume-complete.md"
fi

# Clean up backup files
rm -f README.md.bak output/resume-complete.md.bak

echo ""
echo "🎉 Download links updated successfully!"
echo ""
echo "Next steps:"
echo "1. Review the changes: git diff"
echo "2. Commit the changes: git add -A && git commit -m 'Update download links to release ${RELEASE_TAG}'"
echo "3. Push to repository: git push"