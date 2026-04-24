# 🚀 DevOps & Cloud Support Chatbot (Ollama Llama 3)

This project is a personal attempt to build a **secure, AI-powered chatbot** that can help with DevOps and cloud-related queries — without relying on external APIs.

The idea was simple:
👉 *“Can I build my own ChatGPT-like assistant for DevOps… but keep everything private and under my control?”*

This project is the answer.

---

## 📌 What This Project Does

It creates a **private AI chatbot** that can:

* Help with AWS and DevOps questions
* Assist in debugging infrastructure issues
* Act like a personal cloud support assistant

All of this runs on **Ollama (Llama 3)** hosted on AWS — meaning your data never leaves your system.

---

## 🏗️ How It Works (Simple View)

* Terraform sets up the AWS infrastructure
* EC2 runs the Ollama model
* The chatbot UI connects to the model
* Everything stays inside a **private network (no public exposure)**

---

## 🔐 Why This Is Different

Most AI apps:

* Send your data to external APIs ❌

This project:

* Runs everything locally on cloud (AWS EC2) ✅
* Keeps your data private ✅
* Gives you full control over infrastructure ✅

---

## 📁 Project Structure

```
.
├── infrastructure/   # Terraform code (AWS setup)
├── chatbot-ui/       # Simple frontend UI
└── README.md
```

---

## 🚀 Getting Started

1. Go to infrastructure folder:

   ```bash
   cd infrastructure
   ```

2. Initialize Terraform:

   ```bash
   terraform init
   ```

3. Preview changes:

   ```bash
   terraform plan
   ```

4. Deploy everything:

   ```bash
   terraform apply
   ```

5. Upload frontend files from `chatbot-ui/` to S3

---

## 🔓 How to Access

Since this is a **private setup**, there’s no public URL.

### Option 1: SSH Tunnel

```bash
ssh -i key.pem -L 11434:localhost:11434 ec2-user@<instance-private-ip>
```

Then open:

```
http://localhost:11434
```

### Option 2: AWS SSM

* Connect using Session Manager (no SSH needed)

---

## 🔒 Security Approach

Instead of adding authentication, this project focuses on **network-level security**:

* No public endpoints
* Private subnets only
* Controlled access via SSH / SSM

👉 Simple rule followed:

> *If it’s not exposed, it’s already protected.*

---

## ⚙️ Customization

You can tweak things from:

```
infrastructure/variables.tf
```

* Instance type (cost vs performance)
* AMI ID
* Ollama model

---

## 🎯 Use Cases

* Personal DevOps assistant
* AWS learning companion
* Internal team support tool
* Experimenting with private AI systems

---

## 🛠️ Tech Stack

* AWS (EC2, VPC, S3, IAM, SSM)
* Terraform
* Ollama (Llama 3)
* HTML, CSS, JavaScript

---

## 💡 What I Learned

* How to design **secure cloud architectures**
* Managing private vs public access in AWS
* Running AI models without external APIs
* Real-world Terraform usage

---

## 🚧 Future Improvements

* Add backend API layer
* Add authentication (if needed)
* Monitoring with CloudWatch
* Better UI/UX

---

## 👨‍💻 Author

**Dilip Bhanushali**

---

👉 If you found this useful or interesting, feel free to star ⭐ the repo!
