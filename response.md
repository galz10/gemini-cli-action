plan-id: 1
Plan Title: Add `gemini-cli-random-joke.yml` example
Description: This plan will add a new GitHub Actions workflow file to the `/examples` directory. This workflow, when run, will use the `gemini-cli-action` to tell a random joke.
Steps:
1. Create a new file named `examples/gemini-cli-random-joke.yml`.
2. Add the following content to the new file:
```yaml
name: Gemini CLI - Random Joke

on:
  workflow_dispatch:

jobs:
  random-joke:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v4

      - name: Get a random joke
        uses: ./
        with:
          prompt: "Tell me a random joke"
```

To approve this plan, comment on the PR with: `@gemini-cli plan#1 approved`
