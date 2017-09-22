import React from 'react';
import { Card, Image, Divider } from 'semantic-ui-react';
import { connect } from 'react-redux';
import axios from 'axios';
import { setHeaders } from '../actions/headers';

class FindFriends extends React.Component {
  state = { users: [] }

  componentDidMount() {
    axios.get('/api/users')
      .then( res => {
        this.props.dispatch(setHeaders(res.headers))
        this.setState({ users: res.data })
      });
  }

  render() {
    let { users } = this.state;
    return (
      <Card.Group itemsPerRow={4}>
        { users.map( user =>
            <Card key={user.id}>
              <Card.Content>
                <Image src={user.image} />
                <Divider />
                <Card.Header>
                  {user.name}
                </Card.Header>
              </Card.Content>
            </Card>
          )
        }
      </Card.Group>
    )
  }
}

// const mapStateToProps = state => {
//   return { users: state.user };
// };

export default connect()(FindFriends)
