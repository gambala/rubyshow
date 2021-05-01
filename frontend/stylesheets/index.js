import './tailwind_base.sass';

const cache = {};
const importAll = (r) => { r.keys().forEach(key => cache[key] = r(key)); };
importAll(require.context('./blocks', true, /\.sass$/));

import './tailwind_utilities.sass';
