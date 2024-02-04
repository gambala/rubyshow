const initAll = () => {
  if (!document.querySelector('#comment_graduate')) return;

  document.querySelector('#comment_graduate').onchange = function(){
    if (this.checked)
      document.querySelector('.rate-course').classList.remove('hidden');
    else
      document.querySelector('.rate-course').classList.add('hidden');
  };
};

const start = () => {
  document.addEventListener('page:load', initAll);
  document.addEventListener('ajax:success', initAll);
};

export default { initAll, start };
