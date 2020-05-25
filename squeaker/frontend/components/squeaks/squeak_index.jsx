import React from 'react';

class SqueakIndex extends React.Component {
    constructor(props) {
        super(props);
    }

    componentDidMount() {
        debugger
        this.props.fetchSqueaks().then(() => { console.log("hello")})
    }

    render() {
        debugger
        if (this.props.squeaks.length === 0) {
            return (
                <span>No squeaks yet!</span>
            )
        }
        
        const squeakLis = this.props.squeaks.map(squeak => {
            return <li key={squeak.id}>{squeak.body}</li>
        });

        return (
            <>
                <h3>All the squeaks so far!</h3>
                <ul>
                    {squeakLis}
                </ul>
            </>
        )
    }
}

export default SqueakIndex;