/**
 * Build font
 */
const path = require('path');
const gulp = require('gulp');

const config = require('./config');

gulp.task('fonts', () =>
  gulp.src(path.join(config.project.dev, config.fonts.dev, config.fonts.extensions))
    .pipe(gulp.dest(path.join(config.project.dist, 'assets/components/', config.project.name, 'templates', config.project.template, config.fonts.dist))));
