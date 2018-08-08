/**
 * Build PHP
 */
const path = require('path');
const gulp = require('gulp');

const config = require('./config');

gulp.task('php', () =>
  gulp.src(path.join(config.project.dev, config.php.dev, './**/*.php'))
    .pipe(gulp.dest(path.join(config.project.dist, 'core/components', config.project.name))));
