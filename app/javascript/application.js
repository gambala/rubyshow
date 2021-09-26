import 'rails-plus/es6/bundles/modernizr';
import 'what-input';
import 'whatwg-fetch';
import 'dom4';
// import './modules/pagy.js.erb';

import Rails      from '@rails/ujs';
import Turbolinks from 'turbolinks';

import FlashItems from './modules/FlashItems';
import PageEvent  from './modules/PageEvent';
import RateCourse from './modules/RateCourse';
import Tooltips   from './modules/Tooltips';

window.Rails = Rails;

FlashItems.start();
Rails.start();
RateCourse.start();
Tooltips.start();
Turbolinks.start();

PageEvent.delegate('turbolinks:load', 'page:load');

if (document.readyState !== 'loading') {
  const event = document.createEvent('Event');
  event.initEvent('DOMContentLoaded', true, true);
  window.document.dispatchEvent(event);
}
