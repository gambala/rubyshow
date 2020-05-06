import 'rails-plus/es6/libs';
import 'modules/pagy.js.erb';
import 'stylesheets';

import Rails      from 'rails-ujs';
import Turbolinks from 'turbolinks';

window.Rails = Rails;

Rails.start();
Turbolinks.start();
