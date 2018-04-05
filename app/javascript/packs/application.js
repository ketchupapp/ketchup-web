// Application JS
import "ketchup.js";

// Stylesheets
import "tachyons-verbose/css/tachyons.css";
import "stylesheets/ketchup.css";
/* Environment-specific CSS, if it exists */
import(/* webpackMode: "eager" */ `stylesheets/${process.env.RAILS_ENV}.css`);

// Fonts
import "fonts/prompt-light.ttf";
import "fonts/fredokaone.ttf";

// Images
import "images/logo_sketch.png";
