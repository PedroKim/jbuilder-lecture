import { connect } from 'react-redux';

import SqueakIndex from './squeak_index';
import { fetchSqueaks } from '../../actions/squeak_actions';


const mapStateToProps = state => {
    debugger
    return {
        squeaks: Object.values(state.entities.squeaks)
    };
};

const mapDispatchToProps = dispatch => {
    debugger
    return {
        fetchSqueaks: () => {
            debugger
           return dispatch(fetchSqueaks());
        }
    };
};

export default connect(mapStateToProps, mapDispatchToProps)(SqueakIndex);