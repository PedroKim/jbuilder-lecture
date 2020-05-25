import { ADD_SQUEAK, ADD_SQUEAKS } from '../actions/squeak_actions';

const squeaksReducer = (state = {}, action) => {
    Object.freeze(state);
    debugger
    switch(action.type) {
        case ADD_SQUEAK:
            const newSqueak = action.squeak;
            return Object.assign(
                {}, 
                state, 
                {[newSqueak.id]: newSqueak}
            );
        case ADD_SQUEAKS:
            const newState = {};
            action.squeaks.forEach(squeak => {
                newState[squeak.id] = squeak;
            });
            return newState;
        default:
            return state;
    }
};

export default squeaksReducer;