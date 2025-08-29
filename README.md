# Tabnabbing Vulnerability Demo

This project demonstrates a web security vulnerability known as 'tabnabbing.' It uses three simple HTML files to show how a malicious page opened with `target="_blank"` can secretly redirect the original page to a fake phishing site. The demo also includes the fix, showing how to prevent this attack using the `rel="noopener noreferrer"` attribute.

### How to Run the Demo

1.  Open the folder containing the `index.html`, `malicious.html`, and `phishing.html` files.
2.  Open the `index.html` file in your web browser.
3.  Click the "Click Here for a Prize!" button.
4.  Observe how the original tab is secretly redirected to the fake login page.

### The Fix

This vulnerability is prevented by severing the connection between the original tab and the new tab. This is done by adding `rel="noopener noreferrer"` to an HTML link or by including `'noopener'` as a feature in the JavaScript `window.open()` function.

The `noopener` keyword prevents the new tab from accessing the `window.opener` object, removing its ability to redirect the original page.