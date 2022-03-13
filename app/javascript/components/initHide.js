const hideIt = (target, form) => {
  target.addEventListener('click', () => {
    form.classList.add('d-none');
  });
};

const initHide = () => {
  const button = document.querySelector('.x');
  const form = document.querySelector('.bg');
  if (button) {
    hideIt(button, form);
  }
};

export { initHide };
