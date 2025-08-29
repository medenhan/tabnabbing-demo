```markdown
# Tabnabbing Vulnerability Demo

This project demonstrates a common web security vulnerability known as **tabnabbing**.  
It uses three simple HTML files to show how a malicious page opened with `target="_blank"` can secretly redirect the original page to a fake phishing site.  

The demo also includes the **fix**, showing how to prevent this attack using the `rel="noopener noreferrer"` attribute.

---

## 🚀 How to Run the Demo

You can run this demo in two ways:

### Method 1: Direct Method
The HTML files are already included in this repository.

1. Clone or download this repository.
2. Open the `index.html` file in your web browser.
3. Click the **"Click Here for a Prize!"** button.
4. Observe how the original tab is secretly redirected to the fake login page.

---

### Method 2: Using the Setup Script
This method regenerates the demo files using the provided script.

1. Clone or download this repository.
2. Open a terminal in the project’s directory.
3. Make the script executable:

   ```bash
   chmod +x setup.sh
   ```

4. Run the script:

   ```bash
   ./setup.sh
   ```

5. Once the script finishes, open the newly created `index.html` in your browser and click the button to see the demo.

---

## 🛠️ The Vulnerability and the Fix

The code in this project uses a JavaScript `window.open()` call to demonstrate the vulnerability.

### Vulnerable JavaScript Code
```javascript
// Opens a malicious page without protection
window.open('malicious.html');
```
And replace it with this line, which adds 'noopener' as the third argument:

### Fixed JavaScript Code
```javascript
// Opens a new tab safely by severing access to window.opener
window.open('malicious.html', '_blank', 'noopener');
```

---
### Note on Standard HTML Links 
For projects that use a standard HTML <a> tag instead of JavaScript, the fix is to add the rel="noopener noreferrer" attribute.

### Vulnerable HTML Link
```html
<a href="malicious.html" target="_blank">Click Here</a>
```

### Fixed HTML Link
```html
<a href="malicious.html" target="_blank" rel="noopener noreferrer">Click Here</a>
```

---

## 📚 Additional Notes

- `noopener` ensures the new tab does not have access to `window.opener`.  
- `noreferrer` additionally hides the referrer information.  
- Always use these attributes when opening untrusted or external links with `target="_blank"`.  

---

## 🤝 Contributing

Contributions, issues, and suggestions are welcome!  
Feel free to open a pull request or file an issue if you’d like to improve the demo.

---

## 📄 License

This project is licensed under the MIT License.  
You are free to use, modify, and distribute it as long as proper attribution is provided.

---

## 🔗 Further Reading

- [MDN Web Docs: `rel=noopener`](https://developer.mozilla.org/en-US/docs/Web/HTML/Link_types/noopener)  
- [OWASP: Tabnabbing](https://owasp.org/www-community/attacks/Reverse_Tabnabbing)  
- [HTML Living Standard: `a` element](https://html.spec.whatwg.org/multipage/text-level-semantics.html#the-a-element)

---
```
