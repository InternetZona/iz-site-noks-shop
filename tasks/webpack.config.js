const path = require('path');

const config = require('./config');
const mode = require('./utils/mode');

const JS_DEV = path.resolve(config.project.dev, config.js.dev);
const JS_DIST = path.resolve(config.project.dist, 'assets/components', config.project.name, 'templates', config.project.template, config.js.dist);

const webpackConfig = {
  mode: (mode.production) ? 'production' : 'development',
  context: JS_DEV,
  entry: {
    app: ['./app.js'],
  },
  output: {
    path: JS_DIST,
    filename: 'app.js',
  },
  module: {
    rules: [
      {
        test: /\.js$/,
        exclude: path.resolve(__dirname, 'node_modules/'),
        loader: 'babel-loader',
        options: {
          presets: [
            [
              'env',
              { modules: false },
            ],
          ],
        },
      },
    ],
  },
  resolve: {
    modules: [
      JS_DEV,
      'node_modules',
    ],
    extensions: config.js.extensions,
  },
  plugins: [],
};

module.exports = webpackConfig;
