/**
 * Deploy task
 */
const gulp = require('gulp');
const path = require('path');
const ftp = require('vinyl-ftp');

const gulpLoadPlugins = require('gulp-load-plugins');

const $ = gulpLoadPlugins();

const Log = require('./utils/logger');
const mode = require('./utils/mode');
const config = require('./config');

const connConf = {
  host: config.deploy.hostname,
  user: config.deploy.username,
  password: config.deploy.password,
  parallel: 10,
  log: $.util.log,
};

const conn = ftp.create(connConf);

gulp.task('deploy', () => {
  let folderToPush = [path.join(config.project.dist, '/**')];

  if (config.project.dist === './') {
    folderToPush = ['./assets', './core'];
  }

  if (!mode.production) {
    new Log(
      'Deploy Task',
      'You can run Deploy Task only in Production Mode.\nUse: npm run deploy',
    ).error();
  }

  return gulp
    .src(folderToPush, { buffer: false })
    .pipe($.plumber({ errorHandler: $.notify.onError('Error: <%= error.message %>') }))
    .pipe($.prompt.confirm({
      message: 'Heads Up! Check ../config.json & Confirm deploy',
      default: false,
    }))
    .pipe(conn.newer(config.deploy.path))
    .pipe(conn.dest(config.deploy.path));
});
