import $ from 'jquery';
import html from 'rails-plus/es6/modules/html';

const flash = (group, message) => html`
  <div class="flash-item flash-item_${group}">
    <div class="flash-item__body flash-item__body_${group}">
      <div class="flash-item__close" />
      ${message}
    </div>
  </div>
`;

const add = (group, message) => {
  $('#flashes').append(flash(group, message));
  timedAll();
};

const hide = (flashItem) => {
  flashItem.classList.add('flash-item_closed');
};

const delegateClick = (event) => {
  const flashItem = event.target.closest('.flash-item');
  const button = event.target.closest('.button');
  if (!flashItem) return;
  if (button) return;
  hide(flashItem);
  event.preventDefault();
};

const timedElement = (element) => {
  setTimeout(() => { hide(element); }, 5000);
  element.classList.add('flash-item_timed');
};

const timedAll = () => {
  const elements = document.querySelectorAll('.flash-item_notice:not(.flash-item_timed)');
  Array.from(elements).forEach(element => timedElement(element));
};

const start = () => {
  document.addEventListener('click', delegateClick);
  document.addEventListener('page:load', timedAll);
  document.addEventListener('ajax:success', timedAll);
};

export default { add, hide, timedAll, timedElement, start };
