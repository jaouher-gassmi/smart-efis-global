
const translations = {
  en: {
    title: "Smart EFIS",
    subtitle: "Smart Electronic Flight Information System for Hang Gliding",
    start: "START",
    login: "Login",
    register: "Register"
  },
  ar: {
    title: "نظام الطيران الذكي",
    subtitle: "نظام المعلومات الذكي للطيران الشراعي",
    start: "ابدأ الرحلة",
    login: "تسجيل الدخول",
    register: "إنشاء حساب"
  }
};

let currentLang = "en";

function toggleLanguage() {
  currentLang = currentLang === "en" ? "ar" : "en";
  document.getElementById("title").textContent = translations[currentLang].title;
  document.getElementById("subtitle").textContent = translations[currentLang].subtitle;
  document.getElementById("langLabel").textContent = currentLang === "en" ? "English" : "عربي";
}

function showModal(type) {
  document.getElementById("authModal").classList.remove("hidden");
}

function closeModal() {
  document.getElementById("authModal").classList.add("hidden");
}

const firebaseConfig = {
  apiKey: "AIzaSyAubwstU2qGdJZLCMCmaZVGxfzLbmqMFmM",
  authDomain: "smat-efis-ai.firebaseapp.com",
  projectId: "smat-efis-ai",
  storageBucket: "smat-efis-ai.firebasestorage.app",
  messagingSenderId: "298649583256",
  appId: "1:298649583256:web:0e772a74353dacb8355aed",
  measurementId: "G-8HRHV879D6"
};

firebase.initializeApp(firebaseConfig);
const auth = firebase.auth();
const db = firebase.firestore();

document.getElementById("authForm").onsubmit = async (e) => {
  e.preventDefault();
  const email = e.target.email.value;
  const password = e.target.password.value;
  const name = e.target.name.value;
  const phone = e.target.phone.value;
  const birthdate = e.target.birthdate.value;
  const gender = e.target.gender.value;
  const terms = e.target.terms.checked;
  const warning = document.getElementById("warning");

  if (!terms) return warning.innerText = "You must accept the terms!";

  try {
    const cred = await auth.createUserWithEmailAndPassword(email, password);
    await db.collection("users").doc(cred.user.uid).set({
      name, phone, birthdate, gender, email
    });
    alert("Registration successful!");
    closeModal();
  } catch (err) {
    warning.innerText = err.message;
  }
};
