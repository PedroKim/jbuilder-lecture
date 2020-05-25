import { connect } from 'react-redux';

import { createSqueak } from '../../actions/squeak_actions';
import SqueakForm from './squeak_form';


// const mapStateToProps = state => {
//     return {};
// };

const mapDispatchToProps = dispatch => {
    return {
        addSqueak: squeak => {
            debugger
            return dispatch(createSqueak(squeak))
        }
    };
};

export default connect(null, mapDispatchToProps)(SqueakForm);