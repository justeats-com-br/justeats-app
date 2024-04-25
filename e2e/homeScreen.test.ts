import {beforeAll, beforeEach, describe, it} from "@jest/globals";
import {expect} from "detox";

describe('Home screen', () => {
  beforeAll(async () => {
    await device.launchApp();
  });

  beforeEach(async () => {
    await device.reloadReactNative();
  });

  it('"Welcome" text should be visible', async () => {
    await expect(element(by.id('welcomeText'))).toHaveText('Welcome to JustEats!');
  });
});
