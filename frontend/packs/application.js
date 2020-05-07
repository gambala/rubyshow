import 'rails-plus/es6/libs';
import 'modules/pagy.js.erb';
import 'stylesheets';

import Rails      from 'rails-ujs';
import Turbolinks from 'turbolinks';

import FlashItems from 'modules/FlashItems';

window.Rails = Rails;

FlashItems.start();
Rails.start();
Turbolinks.start();
