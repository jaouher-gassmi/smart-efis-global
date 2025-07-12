import React from 'react';
import { useTranslation } from 'react-i18next';
import LanguageSwitcher from './components/LanguageSwitcher';

const App = () => {
  const { t } = useTranslation();

  return (
    <div style={{ padding: '2rem', textAlign: 'center' }}>
      <LanguageSwitcher />
      <h1>{t("loading") || "Smart EFIS Global Ready"}</h1>
      <p>🚀 نظام الطيران يعمل بدون لوحة القيادة حالياً.</p>
    </div>
  );
};

export default App;
