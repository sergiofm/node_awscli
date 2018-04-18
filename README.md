# Docker Image with Node.js and AWS-CLI installed

Docker Image with Node.js and AWS-CLI installed.
Utility to make deploys to AWS from a Bitbucket Pipeline.

**Setup:**

1.) Create an IAM User
- Attach the policy `AmazonS3FullAccess` (Permissions/Attach Policy)
- Create an access key (Security Credentials/Create Access Key)

2.) Set this environment variables:
| Variable name         | Value (Examples)     | Comment                                                            |
| --------------------- | -------------------- | ------------------------------------------------------------------ |
| AWS_ACCESS_KEY_ID     | AIUXIHOEPBRD4TRC74WA | from IAM User credentials                                          |
| AWS_SECRET_ACCESS_KEY | xxxxxx (use the `secured` pipelines env var option) | from IAM User credentials           |


**Use with Bitbucket Pipeline:**
Add a `bitbucket-pipelines.yml` file to your Bitbucket repository

```yaml
# filename: bitbucket-pipelines.yml

image: sergiomenda/node_awscli

pipelines:
  default:
    - step:
        script:
          - sh /aws-init.sh
          - aws <command>
```
