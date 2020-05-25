import * as SqueakAPIUtil from "../util/squeak_api_util";
export const ADD_SQUEAK = "ADD_SQUEAK";
export const ADD_SQUEAKS = "ADD_SQUEAKS";

let nextId = 3;

export const receiveSqueak = squeak => {
    // nextId++;
    debugger
    return {
        type: ADD_SQUEAK,
        squeak: squeak
    };
};

export const receiveSqueaks = squeaks => {
    debugger
    return {
        type: ADD_SQUEAKS,
        squeaks
    };
};

//thunk action creators (it returns a function)
export const fetchSqueaks = function(){
    debugger
    return function(dispatch){
        debugger //when we look at the args, we will see store.getState as well
        return SqueakAPIUtil.fetchSqueaks().then(squeaks => {
            debugger
            return dispatch(receiveSqueaks(squeaks));
        });
    };
};

export const createSqueak = (squeak) => dispatch => {
    return SqueakAPIUtil.createSqueak(squeak).then( res => {
        return dispatch(receiveSqueak(res));
    });
};

// window.addSqueak = addSqueak;