import React, { Component } from 'react';

import './MultiSelector.css';

class MultiSelector extends Component {
    state = { 

    }
    
    render() { 
        return (
            <section>
                <div className="box-all" id="outBox">
                    <ul className="selected-items" id="setTags">
                        <li className="inlist-item">
                            hello <button className="item-close" >×</button>
                        </li>
                    </ul>
                    <auto-complete>
                        <input type="text" name="tag" id="ipTag" className="tag-ip" />
                        <ul className="suggest-list" id="sugList">
                            {/* <li className="suggest-list-item">Test hello</li> */}
                        </ul>
                    </auto-complete>
                </div>
            </section>
        );
    }
}
 
export default MultiSelector;