/**
 * Cleaner
 */
const path = require('path');
const del = require('del');
const gulp = require('gulp');

const config = require('./config');

gulp.task('clean', () => {
  const folderDelete = [path.join(config.project.dist, 'assets/components', config.project.name, 'templates', config.project.template)];
  del.sync(folderDelete);
});
