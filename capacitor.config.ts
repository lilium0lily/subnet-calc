import type { CapacitorConfig } from '@capacitor/cli';

const config: CapacitorConfig = {
  appId: 'com.subnetcalc.app',
  appName: '子网掩码计算器',
  webDir: 'www',
  server: {
    iosScheme: 'subnetcalc',
    allowNavigation: []
  },
  ios: {
    contentInset: 'always',
    scheme: 'SubnetCalc',
    backgroundColor: '#f0f2f5',
    allowsLinkPreview: false
  }
};

export default config;
