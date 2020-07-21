import 'rails-plus/es6/bundles/modernizr';
import 'what-input';
import 'whatwg-fetch';
import 'dom4';
import 'modules/pagy.js.erb';
import 'stylesheets';

import Rails      from 'rails-ujs';
import Turbolinks from 'turbolinks';

import FlashItems from 'modules/FlashItems';
import PageEvent  from 'modules/PageEvent';
import Tooltips   from 'modules/Tooltips';

window.Rails = Rails;

FlashItems.start();
Rails.start();
Tooltips.start();
Turbolinks.start();

PageEvent.delegate('turbolinks:load', 'page:load');
