const targets = new Set([
  '20/baseline-node20',
  '20/baseline-node20-alpine',
  '20/baseline-node20-full',
  '20/baseline-node20-puppeteer',
  '20/baseline-node20-full-puppeteer',
  '22/baseline-node22',
  '22/baseline-node22-alpine',
  '22/baseline-node22-full',
  '22/baseline-node22-puppeteer',
  '22/baseline-node22-full-puppeteer',
  '24/baseline-node24',
  '24/baseline-node24-alpine',
  '24/baseline-node24-full',
  '24/baseline-node24-puppeteer',
  '24/baseline-node24-full-puppeteer',
])

const target = process.argv[2] ?? '20/baseline-node20'
if (!targets.has(target)) {
  throw new Error(`未知构建目标：${target}。可用目标：${[...targets].join(', ')}`)
}

await import(`../${target}/build.js`)
