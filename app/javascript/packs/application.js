import "fonts/nunitosans-regular.ttf";
import "fonts/fredokaone.ttf";
import "images/logo_sketch.png";
import "stylesheets/application.css";

if (["development"].includes(process.env.RAILS_ENV)) {
  require(`stylesheets/${process.env.RAILS_ENV}.css`);
}

import Rails from "rails-ujs";
import Turbolinks from "turbolinks";

Rails.start();
Turbolinks.start();
