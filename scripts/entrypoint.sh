#!/bin/bash

set -e

# By default, the user request is the prompt.
USER_REQUEST="$PROMPT"
PR_COMMENTS=""

# If the prompt contains "plan#", then it's an approval.
if [[ "$PROMPT" == *"plan#"* ]]; then
  # Extract the plan number from the prompt.
  PLAN_ID=$(echo "$PROMPT" | grep -o 'plan#[0-9]*')

  # Get the PR comments.
  PR_COMMENTS=$(gh pr view "$PR_NUMBER" --json comments -q '.comments[].body')

  # Find the comment with the plan.
  PLAN_COMMENT=$(echo "$PR_COMMENTS" | grep -B 100 "To approve this plan, please reply with the following comment:" | grep "$PLAN_ID")

  # The user request is the plan comment.
  USER_REQUEST="$PLAN_COMMENT"
fi

# Construct the prompt for the Gemini CLI.
GEMINI_PROMPT=$(cat "${{ github.action_path }}/scripts/request.sh")

# Run the Gemini CLI.
gemini --yolo --prompt "$GEMINI_PROMPT"
