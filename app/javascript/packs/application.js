// Application JS
import "ketchup.js";

// Stylesheets
import "stylesheets/ketchup.css";
import "tachyons/css/tachyons.css";
/* Environment-specific CSS, if it exists */
import(/* webpackMode: "eager" */ `stylesheets/${process.env.RAILS_ENV}.css`);

// Fonts
import "fonts/nunitosans-regular.ttf";
import "fonts/fredokaone.ttf";

// Images
import "images/logo_sketch.png";
