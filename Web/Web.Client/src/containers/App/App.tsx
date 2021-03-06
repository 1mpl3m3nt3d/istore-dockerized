import 'reflect-metadata';
import '../../locales/config';

import React from 'react';

import { observer } from 'mobx-react';

import { AppRoutes } from '../../routes';

const App = observer(() => {
  return <AppRoutes />;
});

export default App;
