/**
 * Build svg sprite
 */
const path = require('path');
const gulp = require('gulp');

const gulpLoadPlugins = require('gulp-load-plugins');

const $ = gulpLoadPlugins();

const config = require('./config');

const svgConf = {
  shape: {
    spacing: { padding: 10 },
    dimension: {
      maxWidth: 22,
      maxHeight: 22,
    },
  },
  mode: {
    css: {
      dimensions: true,
      common: 'icon',
      layout: 'vertical',
      prefix: '.icon-',
      bust: false,
      dest: './',
      sprite: path.join('../', config.svg.dist),
      render: {
        scss: { dest: path.join(config.project.dev, config.css.dev, 'vendor/_sprite.scss') },
      },
    },
  },
};

gulp.task('svg', () =>
  gulp.src(path.join(config.project.dev, config.svg.dev, '*.svg'))
    .pipe($.plumber({ errorHandler: $.notify.onError('Error: <%= error.message %>') }))
    .pipe($.svgSprite(svgConf))
    .pipe(gulp.dest(path.join(config.project.dist, 'assets/components/', config.project.name, config.project.template))));
