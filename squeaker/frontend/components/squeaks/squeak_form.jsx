import React from 'react';

class SqueakForm extends React.Component {
    constructor(props) {
        super(props);

        this.state = {body: ''};
        this.handleSubmit = this.handleSubmit.bind(this);
    }

    update(field) {
        return (e) => {
            this.setState({ [field]: e.target.value });
        };
    }

    handleSubmit(e) {
        e.preventDefault();
        debugger
        const newSqueak = { 
            body: this.state.body,
            author_id: 1
         };

        this.props.addSqueak(newSqueak);
        this.setState({ body: '' });
    }

    render() {
        return (
            <>
                <h3>Squeak a new squeak!</h3>
                <form onSubmit={this.handleSubmit}>
                    <label htmlFor='squeak-body'>Body: </label>
                    <input 
                        type='text'
                        id='quack-body'
                        onChange={this.update('body')}
                        value={this.state.body}
                    />

                    <button>Squeak it!</button>
                </form>
            </>
        )
    }
}

export default SqueakForm;