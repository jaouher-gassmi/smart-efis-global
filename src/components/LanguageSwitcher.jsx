import React from 'react';
import { useTranslation } from 'react-i18next';

const LanguageSwitcher = () => {
  const { i18n } = useTranslation();

  const changeLanguage = (lng) => {
    i18n.changeLanguage(lng);
    localStorage.setItem('lang', lng); // حفظ اللغة المختارة
  };

  return (
    <div style={{ margin: '10px', textAlign: 'right' }}>
      <button onClick={() => changeLanguage('en')} style={{ marginRight: '5px' }}>
        🌐 English
      </button>
      <button onClick={() => changeLanguage('ar')}>
        🌍 العربية
      </button>
    </div>
  );
};

export default LanguageSwitcher;