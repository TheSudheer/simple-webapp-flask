
# **Simple Web Application**

Note: This repository was forked from KodeKloud. The original repository has been modified with changes to the Dockerfile and added improvements.

This is a simple web application built with [Python Flask](http://flask.pocoo.org/) and [MySQL](https://www.mysql.com/) database. 

This repository now uses a completely rewritten **Dockerfile** to containerize the application effectively. The updated Dockerfile leverages **multi-stage builds** for better optimization and performance. 

---

## **Features of Updated Dockerfile**
- Multi-stage builds for separating build and runtime environments.
- Uses `gunicorn` for running the web server, providing better scalability and production readiness.
- Exposes port `8080` for serving the application.

---

## **Getting Started**

### **1. Install Required Dependencies**

If you are running this without Docker, ensure the following dependencies are installed:

#### Install Python and its libraries:
```bash
apt-get install -y python3 python3-setuptools python3-dev build-essential python3-pip default-libmysqlclient-dev
```

#### Install Flask and MySQL Connector:
```bash
pip3 install flask
pip3 install flask-mysql
```

---

### **2. Configure the Web Application**

- Copy the `app.py` file or download it from the repository.
- Configure database credentials and parameters in `app.py` if applicable.

---

### **3. Start the Web Server**

#### **Using Python directly:**
```bash
python3 app.py
```
- This runs the application using Python’s built-in server, which is suitable for development environments.

#### **Using Gunicorn:**
```bash
gunicorn -b 0.0.0.0:8080 app:app
```
**Explanation of Gunicorn Command:**
- `gunicorn`: The Gunicorn HTTP server for Python WSGI applications.
- `-b 0.0.0.0:8080`: Binds the server to all network interfaces (`0.0.0.0`) on port `8080`.
- `app:app`: Specifies the Python module and the WSGI application object. Here, the first `app` refers to the `app.py` file, and the second `app` refers to the Flask application object inside `app.py`.

Using Gunicorn is recommended for production deployments due to its ability to handle multiple requests efficiently.

---

## **4. Running the Application with Docker**

### **Building the Docker Image**
Run the following command to build the image:
```bash
docker build -t my-web-app .
```

### **Running the Docker Container**
Start the container:
```bash
docker run -p 8080:8080 my-web-app
```

#### **Access the Application**
- Open your browser and go to:
```
http://localhost:8080
```

---

## **Testing the Application**

You can test the following routes after running the application:

- **Welcome Message**:  
  ```
  http://<IP>:8080
  ```
  Expected Output:  
  ```
  Welcome
  ```

- **Dynamic Message**:  
  ```
  http://<IP>:8080/how%20are%20you
  ```
  Expected Output:  
  ```
  I am good, how about you?
  ```

---

## **Changes Made to This Repository**
- Completely rewrote the Dockerfile to use multi-stage builds.
- Added instructions for running the application with both **Python** and **Gunicorn**.
- Included optimizations to minimize the Docker image size and enhance the performance of the container.

