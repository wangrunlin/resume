const puppeteer = require('puppeteer');
const path = require('path');

async function generatePDF(inputFile, outputFile) {
  const browser = await puppeteer.launch({
    headless: 'new',
    args: ['--no-sandbox', '--disable-setuid-sandbox']
  });
  
  const page = await browser.newPage();
  
  // 加载本地 HTML 文件
  await page.goto(`file://${path.resolve(inputFile)}`, {
    waitUntil: 'networkidle0'
  });
  
  // 生成 PDF
  await page.pdf({
    path: outputFile,
    format: 'A4',
    margin: {
      top: '10mm',
      right: '10mm',
      bottom: '10mm',
      left: '10mm'
    },
    printBackground: true
  });
  
  await browser.close();
  console.log(`PDF generated: ${outputFile}`);
}

// 生成中文版 WMS 简历 PDF
generatePDF(
  path.join(__dirname, 'out/zh-wms.html'),
  path.join(__dirname, 'out/zh-wms.pdf')
).catch(console.error);