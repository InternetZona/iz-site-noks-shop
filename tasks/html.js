/**
 * Build HTML
 */
const path = require('path');
const gulp = require('gulp');

const gulpLoadPlugins = require('gulp-load-plugins');

const $ = gulpLoadPlugins();

const config = require('./config');

gulp.task('html', () =>
  gulp.src(path.join(config.project.dev, config.html.dev, './**/*.tpl'))
    .pipe($.plumber({ errorHandler: $.notify.onError('Error: <%= error.message %>') }))
    .pipe($.htmlmin({
      removeComments: true,
      collapseWhitespace: true,
      collapseBooleanAttributes: true,
      removeAttributeQuotes: false,
      removeRedundantAttributes: false,
      removeEmptyAttributes: true,
      removeScriptTypeAttributes: true,
      removeStyleLinkTypeAttributes: true,
      removeOptionalTags: true,
    }))
    .pipe(gulp.dest(path.join(config.project.dist, 'core/components', config.project.name))));
