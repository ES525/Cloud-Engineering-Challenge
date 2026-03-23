## Instructions to Run Locally

The goal of this project is to generate SSL certificates to simulate a production HTTPS environment.

### Steps to run locally

1. Run `sh gen-certs.sh`  
   (If using Git Bash on Windows, this script handles the double-slash pathing requirements)

2. Use Docker Compose to start the service by running:  
   `docker-compose up --build`

3. Go to `https://localhost`  
   (You will need to bypass the browser's self-signed certificate warning)

### A Short Explanation of Your Design Choices

**Nginx:** I chose Nginx for its lightweight footprint and robust handling of SSL/TLS termination, ensuring all traffic is encrypted before reaching the application layer.  

To ensure cross-platform reliability, I utilized the `COPY` command in the Dockerfile to inject configuration and certificates directly into the image at build time.  

Instead of simple IP whitelisting, I implemented `x-api-key` validation within the Nginx configuration. This demonstrates a "Zero Trust" approach.

### What You Would Improve With More Time

- Replace self-signed certs with Google-managed SSL certificates attached to a Global External HTTP(S) Load Balancer.
- Implement a GitHub Actions workflow to automatically run security scans.
- Add Cloud Logging and Cloud Monitoring to track 4xx/5xx error rates and latency.

### Any AI Prompts/Tools You Used

- Cursor: To help troubleshoot cert issues.
- Docker
- ChatGPT: To get ideas on what to do.

### How You Would Deploy This to a Cloud Provider

- Move the Docker image to a private Google Artifact Registry.
- Use a Cloud Run service to handle SSL termination using Google-managed SSL certificates.
- Attach a Cloud Armor security policy for protection against SQL injection and DDoS attacks.

### Why Storing a Private SSL Key in a Repository is Bad Practice

Storing a private SSL key in a repository is dangerous because anyone who accesses the repository can see and use the private SSL key.
