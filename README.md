# Jumga Marketplace

- [Jumga App](https://jumga.xyz) -> Uses flw test keys, See [cards](https://github.com/Iamstanlee/jumga-marketplace#test-card-information) for testing

### Tech Stack

- Frontend
  - ReactJs
  - Redux
  - Tailwindcss
- Backend
  - Firebase
  - Nodejs (Express)
  - Heroku

### How It Works

This app works like every other online marketplaces out there,
**Merchants** can register for an account, create a store and start selling and **Buyers** can
register as well, shop and place orders. Though this is an MVP version with alot of features missing, A detailed workflow of the app can be found on [figma](https://www.figma.com/file/6iGYkgIDuOTrT9F9Za8zkd/Jumga?node-id=0%3A1)

### Key Features

- Basic ecommerce functionalities
- Buy and sell
- Accepts payment in **NGN**, **GHS**, **KES**, **EUR**.
- All features specified in the requirements sent via email

### Technical

- The backend/database runs on firebase
- For security, The payment request is processed on the nodejs backend, This backend acts like a
  proxy server that makes http requests to the flutterwave API, With this our secrets keys are not exposed on the client.
- 3 flutterwave APIs were used, the `charges`, `validate-charge` and `rates` APIs, Checkout the implementation [here](server/flw.js)
- The payment UI implementation can be found [here](src/components/payment/card-payment.js)
- The split payment function can be found [here](src/helpers/utils.js#L92)

### Test Card Information

```
    Card number: 5531886652142950
    Cvv: 564
    Expiry: 09/32
    Pin: 3310
    OTP: 12345
    WRONG OTP: 5548
    INSUFFICIENT FUNDS: 6648
```

See other cards from [flw](https://developer.flutterwave.com/docs/test-cards)

<!--
 Card validation
 https://www.w3resource.com/javascript/form/credit-card-validation.php
 -->
