const { environment } = require('@rails/webpacker')

function environmentCssAlias() {
  // If there is no environment-specific CSS for the current environment, alias the
  // non-existent file to the main application CSS file so webpack won't blow up.
  const fs = require('fs');
  const path = require('path');
  let envCss = path.resolve(__dirname, `../../app/assets/stylesheets/${process.env.RAILS_ENV}.css`);
  if (!fs.existsSync(envCss)) {
    envCss = path.resolve(__dirname, "../../app/assets/stylesheets/application.css");
  }

  return {
    resolve: {
      alias: {
        [`stylesheets/${process.env.RAILS_ENV}.css$`]: envCss,
      }
    }
  }
};

environment.config.merge(environmentCssAlias())

module.exports = environment
