import "fonts/nunitosans-regular.ttf";
import "fonts/fredokaone.ttf";
import "images/logo_sketch.png";

// Stylesheets
import "stylesheets/application.css";
/* Environment-specific CSS, if it exists */
import(/* webpackMode: "eager" */ `stylesheets/${process.env.RAILS_ENV}.css`);

import Rails from "rails-ujs";
import Turbolinks from "turbolinks";

Rails.start();
Turbolinks.start();
