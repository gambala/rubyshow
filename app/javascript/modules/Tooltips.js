import tippy, { roundArrow } from 'tippy.js/dist/tippy.umd.min.js';

const getContent = (node) => {
  if (node.title) {
    const title = node.title;
    node.removeAttribute('title');
    return title;
  }

  const templateID = node.getAttribute('data-template');

  if (templateID) {
    const template = node.parentNode.querySelector(`#${templateID}`);
    template.classList.remove('hidden');
    return template;
  }
};

const initNode = (node) => {
  let params = {
    animation: 'shift-toward-extreme',
    arrow: roundArrow,
    content: getContent(node),
    duration: [150, 200],
    theme: 'light',
    trigger: 'mouseenter focus click',
  }

  // params = {...params, hideOnClick: false, showOnCreate: true, trigger: 'click' }; // Uncomment for debug purposes

  tippy(node, params);
  node.classList.add('with-tooltip_initialized');
};

const initAll = () => {
  const nodes = document.querySelectorAll('.with-tooltip:not(.with-tooltip_initialized)');
  Array.from(nodes).forEach(node => initNode(node));
};

const start = () => {
  document.addEventListener('page:load', initAll);
  document.addEventListener('ajax:success', initAll);
};

export default { initAll, initNode, start };
