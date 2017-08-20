const start = () => {
  if (!navigator.serviceWorker) return;
  navigator.serviceWorker
    .register('/serviceworker.js', { scope: './' })
    .then(() => { console.log('Service worker registered!'); });
};

export default { start };
