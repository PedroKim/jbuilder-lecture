import squeaksReducer from './squeaks_reducer';
// similar to root reducer but break down to another level 
const entitiesReducer = (state = {}, action) => {
    debugger
    return {
        squeaks: squeaksReducer(state.squeaks, action)
    };
};

export default entitiesReducer;