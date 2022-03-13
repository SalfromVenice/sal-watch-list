const showIt = (target, form) => {
  target.addEventListener('click', () => {
    form.classList.remove('d-none');
  });
};

const initShow = () => {
  const button = document.querySelector('.show');
  const form = document.querySelector('.bg');
  if (button) {
    showIt(button, form);
  }
};

export { initShow };
