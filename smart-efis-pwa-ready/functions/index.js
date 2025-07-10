
const functions = require("firebase-functions");
const admin = require("firebase-admin");
const nodemailer = require("nodemailer");

admin.initializeApp();

// إعداد Gmail
const transporter = nodemailer.createTransport({
  service: "gmail",
  auth: {
    user: "YOUR_EMAIL@gmail.com",
    pass: "YOUR_APP_PASSWORD" // استخدم كلمة مرور تطبيق (App Password)
  }
});

exports.alertAdmin = functions.https.onCall(async (data, context) => {
  const message = {
    from: "Smart EFIS Alert <YOUR_EMAIL@gmail.com>",
    to: "jaouher.gassmi.97@gmail.com",
    subject: "🚨 Smart EFIS – Suspicious Activity Detected",
    text: `Activity: ${data.reason}\nUser: ${data.user || "Anonymous"}\nTime: ${new Date().toISOString()}`
  };

  try {
    await transporter.sendMail(message);
    return { success: true };
  } catch (err) {
    console.error("Failed to send alert:", err);
    return { success: false, error: err.toString() };
  }
});
