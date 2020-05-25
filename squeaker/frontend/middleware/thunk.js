// this is currying
const thunk = store => next => action => {
  debugger
  if (typeof action === 'function') { // check if the action is function
    debugger  
    return action(store.dispatch, store.getState);
    // ^shoot ajax request here, so we didn't hit the controller yet
  }
  // if the action is pojo, it will hit line 8
  return next(action); //if this is the last middleware, the next will be reducer
};

export default thunk;
// same thunk as above

// function thunk2(store) {
//   return function(next) {
//       return function(action) {
//           if (typeof action === 'function') {
//               return action (store.dispatch, store.getState);
//           }
//           return next(action);
//       };
//   };
// }