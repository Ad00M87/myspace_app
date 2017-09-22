import React, { Component } from 'react';
import { Header, Image, Grid, Card, Container, Form, Button } from 'semantic-ui-react';
import axios from 'axios';
import { connect } from 'react-redux';
import { Link } from 'react-router-dom';
import { setHeaders } from '../actions/headers';
import Dropzone from 'react-dropzone';

class Home extends Component {
  state = { posts: [] }

  componentDidMount() {
    axios.get('/api/posts/')
      .then( res => {
        this.props.dispatch(setHeaders(res.headers))
        this.setState({ posts: res.data })
      })
  }

  onDrop = (image) => {
    this.setState({ image: image })
  }

  addPost = (post) => {
    const { posts } = this.state;
    this.setState({ post, ...posts})
  }

  render() {
    return (
      <div>
      <Header as='h1' textAlign='center'>MySpace</Header>
      <Container>
        <Grid>
          <Grid.Column width={4}>
            <Card>
              <Image src={this.props.user.image} />
              <Card.Content>
                <Card.Header>
                  {this.props.user.name}
                </Card.Header>
                <Card.Description>
                  <h4>Narrative:</h4>
                  <p>“Learning something new can be a scary experience.
                     One of the hardest things I've ever had to do was learn how to swim.
                     I was always afraid of the water, but I decided that
                     swimming was an important skill that I should learn.
                     I also thought it would be good exercise and help me
                     to become physically stronger. What I didn't realize was
                     that learning to swim would also make me a more confident person.
                     New situations always make me a bit nervous, and my first
                     swimming lesson was no exception. After I changed into my
                     bathing suit in the locker room, I stood timidly by the
                     side of the pool waiting for the teacher and other
                     students to show up. After a couple of minutes the
                     teacher came over. She smiled and introduced herself,
                     and two more students joined us. Although they were
                     both older than me, they didn't seem to be embarrassed
                     about not knowing how to swim. I began to feel more at ease.”
                   </p>
                </Card.Description>
              </Card.Content>
          </Card>
          </Grid.Column>
          <Grid.Column width={8}>
            <Card.Group itemsPerRow={2}>
              { this.state.posts.map( post =>
                <Card>
                  <Image src={post.image} />
                  <Card.Content>
                    <Card.Header>
                      {post.title}
                    </Card.Header>
                    <Card.Description>
                      {post.body}
                    </Card.Description>
                  </Card.Content>
                  <Card.Content extra>
                    <Link to={`/api/posts/${post.id}`}>Show Post</Link>
                  </Card.Content>
                </Card>
              )}
            </Card.Group>
          </Grid.Column>
          <Grid.Column width={4}>
          </Grid.Column>
        </Grid>
      </Container>
      </div>
    );
  }
}

const mapStateToProps = state => {
  return { user: state.user };
};

export default connect(mapStateToProps)(Home);
