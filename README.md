# Gemini CLI Action

The Gemini CLI Action is a powerful GitHub Action that brings the capabilities of the Gemini CLI into your software development workflows. It allows you to automate various tasks, such as code generation, bug fixing, and answering questions, by simply interacting with it through PR comments.

## Key Features

- **Comment-based Interaction**: Trigger the Gemini CLI by mentioning `@gemini-cli` in your PR comments.
- **Automated Issue Management**: Automatically triage and label issues based on their content.
- **Extensible with Tools**: The action can be extended with custom tools to perform specific tasks.
- **Customizable Behavior**: Use a `GEMINI.md` file to define custom instructions and context for the Gemini CLI.

## Getting Started

To use the Gemini CLI Action, you need to have a Gemini API Key. You can get one from [Google AI Studio](https://aistudio.google.com/app/apikey).

Once you have your API key, you need to add it as a secret to your GitHub repository. The secret should be named `GEMINI_API_KEY`.

## Usage

To use the action, you need to create a workflow file in your repository (e.g., `.github/workflows/gemini.yml`). Here is an example of a workflow that runs the Gemini CLI on every PR comment:

```yaml
name: Gemini CLI
on:
  issue_comment:
    types:
      - created

jobs:
  gemini:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout repository
        uses: actions/checkout@v2

      - name: Run Gemini CLI
        uses: ./
        with:
          USER_REQUEST: ${{ github.event.comment.body }}
```

You can find more examples in the [`/examples`](/examples) directory:
- [`gemini-cli.yml`](/examples/gemini-cli.yml)
- [`gemini-cli-random-joke.yml`](/examples/gemini-cli-random-joke.yml)
- [`gemini-cli-current-time.yml`](/examples/gemini-cli-current-time.yml)
- [`gemini-cli-math-operations.yml`](/examples/gemini-cli-math-operations.yml)
- [`gemini-issue-automated-triage.yml`](/examples/gemini-issue-automated-triage.yml)
- [`gemini-issue-scheduled-triage.yml`](/examples/gemini-issue-scheduled-triage.yml)
- [`gemini-pr-review.yml`](/examples/gemini-pr-review.yml)

## Configuration

The Gemini CLI Action can be configured with the following inputs:

| Input | Description | Required |
| --- | --- | --- |
| `USER_REQUEST` | The user's request to the Gemini CLI. | Yes |
| `GEMINI_API_KEY` | Your Gemini API key. | Yes |
| `GITHUB_TOKEN` | The GitHub token to use for authentication. | No (defaults to `github.token`) |
| `GEMINI_MODEL` | The Gemini model to use. | No (defaults to `gemini-1.5-flash`) |
| `TOP_K` | The top-k value to use for the Gemini model. | No (defaults to `1`) |
| `TOP_P` | The top-p value to use for the Gemini model. | No (defaults to `1`) |
| `TEMPERATURE` | The temperature value to use for the Gemini model. | No (defaults to `1`) |
| `MAX_OUTPUT_TOKENS` | The maximum number of output tokens to generate. | No (defaults to `2048`) |

## Authentication

The Gemini CLI Action can be authenticated with a GitHub App or with the default `GITHUB_TOKEN`.

### GitHub App (Recommended)

Using a GitHub App is the recommended way to authenticate the Gemini CLI Action. This is because it allows you to grant the action specific permissions, rather than giving it full access to your repository.

To learn how to create a GitHub App and use it to authenticate the Gemini CLI Action, see the [GitHub App authentication guide](/docs/github-app.md).

### GITHUB_TOKEN

You can also authenticate the Gemini CLI Action with the default `GITHUB_TOKEN`. However, this is not recommended as it gives the action full access to your repository.

## Observability

The Gemini CLI Action supports OpenTelemetry for sending telemetry data to Google Cloud. This allows you to monitor the performance of the action and troubleshoot any issues that may arise.

To learn how to configure observability for the Gemini CLI Action, see the [observability guide](/docs/observability.md).

## Workload Identity Federation

The Gemini CLI Action uses Workload Identity Federation to authenticate with Google Cloud. This allows the action to access Google Cloud resources without having to store any credentials in GitHub.

To learn how to set up Workload Identity Federation for the Gemini CLI Action, see the [Workload Identity Federation guide](/docs/workload-identity.md).

## Customization

You can customize the behavior of the Gemini CLI by creating a `GEMINI.md` file in the root of your repository. This file can be used to define custom instructions and context for the Gemini CLI.

## Contributing

Contributions are welcome! Please see the [contributing guide](/CONTRIBUTING.md) for more information.

## License

The Gemini CLI Action is licensed under the [MIT License](/LICENSE).