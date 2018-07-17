/**
 * Size report
 */
const gulp = require('gulp');
const path = require('path');

const gulpLoadPlugins = require('gulp-load-plugins');

const $ = gulpLoadPlugins();

const config = require('./config.json');

gulp.task('size', () =>
  gulp
    .src(path.join(config.project.dist, 'assets/components', config.project.name, 'templates', config.project.template, '/**/*.+(css|js)'))
    .pipe($.sizereport()));
