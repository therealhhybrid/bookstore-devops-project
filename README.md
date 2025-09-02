# bookstore-devops-project

This is a sample DevOps project that demonstrates how to deploy a simple web application on **Azure** using:

- **Terraform** for Infrastructure as Code
- **GitHub Actions** for CI/CD automation
- **Azure App Service** for hosting
- **Azure Monitor & Application Insights** for monitoring

The project mimics a real-world scenario where a company wants to automate deployments and manage infrastructure with modern DevOps practices.


## Running Locally

1. Clone the repo:
   ```bash
   git clone https://github.com/<your-username>/bookstore-devops-project.git
   cd bookstore-devops-project/app

2. Create a virtual environment and install dependencies:
   python -m venv venv
source venv/bin/activate   # On Linux/Mac
venv\Scripts\activate      # On Windows
pip install -r requirements.txt

3. Run the app:
python main.py

4. Open in your browser: http://127.0.0.1:5000/
   
