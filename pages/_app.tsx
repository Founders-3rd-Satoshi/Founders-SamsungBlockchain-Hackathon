import App from "next/app";
import React from "react";

class CustomApp extends App {
  // Fetching serialized(JSON) store state
  static async getInitialProps(appContext: any) {
    const appProps = await App.getInitialProps(appContext);

    return {
      ...appProps
    };
  }

  render() {
    const { Component, pageProps, router } = this.props;
    return (
      <Component {...pageProps} asPath={router.asPath} query={router.query} />
    );
  }
}
export default CustomApp;
