sudo yum update -y

# Install Apache web server (httpd)
sudo yum install -y httpd

# Create a simple HTML file to verify the web server is running
echo "<html><body><h1>Welcome to the Test Website</h1></body></html>" > /var/www/html/index.html

sudo systemctl start httpd
sudo systemctl enable httpd
