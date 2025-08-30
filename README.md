# Tabnabbing Vulnerability Demo

This project demonstrates a common web security vulnerability known as **tabnabbing**.  

- It uses three simple HTML files to show how a malicious page opened with `target="_blank"` can secretly redirect the original page to a fake phishing site.  

- The demo also includes the **fix**, showing how to prevent this attack using the `rel="noopener noreferrer"` attribute.

## How to Run the Demo

The HTML files are already included in this repository.

1. To clone the repo run this command on your terminal:

```bash
   git clone https://github.com/medenhan/tabnabbing-demo.git
   ```

2. Navigate into the new folder and open `index.html` file in your web browser.
3. Click the **"Click Here for a Prize!"** button.
4. Then go back and observe how the original tab is secretly redirected to the fake login page.

---
### The Fix

The code in this repository uses a JavaScript `window.open()` function to demonstrate the vulnerability. The fix is to sever the connection between the original tab and the new tab by blocking access to the `window.opener` object.

To apply the fix, open the index.html file and find this vulnerable line within the <script> tag:

```javascript
// This line is vulnerable because it gives the new tab access to the original tab.
window.open('malicious.html');
```
Replace it with the following fixed line. The addition of 'noopener' as the third argument severs the connection between the tabs, blocking the attack.

```javascript
// Opens a new tab safely by severing access to window.opener
window.open('malicious.html', '_blank', 'noopener');
```
After applying this change, the original tab (index.html) will remain secure and will not be redirected. 

🎉 Congratulations! You have now successfully mitigated the Tabnabbing vulnerability.

---
### Note for Standard HTML Links
For projects that use a standard HTML `<a>` tag instead of JavaScript, the fix is to add the rel="noopener noreferrer" attribute.

### Vulnerable HTML Link
```html
<a href="malicious.html" target="_blank">Click Here</a>
```

### Fixed HTML Link
```html
<a href="malicious.html" target="_blank" rel="noopener noreferrer">Click Here</a>
```

---

## Additional Notes

- `noopener` ensures the new tab does not have access to `window.opener`.  
- `noreferrer` additionally hides the referrer information.  
- Always use these attributes when opening untrusted or external links with `target="_blank"`.  

---
## About the Setup Script (Optional)
This repository includes an automation script, setup.sh, that can regenerate the three HTML demo files from scratch.

This script is not needed to run the demo but is included to demonstrate how the project environment can be built automatically. To use it, run the following commands from the project's directory:

### Using the Setup Script
This method regenerates the demo files using the provided script.

1. Copy setup.sh code file from this repository.
2. Go to your directory, create new file and open it with your prefered code editor or note editor like notepad 
3. paste the code and save it setup.sh
4. Open a terminal in the project’s directory.
5. Make the script executable:

   ```bash
   chmod +x setup.sh
   ```

4. Run the script:

   ```bash
   ./setup.sh
   ```

5. Once the script finishes, open the newly created `index.html` in your browser and click the button to see the demo.

## Contributing

Contributions, issues, and suggestions are welcome!  
Feel free to open a pull request or file an issue if you’d like to improve the demo.

---

## License

This project is licensed under the MIT License.  
You are free to use, modify, and distribute it as long as proper attribution is provided.

---

## Further Reading

- [MDN Web Docs: `rel=noopener`](https://developer.mozilla.org/en-US/docs/Web/HTML/Link_types/noopener)  
- [OWASP: Tabnabbing](https://owasp.org/www-community/attacks/Reverse_Tabnabbing)  
- [HTML Living Standard: `a` element](https://html.spec.whatwg.org/multipage/text-level-semantics.html#the-a-element)


## Acknowledgments

This project was inspired by [Protect your Website from Target="_blank" vulnerability](https://www.youtube.com/watch?v=0hNDDpljJrs) YouTube demo-video.

---
