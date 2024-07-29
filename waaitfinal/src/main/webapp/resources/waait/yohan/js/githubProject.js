/**
 * 
 */
 document.getElementById('repoForm').addEventListener('submit', function(event) {
            event.preventDefault();
            
            const name = document.getElementById('name').value;
            const description = document.getElementById('description').value;
            const isPrivate = document.getElementById('isPrivate').checked;

            const data = {
                name: name,
                description: description,
                private: isPrivate
            };

            fetch('/repos', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(data)
            })
            .then(response => response.json())
            .then(data => {
                alert('Repository created: ' + data.name);
            })
            .catch((error) => {
                console.error('Error:', error);
                alert('Failed to create repository');
            });
        });

          document.getElementById('uploadForm').addEventListener('submit', function(event) {
            event.preventDefault();
            
            const owner = document.getElementById('uploadOwner').value;
            const repo = document.getElementById('uploadRepo').value;
            const path = document.getElementById('path').value;
            const message = document.getElementById('message').value;
            const file = document.getElementById('file').files[0];

            const formData = new FormData();
            formData.append('file', file);
            formData.append('message', message);

            fetch(`/repos/${owner}/${repo}/contents/${path}`, {
                method: 'POST',
                body: formData
            })
            .then(response => response.text())
            .then(data => {
                alert(data);
            })
            .catch((error) => {
                console.error('Error:', error);
                alert('Failed to upload file');
            });
        });