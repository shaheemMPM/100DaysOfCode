import React, { Component } from 'react';

import Aux from '../Aux/Aux';
import './Layout.css';

class Layout extends Component {
    state = { }

    render () {
        return (
            <Aux>
                <main className="Content">
                    {this.props.children}
                </main>
            </Aux>
        );
    }
}

export default Layout;
