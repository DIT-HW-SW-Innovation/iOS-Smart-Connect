import type { StorybookConfig } from '@storybook/swift';

const config: StorybookConfig = {
  stories: ['../Sources/**/*.stories.swift'],
  addons: [
    '@storybook/addon-essentials',
    '@storybook/addon-docs',
  ],
  framework: {
    name: '@storybook/swift',
    options: {},
  },
};

export default config;
