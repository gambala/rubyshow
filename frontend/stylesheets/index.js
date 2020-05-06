import './application.sass';

const cache = {};

function importAll (r) {
  r.keys().forEach(key => cache[key] = r(key));
}

importAll(require.context('./blocks', true, /\.sass$/));
