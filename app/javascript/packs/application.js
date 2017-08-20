import 'bundles/modernizr';
import 'element-closest';
import Rails      from 'rails-ujs';
import ServiceWorkerLoader from 'scripts/ServiceWorkerLoader';
import Turbolinks from 'turbolinks';

Rails.start();
ServiceWorkerLoader.start();
Turbolinks.start();

if (document.readyState !== 'loading') {
  const event = document.createEvent('Event');
  event.initEvent('DOMContentLoaded', true, true);
  window.document.dispatchEvent(event);
}
