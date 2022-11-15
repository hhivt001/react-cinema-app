import React from 'react';
import { Provider } from 'react-redux';
// Changing Switch to Routes to test version naming upgrades.
import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';

import './App.scss';
import store from './redux/store';
import Header from './components/header/Header';
import Main from './components/main/Main';
import Details from './components/content/details/Details';
import ErrorPage from './components/error/ErrorPage';

const App = () => {
  return (
    <Provider store={store}>
      <Router>
        <Header />
        <div className="app">
{/* Changed Switch to Routes. Changed component to element. Changed element={Name} to element={<Name/>}. */}
          <Routes>
            <Route exact path="/" element={<Main/>} />
            <Route exact path="/:id/:name/details" element={<Details/>} />
            <Route path="*" element={<ErrorPage/>} />
          </Routes>
        </div>
      </Router>
    </Provider>
  );
};

export default App;
