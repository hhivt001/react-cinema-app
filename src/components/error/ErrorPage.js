import React from 'react';
import { Link } from 'react-router-dom';

import './ErrorPage.scss';

const ErrorPage = () => {
  return (
    <div className="error-page">
      <h1 className="error-header">Oh, Nose!</h1>
      <p className="error-msg">Something, something just ain&apos;t right.</p>
      <Link className="error-link" to={'/'}>
        <i className="icon-home"></i> Go back to the Home Page.
      </Link>
    </div>
  );
};

export default ErrorPage;
