___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "TAG",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "Pingdom RUM",
  "categories": ["ANALYTICS"],
  "brand": {
    "id": "brand_dummy",
    "displayName": "",
    "thumbnail": "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAMAAABEpIrGAAAABGdBTUEAALGPC/xhBQAAACBjSFJNAAB6JgAAgIQAAPoAAACA6AAAdTAAAOpgAAA6mAAAF3CculE8AAAAyVBMVEX/8ADf0gCglwBsZgBeWACTigDQxAD97gCJgQAHBwAAAABoYgD05gBTTgAtKgD36AAYFwA4NQB1bgD+7wATEgAXFgCmnAD66wDd0AAoJgACAgDm2ADZzACDewCimACyqACnnQDn2QD46QAREACBeQCXjgDIvADk1wADAwCSiQBaVQB/eADFuQABAQBKRgC0qQDBtgBZVAAGBgAbGQD26AC4rQAEBACHfwBVUAAWFQA1MgDKvgDUyADGugD15wA2MwCRiADOwgD///81M9rFAAAAAWJLR0RCENc99AAAAAlwSFlzAAACdgAAAnYB2mDjTwAAAAd0SU1FB+EFDBABBJGqBGcAAACjSURBVDjL5dHFEsJAEATQIQRJ4+5uwd0J8v8/xU4Bt53lA9KHVFf1m1yWyIcJWEE7FBbnSNQBJxYXQALfJFPa3eItneG/ZHV7Lg8UiiUqV4BqTQPq6rLBpalKSwPa6rDDpdsD+howUIdDLiMXGAtgwmWqykwA88Vytd4A250AftmTERyOJAD3dFafy5Uk4BDdvLv0VB9gyF/gAQ8joKf9It/mDTsvDYUf//MXAAAAJXRFWHRkYXRlOmNyZWF0ZQAyMDE3LTA1LTEyVDE2OjAxOjA0KzAyOjAwrUK7GAAAACV0RVh0ZGF0ZTptb2RpZnkAMjAxNy0wNS0xMlQxNjowMTowNCswMjowMNwfA6QAAAAZdEVYdFNvZnR3YXJlAHd3dy5pbmtzY2FwZS5vcmeb7jwaAAAAV3pUWHRSYXcgcHJvZmlsZSB0eXBlIGlwdGMAAHic4/IMCHFWKCjKT8vMSeVSAAMjCy5jCxMjE0uTFAMTIESANMNkAyOzVCDL2NTIxMzEHMQHy4BIoEouAOoXEXTyQjWVAAAAAElFTkSuQmCC"
  },
  "description": "Pingdom Real User Monitoring",
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "TEXT",
    "name": "id",
    "displayName": "Pingdom RUM ID",
    "simpleValueType": true,
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      }
    ]
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

const injectScript = require('injectScript');
const queryPermission = require('queryPermission');
const logToConsole = require('logToConsole');

const log = data.debug ? logToConsole : (() => {});
log('data =', data);

const onSuccess = () => {
  log('Script loaded successfully');
  data.gtmOnSuccess();
};

const onFailure = () => {
  log('Script load failed');
  data.gtmOnFailure();
};

const scriptUrlTemplate = 'https://rum-static.pingdom.net/pa-{id}.js';
const scriptUrl = scriptUrlTemplate.replace('{id}', data.id);
log('scriptUrl =', scriptUrl);

if (queryPermission('inject_script', scriptUrl)) {
  injectScript(scriptUrl, onSuccess, onFailure);
} else {
  log('Permissions mismatch');
  onFailure();
}


___WEB_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "logging",
        "versionId": "1"
      },
      "param": [
        {
          "key": "environments",
          "value": {
            "type": 1,
            "string": "debug"
          }
        }
      ]
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "inject_script",
        "versionId": "1"
      },
      "param": [
        {
          "key": "urls",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 1,
                "string": "https://rum-static.pingdom.net/*"
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  }
]


___TESTS___

scenarios: []


___NOTES___

Created on 17/08/2021, 14:49:30


