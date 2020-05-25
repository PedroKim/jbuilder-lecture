import React from 'react';
import { Provider } from 'react-redux';

import SqueakFormContainer from './squeaks/squeak_form_container';
import SqueakIndexContainer from './squeaks/squeak_index_container';

const App = ({ store }) => {
    debugger

    return (
        <Provider store={store}>
            <>
                <SqueakIndexContainer />
                <SqueakFormContainer />
            </> 
        </Provider>
    )
}

export default App;