/**
 * Build Css
 */
const path = require('path');
const gulp = require('gulp');
const glob = require('glob');

const gulpLoadPlugins = require('gulp-load-plugins');

const $ = gulpLoadPlugins();

const config = require('./config');
const mode = require('./utils/mode');

const ignoreUnCss = [];

gulp.task('css', () =>
  gulp.src(path.join(config.project.dev, config.css.dev, 'style.scss'))
    .pipe($.plumber({ errorHandler: $.notify.onError('Error: <%= error.message %>') }))
    .pipe($.if(!mode.production, $.sourcemaps.init()))
    .pipe($.sass({
      includePaths: ['./node_modules'],
      outputStyle: 'expanded',
      sourceMap: true,
      errLogToConsole: true,
    }))
    .pipe($.if(config.css.unCss, $.uncss({
      html: glob.sync(path.join(config.project.dev, './**/*.tpl')),
      ignore: ignoreUnCss,
    })))
    .pipe($.autoprefixer({ browsers: ['last 3 version'] }))
    .pipe($.cleanCss({
      level: {
        1: {
          specialComments: 0,
        },
      },
    }))
    .pipe($.if(!mode.production, $.sourcemaps.write()))
    .pipe(gulp.dest(path.join(config.project.dist, 'assets/components', config.project.name, 'templates', config.project.template, config.css.dist))));
