function logSign() {
    let x = document.getElementById('login-container');
    let y = document.getElementById('register-container');

    if (this.id === 'signup-btn') {
        x.style.display = 'none';
        y.style.display = 'block';
    } else {
        x.style.display = 'block';
        y.style.display = 'none';
    }
}