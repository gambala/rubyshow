const esbuild            = require('esbuild');
const fs                 = require('fs');

const watch = process.argv.includes("--watch") && {
  onRebuild(error) {
    if (error) console.error("[watch] build failed", error);
    else console.log("[watch] build finished");
  },
};

esbuild
  .build({
    entryPoints: ["frontend/application.js"],
    bundle: true,
    metafile: true,
    outdir: "app/assets/builds",
    plugins: [
    ],
    watch: watch,
  })
  .catch(() => process.exit(1))
  .then((result) => {
    const data = JSON.stringify(result.metafile, null, 2);
    fs.writeFileSync('esbuild.stats.json', data);
  });
