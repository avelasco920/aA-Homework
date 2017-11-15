import React from 'react';
import { configureStore } from '../store/store';
import GiphysIndex from './giphys_index';
import { fetchSearchGiphys } from '../util/api_util';
import { receiveSearchGiphys } from '../actions/giphy_actions.js';

document.addEventListener('DOMContentLoaded', () => {
  const store = configureStore();
  window.store = store;
  window.fetchSearchGiphys = fetchSearchGiphys;
  window.receiveSearchGiphys = receiveSearchGiphys;
});
