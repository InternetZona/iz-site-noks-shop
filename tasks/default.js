/**
 * Default task
 */
const runSequence = require('run-sequence');
const gulp = require('gulp');

const mode = require('./utils/mode');

const assets = ['fonts', 'img', 'svg', 'css', 'js'];
const core = ['html', 'php'];

gulp.task('default', (cb) => {
  mode.production
    ? runSequence('clean', assets, core, 'size', cb)
    : runSequence(assets, core, 'watch', cb);
});
