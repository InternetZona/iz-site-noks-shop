/**
 * Build image
 */

const path = require('path');
const gulp = require('gulp');
const pngquant = require('imagemin-pngquant');

const gulpLoadPlugins = require('gulp-load-plugins');

const $ = gulpLoadPlugins();

const config = require('./config');

gulp.task('img', () =>
  gulp.src(path.join(config.project.dev, config.img.dev, config.img.extensions))
    .pipe($.plumber({ errorHandler: $.notify.onError('Error: <%= error.message %>') }))
    .pipe($.changed(path.join(config.project.dist, 'assets/components', config.project.name, 'templates', config.project.template, config.img.dist)))
    .pipe($.imagemin({
      progressive: true,
      svgoPlugins: [
        { removeViewBox: false },
        { cleanupIDs: false },
      ],
      use: [
        //pngquant(),
      ],
    }))
    .pipe(gulp.dest(path.join(config.project.dist, 'assets/components', config.project.name, 'templates', config.project.template, config.img.dist))));
