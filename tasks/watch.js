/**
 * Watcher
 */

const path = require('path');
const gulp = require('gulp');
const watch = require('gulp-watch');

const config = require('./config');

gulp.task('watch', () => {
  const folders = ['html', 'css', 'js', 'img', 'fonts', 'svg', 'php'];

  folders.forEach((task) => {
    watch(path.resolve(config.project.dev, config[task].dev), () => {
      gulp.start(task);
    });
  });
});
