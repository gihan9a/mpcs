# Samupakara Repository

## Directory structure
`docker` directory contains docker configurations and volumes
`framework` contains the `Yii 1` framework files
`webapp` contains the application code

## Setting up backup cron
Add Following to the host's cron tab. Confirm the variables in `cron.sh` file are corect.

```bash
0 12 * * * </path/to>cron.sh > /dev/null
```