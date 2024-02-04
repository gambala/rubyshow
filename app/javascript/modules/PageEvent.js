const delegate = (eventFrom, eventTo) => {
  document.addEventListener(eventFrom, () => { dispatch(eventTo); } );
}

const dispatch = (eventName) => {
  const newEvent = document.createEvent('HTMLEvents');
  newEvent.initEvent(eventName, true, true);
  newEvent.eventName = eventName;
  document.dispatchEvent(newEvent);
};

export default { delegate, dispatch };
