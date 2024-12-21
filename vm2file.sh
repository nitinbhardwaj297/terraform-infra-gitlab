#!/bin/bash
# Update package lists
sudo apt update -y

# Install Apache2
sudo apt install -y apache2

# Create a styled HTML file
sudo tee /var/www/html/index.html <<EOF
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome to VM2</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f9;
            color: #333;
            text-align: center;
        }
        header {
            background-color: #007bff;
            color: white;
            padding: 20px 0;
        }
        h1 {
            margin: 0;
            font-size: 2.5rem;
        }
        p {
            font-size: 1.2rem;
            margin: 20px 0;
        }
        footer {
            margin-top: 30px;
            font-size: 0.9rem;
            color: #666;
        }
    </style>
</head>
<body>
    <header>
        <h1>Welcome to VM2</h1>
    </header>
    <main>
        <p>This web server is running on a virtual machine2.</p>
    </main>
    <footer>
        &copy; 2024 NITIN BHARDWAJ. All rights reserved.
    </footer>
</body>
</html>
EOF

# Start Apache and enable it to start on boot
sudo systemctl start apache2
sudo systemctl enable apache2


