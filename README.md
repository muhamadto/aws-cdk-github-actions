# AWS-CDK GitHub Actions (Java)

AWS-CDK GitHub Actions allow you to run `cdk deploy` and `cdk diff` and ... on your pull requests to help you review.

## Supported language

- Java 20
- Maven

## Example usage

```yaml
on: [push]

jobs:
  aws_cdk:
    runs-on: ubuntu-latest
    steps:

      - name: Checkout repository
        uses: actions/checkout@v2
        
      - name: cdk diff
        uses: muhmadto/aws-cdk-github-actions@v1
        with:
          cdk_subcommand: 'diff'
          actions_comment: true
        env:
          AWS_ACCESS_KEY_ID: ${{ secrets.AWS_ACCESS_KEY_ID }}
          AWS_SECRET_ACCESS_KEY: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
          AWS_DEFAULT_REGION: 'ap-northeast-1'

      - name: cdk deploy
        uses: muhmadto/aws-cdk-github-actions@v2
        with:
          cdk_subcommand: 'deploy'
          cdk_args: '--require-approval never'
          actions_comment: false
        env:
          AWS_ACCESS_KEY_ID: ${{ secrets.AWS_ACCESS_KEY_ID }}
          AWS_SECRET_ACCESS_KEY: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
          AWS_DEFAULT_REGION: 'ap-northeast-1'

      - name: cdk synth
        uses: muhmadto/aws-cdk-github-actions@v1
        with:
          cdk_subcommand: 'synth'
          cdk_version: '1.16.2'
          working_dir: 'src'
        env:
          AWS_ACCESS_KEY_ID: ${{ secrets.AWS_ACCESS_KEY_ID }}
          AWS_SECRET_ACCESS_KEY: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
          AWS_DEFAULT_REGION: 'ap-northeast-1'
```


## Inputs

- `cdk_subcommand` **Required** AWS CDK subcommand to execute.
- `cdk_version` AWS CDK version to install. (default: 'latest')
- `cdk_stack` AWS CDK stack name to execute. (default: '*')
- `working_dir` AWS CDK working directory. (default: '.')
- `actions_comment` Whether or not to comment on pull requests. (default: true)
- `debug_log` Enable debug-log. (default: false)

## Outputs

- `status_code` Returned status code.

## ENV

- `AWS_ACCESS_KEY_ID` **Required**
- `AWS_SECRET_ACCESS_KEY` **Required**
- `GITHUB_TOKEN` Required for `actions_comment=true`

Recommended to get `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY` from secrets. A github token is [automatically made available](https://help.github.com/en/actions/configuring-and-managing-workflows/authenticating-with-the-github_token) as a secret as `GITHUB_TOKEN`. 

## License

[MIT](LICENSE)

## Author

[muhmadto](https://github.com/muhmadto/)
