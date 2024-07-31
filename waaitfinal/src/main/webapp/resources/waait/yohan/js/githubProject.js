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

       