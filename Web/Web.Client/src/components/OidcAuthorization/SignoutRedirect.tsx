import React, { useEffect } from 'react';

import { Box } from '@mui/material';

import { IoCTypes, useInjection } from '../../ioc';
import { AuthStore } from '../../stores';
import { LoadingSpinner } from '../LoadingSpinner';

function SignoutRedirect(): JSX.Element {
  const authStore = useInjection<AuthStore>(IoCTypes.authStore);

  useEffect(() => {
    const signoutRedirect = async (): Promise<void> => {
      await authStore.signoutRedirect();
    };

    signoutRedirect().catch((error) => {
      console.log(error);
    });
  }, [authStore]);

  return (
    <Box className="absoluteCentered">
      <LoadingSpinner />
    </Box>
  );
}

export default SignoutRedirect;
