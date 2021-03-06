import 'reflect-metadata';
import './styles.scss';
import './locales/config';

import React from 'react';

import { Provider as IoCProvider } from 'inversify-react';
import { configure as configureMobX } from 'mobx';
import { createRoot } from 'react-dom/client';

import { CssBaseline, ThemeProvider } from '@mui/material';

import { App } from './containers/App';
import { IoCContainer } from './ioc';
import reportWebVitals from './reportWebVitals';
import * as serviceWorkerRegistration from './serviceWorkerRegistration';
import { darkTheme } from './themes';

configureMobX({
  enforceActions: 'never',
});

const container = document.querySelector('#root');
const root = createRoot(container!);

root.render(
  <React.StrictMode>
    <IoCProvider container={IoCContainer}>
      <ThemeProvider theme={darkTheme}>
        <CssBaseline />
        <App />
      </ThemeProvider>
    </IoCProvider>
  </React.StrictMode>
);

// If you want your app to work offline and load faster, you can change
// unregister() to register() below. Note this comes with some pitfalls.
// Learn more about service workers: https://cra.link/PWA
serviceWorkerRegistration.unregister();

// If you want to start measuring performance in your app, pass a function
// to log results (for example: reportWebVitals(console.log))
// or send to an analytics endpoint. Learn more: https://bit.ly/CRA-vitals
void reportWebVitals();
