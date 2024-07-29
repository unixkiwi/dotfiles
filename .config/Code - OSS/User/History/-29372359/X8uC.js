document.addEventListener('DOMContentLoaded', () => {
    const label = document.querySelector('span[role="presentation"]');
    if (label && label.textContent.includes('Custom New Tab')) {
        label.style.display = 'none';
    }
});
