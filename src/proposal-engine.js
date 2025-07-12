// 📌 وحدة إدارة المقترحات
const fs = require('fs');
const path = './proposals/proposal-review.json';

function listProposals() {
  const data = JSON.parse(fs.readFileSync(path, 'utf8'));
  console.log("\n📋 قائمة المقترحات:");
  data.proposals.forEach((p, i) => {
    console.log(`\n[${i+1}] ${p.title}`);
    console.log(`  النوع: ${p.type}`);
    console.log(`  الحالة: ${p.status}`);
    console.log(`  من: ${p.created_by} | بتاريخ: ${p.date}`);
  });
}

module.exports = { listProposals };