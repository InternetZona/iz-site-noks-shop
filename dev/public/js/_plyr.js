const Plyr = require('plyr');

(function() {
  Array.from(document.querySelectorAll('.content-player')).map((elem) => {
    let videoHash = elem.parentElement.dataset.videoHash;
    console.log(videoHash);
    let player = new Plyr(elem, {
      autoplay: false,
      settings: [],
    });
    player.source = {
      type: 'video',
      sources: [
        {
          src: videoHash,
          provider: 'youtube'
        }
      ]
    };
  });
})();