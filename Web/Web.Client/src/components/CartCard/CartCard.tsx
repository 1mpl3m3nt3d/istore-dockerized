import 'reflect-metadata';
import '../../locales/config';

import React from 'react';

import { BuyButtonCart } from 'components/BuyButton';
import { observer } from 'mobx-react';
import { useNavigate } from 'react-router-dom';

import { Card, CardContent, CardMedia, Stack, Typography } from '@mui/material';

import { CartItem } from '../../models';

interface Properties {
  cartItem: CartItem;
}

const CartCard = observer((properties: Properties) => {
  const navigate = useNavigate();
  const { id, brand, type, name, picture, count, price, totalPrice } =
    properties.cartItem;

  return (
    <Card
      className="productCard"
      sx={{
        width: 1000,
        maxWidth: 1000,
        padding: 1.5,
        justifyContent: 'center',
        alignContent: 'center',
        textAlign: 'center',
      }}
    >
      <Stack
        direction="row"
        justifyContent="center"
        justifyItems="center"
        justifySelf="center"
      >
        <CardMedia
          component="img"
          image={picture}
          alt={`${name}`}
          sx={{
            display: 'grid',
            justifyContent: 'center',
            justifyItems: 'center',
            justifySelf: 'center',
            alignContent: 'center',
            alignItems: 'center',
            alignSelf: 'center',
            height: 125,
            maxHeight: 125,
            maxWidth: 175,
            padding: 1.5,
            border: 'dotted',
            borderWidth: 1,
          }}
          onClick={(): void => {
            navigate(`/products/${id}`, { replace: false });
          }}
        />
        <CardContent
          sx={{
            width: 220,
            padding: 1,
            margin: 1,
            textAlign: 'center',
            alignSelf: 'center',
          }}
        >
          <Stack
            direction="column"
            justifyContent="center"
            textAlign="center"
            width={200}
          >
            <Typography>{brand}</Typography>
            <Typography>{name}</Typography>
            <Typography>{type}</Typography>
          </Stack>
        </CardContent>
        <CardContent
          sx={{
            width: 70,
            padding: 1,
            margin: 1,
            textAlign: 'center',
            alignSelf: 'center',
          }}
        >
          <Stack direction="column" justifyContent="center">
            <Typography>{price}</Typography>
          </Stack>
        </CardContent>
        <CardContent
          sx={{
            width: 40,
            padding: 1,
            margin: 1,
            textAlign: 'center',
            alignSelf: 'center',
          }}
        >
          <Stack direction="column" justifyContent="center">
            <Typography>X</Typography>
          </Stack>
        </CardContent>
        <CardContent
          sx={{
            width: 75,
            padding: 1,
            paddingBottom: 1,
            margin: 1,
            textAlign: 'center',
            alignSelf: 'center',
          }}
        >
          <BuyButtonCart count={count} productId={id} />
        </CardContent>
        <CardContent
          sx={{
            width: 40,
            padding: 1,
            paddingBottom: 1,
            margin: 1,
            textAlign: 'center',
            alignSelf: 'center',
          }}
        >
          <Stack direction="column" justifyContent="center">
            <Typography>=</Typography>
          </Stack>
        </CardContent>
        <CardContent
          className="no-pb"
          sx={{
            width: 70,
            padding: 1,
            margin: 1,
            textAlign: 'center',
            alignSelf: 'center',
          }}
        >
          <Stack direction="column" justifyContent="center">
            <Typography>{totalPrice}</Typography>
          </Stack>
        </CardContent>
      </Stack>
    </Card>
  );
});

export default CartCard;
