import { createStore, applyMiddleware } from 'redux';
import thunk from '../middleware/thunk';
import logger from 'redux-logger';
import rootReducer from '../reducers/root_reducer';

const configureStore = (preloadedState = {}) => {
    return createStore(rootReducer, preloadedState, applyMiddleware(thunk, logger)); 
    //logger must be the last middleware and it will look into pojos
};

export default configureStore;