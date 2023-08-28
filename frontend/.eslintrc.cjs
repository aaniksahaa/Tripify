module.exports = {
  extends: ['prettier', 'airbnb-base'],
  parserOptions: {
    ecmaVersion: 12,
  },
  env: {
    node: true,
    jsx: true,
  },
  rules: {
    'no-console': 0,
    indent: 0,
    'linebreak-style': 0,
    'no-unused-vars': 'off',
    'react/prop-types': 'off',
    'react-refresh/only-export-components': 'off',
    'prettier/prettier': [
      'error',
      {
        trailingComma: 'es5',
        singleQuote: true,
        printWidth: 100,
        tabWidth: 4,
        semi: true,
      },
    ],
  },
  plugins: ['prettier'],
};
