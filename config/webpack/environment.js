const { environment } = require('@rails/webpacker')

function environmentCssAlias() {
  // If there is no environment-specific CSS for the current environment, alias the
  // non-existent file to a temp file so webpack won't blow up.
  const path = require('path');
  let envCss = path.resolve(__dirname, `../../app/assets/stylesheets/${process.env.RAILS_ENV}.css`);

  const fs = require('fs');
  if (!fs.existsSync(envCss)) {
    var tmp = require('tmp');
    envCss = tmp.fileSync().name;
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
