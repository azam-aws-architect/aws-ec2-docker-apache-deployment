# Deploying a Containerized Web Application using Docker on AWS EC2

## 🏢 Business Scenario & Client Requirement (Company Base)
* **Client:** NexusMedia (US-Based Digital Marketing Startup)
* **Problem:** The client faced frequent application crashes and environment inconsistency conflicts between development laptops and production servers ("It works on my machine" syndrome).
* **Solution:** Containerized the legacy web application using Docker to create an isolated, immutable deployment artifact and hosted it securely on an AWS EC2 instance.

---

## 🛠️ Tech Stack & Tools Used
* **Cloud Infrastructure:** AWS (Amazon Web Services) EC2
* **Containerization Engine:** Docker
* **Base OS:** Ubuntu Linux
* **Web Server:** Apache2 (HTTPD)
* **Configuration Tool:** Dockerfile

---

## 📐 Logical Architecture Diagram 
[ User Browser ] ──( Public IP :8080 )──► [ AWS EC2 Instance (Ubuntu Linux) ]
│
(Inbound Port 8080)
│
▼
[ Internet Users ] ◄─── (Port Mapping) ◄─── [ Live Docker Container (:80) ]
(Custom Apache Web Server)
---

## 🚀 Step-by-Step Implementation Log

### Step 1: Provision Cloud Infrastructure (AWS EC2)
1. Launched an AWS EC2 instance using **Ubuntu** on a **t3.micro** type.
2. Hardened network security by configuring **Inbound Security Group Rules**:
   * **SSH (Port 22):** Allowed for terminal management access.
   * **Custom TCP (Port 8080):** Opened to `0.0.0.0/0` (Anywhere) to route public traffic to our custom container app.

### Step 2: Install and Configure Docker Engine
Connected via SSH and ran the following server updates and runtime installations:
```bash
sudo apt-get update -y
sudo apt-get install docker.io -y
sudo systemctl start docker
sudo systemctl enable docker
BASH
mkdir nexusmedia-app && cd nexusmedia-app
echo "<h1>Welcome to NexusMedia - Containerized Web App Live on AWS EC2!</h1>" > index.html
