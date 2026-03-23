# Cloud-Engineering-Challenge

**Instructions to run locally**
The goal of this project is to generate SSL certificates: To simulate a production HTTPS environment
Steps to run locally:
1)run sh gen-certs.sh (If using Git Bash on Windows, this script handles the double-slash pathing requirements)
2)Use Docker Compose to start the service by running (docker-compose up --build)
3)go to https://localhost (You will need to bypass the browser's self-signed certificate warning). 
**A short explanation of your design choices**
Nginx: I chose Nginx for its lightweight footprint and robust handling of SSL/TLS termination. ensuring all traffic is encrypted before reaching the application layer. To ensure cross-platform reliability utilized the COPY command in the Dockerfile to inject configuration and certificates directly into the image at build time. Instead of simple IP whitelisting, I implemented x-api-key validation within the Nginx configuration. This demonstrates a "Zero Trust" approach
**What you would improve with more time**
I would replace self-signed certs with Google-managed SSL certificates attached to a Global External HTTP(S) Load Balancer
I would implement a GitHub Actions workflow to automatically run security scans
I would add Cloud Logging and Cloud Monitoring to track 4xx/5xx error rates and latency,
**Any AI prompts/tools you used**
Cursor: To help troubleshoot cert issues that i came across
Docker
ChatGPT: To get ideas on what to do
**How you would deploy this to a cloud provider such as AWS, Azure, or GCP**
I would move the Docker image to a private Google Artifact Registry.Also use a Cloud Run service to handle SSL termination using Google-managed SSL certificates.I would also attach a Cloud Armor security policy for protection against SQL injection and DDoS attacks.
E**xplain why storing a private SSL key in a repository would be a bad practice.**
Storing a private SSL key in a repository would be a bad practice becuase everyone that comes across the repository can see and uses the private SSL key
