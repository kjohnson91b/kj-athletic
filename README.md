# kj-athletic-presentation
A react application that allows users to search for NBA players and view their statistics. 


# High-Level System Diagram
### Frontend
User -> Route53 (nba.kjohnson.io) -> CloudFront -> S3-hosted react app.
### Backend
Frontend -> Application Load Balancer -> ECS Fargate Service -> this presentation application(FastAPI based python app).
### External API
Backend -> NBA API(stats.nba.com)
*Utilizes https://github.com/swar/nba_api library*

# Running locally
1. Standup backend - `kj-athletic/backend` -> `docker build -t backend-nba:latest . && docker run -p 5000:5000 backend-nba:latest`
2. Standup frontend - `kj-athletic/frontend` -> `npm start `

# Accessing environment
Backend = http://127.0.0.1:5000
Frontend = http://localhost:3000

# Known issue
1. `stats.nba.com` blocks API calls coming from Cloud Providers
https://github.com/swar/nba_api/issues/176#issuecomment-771991604

A potential workaround is to send your API requests through a proxy first. e.g. SmartProxy


# Nice to haves 

### Database:
Backend -> DynamoDB/RDS.

*Planned on using DynamoDB to store pre-fetched/commonly searched player statistics which ideally would improve retrieval time and reduce API dependency.*

### CI/CD
An example pipeline would probably look something like.. 
- deploy terraform
- docker build backend & push to ECR
- npm build frontend & push assets to S3. 
*Potentially a cloudfront invalidation step / ensure ECS task is refreshed if reusing same image tag. either via taint existing tasks or force deploy. or better yet append a unique image tag per build, git sha for example.*