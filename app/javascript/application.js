import "rails-plus/es6/bundles/modernizr";
import "what-input";
import "whatwg-fetch";
import "dom4";
import "@hotwired/turbo-rails"

import FlashItems from "./modules/FlashItems";
import PageEvent from "./modules/PageEvent";
import RateCourse from "./modules/RateCourse";
import Tooltips from "./modules/Tooltips";

FlashItems.start();
RateCourse.start();
Tooltips.start();

PageEvent.delegate("turbo:load", "page:load");

if (document.readyState !== "loading") {
  const event = document.createEvent("Event");
  event.initEvent("DOMContentLoaded", true, true);
  window.document.dispatchEvent(event);
}
