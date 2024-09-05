export default function html(literals, ...substs) {
  return literals.raw.reduce((acc, lit, i) => {
    let subst = substs[i - 1];
    if (Array.isArray(subst)) { subst = subst.join(''); }

    if (acc.endsWith('$')) {
      subst = htmlEscape(subst);
      acc = acc.slice(0, -1);
    }

    return acc + subst + lit;
  });
}
