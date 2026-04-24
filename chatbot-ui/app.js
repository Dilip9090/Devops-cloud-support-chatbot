const form = document.getElementById('chat-form');
const input = document.getElementById('user-input');
const chatWindow = document.getElementById('chat-window');

form.addEventListener('submit', async (event) => {
  event.preventDefault();
  const message = input.value.trim();
  if (!message) return;

  appendMessage('You', message, 'user');
  input.value = '';
  toggleInput(true);

  try {
    const response = await fetch('/api/chat', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({
        model: 'llama3',
        messages: [{ role: 'user', content: message }]
      })
    });

    if (!response.ok) {
      throw new Error(`Server returned ${response.status}`);
    }

    const data = await response.json();
    const reply = data?.response || data?.message?.content || JSON.stringify(data);
    appendMessage('Bot', reply, 'bot');
  } catch (error) {
    appendMessage('Bot', `Error: ${error.message}`, 'bot');
  } finally {
    toggleInput(false);
  }
});

function appendMessage(author, text, cssClass) {
  const wrapper = document.createElement('div');
  wrapper.className = `message ${cssClass}`;
  wrapper.innerHTML = `<strong>${author}:</strong> ${escapeHtml(text)}`;
  chatWindow.appendChild(wrapper);
  chatWindow.scrollTop = chatWindow.scrollHeight;
}

function toggleInput(disabled) {
  input.disabled = disabled;
  document.getElementById('send-btn').disabled = disabled;
}

function escapeHtml(raw) {
  return raw
    .replace(/&/g, '&amp;')
    .replace(/</g, '&lt;')
    .replace(/>/g, '&gt;')
    .replace(/"/g, '&quot;')
    .replace(/'/g, '&#039;');
}
